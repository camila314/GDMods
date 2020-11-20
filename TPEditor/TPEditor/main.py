# -*- coding: utf-8 -*-
#
#  main.py
#  TPEditor
#
#  Created by Full Name on 10/14/20.
#  Copyright (c) 2020 camden314. All rights reserved.
#

# import modules required by application
import objc
import Foundation
import AppKit

from PyObjCTools import AppHelper

# import modules containing classes required to start application and load MainMenu.nib
import AppDelegate
import ViewController
import PusabFieldCell
import InvisibleTextField
# pass control to AppKit
AppHelper.runEventLoop()
