//
//  ColorPreferences.swift
//  Colours-iOS
//
//  Created by Eric Eddy on 2020-01-30.
//  Copyright © 2020 Eric Eddy. All rights reserved.
//

import Foundation

class ColorPreferences {
    static var KEY_TOUCH_TYPE = "KEY_TOUCH_TYPE"
    static var KEY_TOUCH_TYPE_COLOUR = "KEY_TOUCH_TYPE_COLOUR"
    static var KEY_TOUCH_SIZE = "KEY_TOUCH_SIZE"
    static var KEY_PLAYING_FORWARDS = "KEY_PLAYING_FORWARDS"
    static var KEY_PLAYING_SPEED = "KEY_PLAYING_SPEED"
    static var KEY_THEME = "KEY_THEME"
    
    static func getTouchType() -> Int { return UserDefaults.standard.integer(forKey: KEY_TOUCH_TYPE) }
    static func setTouchType(_ value: Int) { setPreference(value, KEY_TOUCH_TYPE) }
    
    static func getTouchColor() -> Int { return UserDefaults.standard.integer(forKey: KEY_TOUCH_TYPE_COLOUR) }
    static func setTouchColor(_ value: Int) { setPreference(value, KEY_TOUCH_TYPE_COLOUR) }
    
    static func getTouchSize() -> Int { return UserDefaults.standard.integer(forKey: KEY_TOUCH_SIZE) }
    static func setTouchSize(_ value: Int) { setPreference(value, KEY_TOUCH_SIZE) }
    
    static func getPlayingForwards() -> Bool { return UserDefaults.standard.bool(forKey: KEY_PLAYING_FORWARDS) }
    static func setPlayingForwards(_ value: Bool) { setPreference(value, KEY_PLAYING_FORWARDS) }
    
    static func getPlayingSpeed() -> Float { return UserDefaults.standard.float(forKey: KEY_PLAYING_SPEED) }
    static func setPlayingSpeed(_ value: Float) { setPreference(value, KEY_PLAYING_SPEED) }
    
    static func getTheme() -> Int { return UserDefaults.standard.integer(forKey: KEY_THEME) }
    static func setTheme(_ value: Int) { setPreference(value, KEY_THEME) }
    
    static private func setPreference(_ value: Any, _ key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
}
