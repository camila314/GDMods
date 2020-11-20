# -*- coding: utf-8 -*-
#
#  InvisibleTextField.py
#  TPEditor
#
#  Created by Full Name on 10/23/20.
#  Copyright (c) 2020 camden314. All rights reserved.
#

from Foundation import *
from AppKit import *

class InvisibleTextField(NSTextField):
    def becomeFirstResponder(self):
        success = NSTextField.becomeFirstResponder(self)
        if success:
            textField = self.currentEditor()
            #textField.setInsertionPointColor_(NSColor.clearColor())
        return success
    def setStringValue_(self, stringValue):
        paragraphStyle = NSMutableParagraphStyle.alloc().init()
        paragraphStyle.setAlignment_(NSTextAlignmentCenter)
        attributes = {
                        "NSStrokeWidthAttributeName": 3,
                        "NSForegroundColorAttributeName": NSColor.whiteColor(),
                        "NSStrokeColorAttributeName": NSColor.blackColor(),
                        "NSParagraphStyleAttributeName": paragraphStyle,
                        "NSBaselineOffsetAttributeName": 3.0
                        
        }
        print("well actually")
        str = NSAttributedString.alloc().initWithString_attributes_(stringValue, attributes)
        self.setAttributedStringValue_(str)
        self.sizeToFit()
