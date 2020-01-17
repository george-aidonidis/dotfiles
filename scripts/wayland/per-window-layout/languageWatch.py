#!/usr/bin/env python3

import os
from i3ipc import Connection, Event
from subprocess import call
from helpers import getActiveLanguage

import subprocess

windows = {}
default = "0"

print("Current keyboard:", os.environ.get('KEYBOARD', '1:1:AT_Translated_Set_2_keyboard'))
KEYBOARD = os.environ.get('KEYBOARD', '1:1:AT_Translated_Set_2_keyboard')

i3 = Connection()

def getWinId(i3):
	try:
	    focused = i3.get_tree().find_focused()
	    name = "%s-%s"%(focused.app_id,focused.id)
	    return name
	except AttributeError as e:
		print('Error:',e)

def onInput(i3, e):
    windows[getWinId(i3)] = e.input.xkb_active_layout_index

def onFocus(i3, e):
    name = getWinId(i3)
    lay = windows.get(name,default)
    print(f'lay: {lay}')
    inputs = i3.get_inputs()
    curlay = getActiveLanguage(inputs)
    print("cur=",curlay,"desired=",lay)
    if str(curlay) != str(lay):
        print("switching")
        call(["swaymsg", f"input {KEYBOARD} xkb_switch_layout {lay}"])

i3.on(Event.INPUT, onInput)
i3.on(Event.WINDOW_FOCUS, onFocus)

i3.main()
