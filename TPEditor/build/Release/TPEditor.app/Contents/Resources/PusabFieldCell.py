# -*- coding: utf-8 -*-
#
#  PusabFieldCell.py
#  TPEditor
#
#  Created by Full Name on 10/23/20.
#  Copyright (c) 2020 camden314. All rights reserved.
#

from Foundation import *
from AppKit import *

class PusabFieldCell(NSTextFieldCell):
    def focusRingType(self):
        return NSFocusRingTypeNone
