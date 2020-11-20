# -*- coding: utf-8 -*-
#
#  AppDelegate.py
#  TPEditor
#
#  Created by Full Name on 10/14/20.
#  Copyright (c) 2020 camden314. All rights reserved.
#

from objc import IBAction, YES, NO
from Foundation import *
from AppKit import *

class AppDelegate(NSObject):
    def applicationDidFinishLaunching_(self, sender):
        NSLog("Application did finish launching.")
