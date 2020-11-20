# -*- coding: utf-8 -*-
#
#  TextureItem.py
#  TPEditor
#
#  Created by Full Name on 10/22/20.
#  Copyright (c) 2020 camden314. All rights reserved.
#

from Foundation import *
from AppKit import *
from objc import nil, IBOutlet, IBAction
import io
from PIL import Image

class TextureItem(NSCollectionViewItem):
    icon = IBOutlet()
    
    def loadImage(self):
        imageobject = io.BytesIO()
        imgdata = self.image.copy()
        imgdata.thumbnail((88,88),Image.ANTIALIAS)
        imgdata.save(imageobject,format='png')

        imageobject.seek(0)
        
        dataout =imageobject.read()
        
        d = NSData.alloc().initWithBytes_length_(dataout, len(dataout))
        nsimg = NSImage.alloc().initWithData_(d)
        self.icon.setImage_(nsimg)
    def setKey_image_rotated_position_index_(self,key,image,rotated,position,index):
        
        self.key = key
        self.image = image
        self.rotated = rotated
        self.position = position
        self.index = index
        
        self.loadImage()
    def viewDidLoad(self):
        super(NSCollectionViewItem,self).viewDidLoad()
    
    @IBAction
    def changeIcon_(self, sender):
        panel = NSOpenPanel.openPanel()
        panel.setCanChooseFiles_(YES)
        panel.setCanChooseDirectories_(NO)
        panel.setAllowsMultipleSelection_(NO)
        panel.setAllowedFileTypes_(NSImage.imageTypes())
        
        clicked = panel.runModal()
        if clicked==NSFileHandlingPanelOKButton:
            self.image = Image.open(panel.URLs()[0].path()).resize(self.image.size)
            self.loadImage()
            NSNotificationCenter.defaultCenter().postNotificationName_object_userInfo_("SetIcon",self,{"image":self.image, "index":self.index})
