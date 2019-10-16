def getActiveLanguage(inputs):
	for input in inputs:
		if input.identifier == "1:1:AT_Translated_Set_2_keyboard":
			return input.xkb_active_layout_index
