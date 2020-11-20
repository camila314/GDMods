# -*- coding: utf-8 -*-
#
#  ViewController.py
#  TPEditor
#
#  Created by Full Name on 10/14/20.
#  Copyright (c) 2020 camden314. All rights reserved.
#

#import os
#import sys

from Foundation import *
from AppKit import *
from TextureItem import *
from objc import IBOutlet, IBAction, YES, NO, nil

import os.path
from PIL import Image
import plistlib
import json
from fuzzywuzzy import fuzz

class ViewController(NSViewController):
    collectionView = IBOutlet()
    searchBar = IBOutlet()
    def viewDidLoad(self):
        self.pngfile = None
        self.plistfile = None
        self.pils = []
       
        nib = NSNib.alloc().initWithNibNamed_bundle_("TextureItem",nil)
        self.collectionView.registerNib_forItemWithIdentifier_(nib,"TextureItemIdent")
        self.collectionView.setDataSource_(self)
        print("hi")
        
        NSNotificationCenter.defaultCenter().addObserver_selector_name_object_(self, objc.selector(self.setIcon_,signature="v@:#"), "SetIcon", nil)

        self.tpSize = (0,0)
        
    @IBAction
    def chooseTexture_(self, sender):
        panel = NSOpenPanel.openPanel()
        panel.setCanChooseFiles_(YES)
        panel.setCanChooseDirectories_(NO)
        panel.setAllowsMultipleSelection_(NO)
        panel.setDelegate_(self)
        
        clicked = panel.runModal()
        if clicked==NSFileHandlingPanelOKButton:
            self.pngfile = panel.URLs()[0].path()
            self.plistfile = os.path.splitext(self.pngfile)[0]+'.plist'
            self.loadTexture()

    @IBAction
    def exportTexture_(self, sender):
        panel = NSSavePanel.savePanel()
        panel.setTitle_("Save Texture")

        panel.setCanChooseFiles_(YES)
        panel.setCanChooseDirectories_(NO)
        panel.setAllowsMultipleSelection_(NO)
        panel.setAllowedFileTypes_(['png'])
        panel.setIsExtensionHidden_(NO)
        
        clicked = panel.runModal()
        if clicked==NSFileHandlingPanelOKButton:
            self.exportToLocation_(panel.URL().path())
            
    def panel_shouldShowFilename_(self, panel, file):
        try:
            file = str(file)
            if os.path.isdir(file):
                return YES
            plistfile, _ = os.path.splitext(file)
            if not file.endswith('.png'):
                return NO
            
            if not os.path.isfile(plistfile+'.plist'):
                return NO

            return YES
        except:
            return NO
    def loadTexture(self):
        png = Image.open(self.pngfile)
        self.tpSize = png.size

        self.pils = []
        plist = open(self.plistfile,'r').read().replace('{','[').replace('}',']').encode()
        plist = plistlib.readPlistFromString(plist)['frames']

        # for speed
        _loads = json.loads
        _crop = png.crop

        for key in plist:
            obj = plist[key]
            lists = _loads(obj['textureRect']) if 'textureRect' in obj else _loads(obj['frame'])

            pos_left, pos_top = lists[0]
            width, height = lists[1]

            if obj['textureRotated' if 'textureRotated' in obj else 'rotated']:
                objectPng = _crop((pos_left,pos_top,pos_left+height,pos_top+width))
                objectPng = objectPng.rotate(90,expand=True)
            else:
                objectPng = _crop((pos_left,pos_top,pos_left+width,pos_top+height))
            
            
            c = {'key': key, 'pngdata': objectPng, 'rotated': obj['textureRotated' if 'textureRotated' in obj else 'rotated'], 'pos': (pos_left,pos_top)}
            self.pils.append(c)
            print(key)
        self.collectionView.reloadData()
    def collectionView_numberOfItemsInSection_(self, view, section):
        return len(self.pils)

    def collectionView_itemForRepresentedObjectAtIndexPath_(self, view, index):
        c = self.collectionView.makeItemWithIdentifier_forIndexPath_("TextureItemIdent", index)
        dta = self.pils[index.indexAtPosition_(1)]
        c.setKey_image_rotated_position_index_(dta['key'], dta['pngdata'], dta['rotated'], dta['pos'], index.indexAtPosition_(1))
        return c

    def setIcon_(self, notif):
        dat = notif.userInfo()
        self.pils[dat["index"]]['pngdata'] = dat['image']

    def exportToLocation_(self, location):
        print("epic moment",location)
        base = Image.new('RGBA',self.tpSize)
        for texture in self.pils:
            textureImage = texture['pngdata']
            if texture['rotated']:
                textureImage = textureImage.rotate(-90,expand=True)
            base.paste(textureImage,texture['pos'])
        base.save(location)
    
    @IBAction
    def searchTexture_(self, sender):
        print(self.searchBar.stringValue())
        self.collectionView.reloadData()
    def collectionView_layout_sizeForItemAtIndexPath_(self, view,layout,index):
        s1 = self.pils[index.indexAtPosition_(1)]["key"].lower()
        s2 = self.searchBar.stringValue().lower()
        
        if fuzz.partial_ratio(s2, s1) < 80 and len(s2)>0:
            return NSSize(0,0)
        else:
            return NSSize(128,128)
