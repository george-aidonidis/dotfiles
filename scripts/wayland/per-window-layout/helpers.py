import os

KEYBOARD = os.environ.get('KEYBOARD', '1:1:AT_Translated_Set_2_keyboard')

def getActiveLanguage(inputs):
	for input in inputs:
		if input.identifier == KEYBOARD:
			return input.xkb_active_layout_index
