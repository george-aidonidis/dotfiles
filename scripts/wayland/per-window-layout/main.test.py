import unittest
import json
from helpers import getActiveLanguage

usFixture = [
  {
    "identifier": "6058:20564:ThinkPad_Extra_Buttons",
    "name": "ThinkPad Extra Buttons",
    "vendor": 6058,
    "product": 20564,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "2:10:TPPS/2_IBM_TrackPoint",
    "name": "TPPS/2 IBM TrackPoint",
    "vendor": 2,
    "product": 10,
    "type": "pointer",
    "libinput": {
      "send_events": "enabled",
      "accel_speed": 0,
      "accel_profile": "adaptive",
      "natural_scroll": "disabled",
      "left_handed": "disabled",
      "middle_emulation": "disabled",
      "scroll_method": "on_button_down",
      "scroll_button": 274
    }
  },
  {
    "identifier": "2:7:SynPS/2_Synaptics_TouchPad",
    "name": "SynPS/2 Synaptics TouchPad",
    "vendor": 2,
    "product": 7,
    "type": "touchpad",
    "libinput": {
      "send_events": "enabled",
      "tap": "enabled",
      "tap_button_map": "lrm",
      "tap_drag": "enabled",
      "tap_drag_lock": "disabled",
      "accel_speed": 0,
      "accel_profile": "none",
      "natural_scroll": "disabled",
      "left_handed": "disabled",
      "click_method": "button_areas",
      "middle_emulation": "disabled",
      "scroll_method": "two_finger",
      "dwt": "enabled"
    }
  },
  {
    "identifier": "1:1:AT_Translated_Set_2_keyboard",
    "name": "AT Translated Set 2 keyboard",
    "vendor": 1,
    "product": 1,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "1226:28774:Integrated_Camera:_Integrated_C",
    "name": "Integrated Camera: Integrated C",
    "vendor": 1226,
    "product": 28774,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "0:3:Sleep_Button",
    "name": "Sleep Button",
    "vendor": 0,
    "product": 3,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "0:5:Lid_Switch",
    "name": "Lid Switch",
    "vendor": 0,
    "product": 5,
    "type": "switch",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "0:6:Video_Bus",
    "name": "Video Bus",
    "vendor": 0,
    "product": 6,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "0:1:Power_Button",
    "name": "Power Button",
    "vendor": 0,
    "product": 1,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  }
]
elFixture = [
  {
    "identifier": "6058:20564:ThinkPad_Extra_Buttons",
    "name": "ThinkPad Extra Buttons",
    "vendor": 6058,
    "product": 20564,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "2:10:TPPS/2_IBM_TrackPoint",
    "name": "TPPS/2 IBM TrackPoint",
    "vendor": 2,
    "product": 10,
    "type": "pointer",
    "libinput": {
      "send_events": "enabled",
      "accel_speed": 0,
      "accel_profile": "adaptive",
      "natural_scroll": "disabled",
      "left_handed": "disabled",
      "middle_emulation": "disabled",
      "scroll_method": "on_button_down",
      "scroll_button": 274
    }
  },
  {
    "identifier": "2:7:SynPS/2_Synaptics_TouchPad",
    "name": "SynPS/2 Synaptics TouchPad",
    "vendor": 2,
    "product": 7,
    "type": "touchpad",
    "libinput": {
      "send_events": "enabled",
      "tap": "enabled",
      "tap_button_map": "lrm",
      "tap_drag": "enabled",
      "tap_drag_lock": "disabled",
      "accel_speed": 0,
      "accel_profile": "none",
      "natural_scroll": "disabled",
      "left_handed": "disabled",
      "click_method": "button_areas",
      "middle_emulation": "disabled",
      "scroll_method": "two_finger",
      "dwt": "enabled"
    }
  },
  {
    "identifier": "1:1:AT_Translated_Set_2_keyboard",
    "name": "AT Translated Set 2 keyboard",
    "vendor": 1,
    "product": 1,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 1,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "1226:28774:Integrated_Camera:_Integrated_C",
    "name": "Integrated Camera: Integrated C",
    "vendor": 1226,
    "product": 28774,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "0:3:Sleep_Button",
    "name": "Sleep Button",
    "vendor": 0,
    "product": 3,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "0:5:Lid_Switch",
    "name": "Lid Switch",
    "vendor": 0,
    "product": 5,
    "type": "switch",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "0:6:Video_Bus",
    "name": "Video Bus",
    "vendor": 0,
    "product": 6,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  },
  {
    "identifier": "0:1:Power_Button",
    "name": "Power Button",
    "vendor": 0,
    "product": 1,
    "type": "keyboard",
    "xkb_layout_names": [
      "English (US)",
      "Greek"
    ],
    "xkb_active_layout_index": 0,
    "xkb_active_layout_name": "English (US)",
    "libinput": {
      "send_events": "enabled"
    }
  }
]

class TestSum(unittest.TestCase):

    def test_active_layout(self):
        self.assertEqual(getActiveLanguage(usFixture), 0, "will return index 0")

    def test_active_layout_changed(self):
        self.assertEqual(getActiveLanguage(elFixture), 1, "will return index 1")

if __name__ == '__main__':
    unittest.main()
