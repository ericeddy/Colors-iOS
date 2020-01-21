//
//  Helper.swift
//  Colours-iOS
//
//  Created by Eric Eddy on 2020-01-20.
//  Copyright © 2020 Eric Eddy. All rights reserved.
//

import UIKit

class Helper {
    
    static func getSelectedColors() -> [UIColor] {
        return getLightRainbow()
    }
    
    static func getLightRainbow() -> [UIColor] {
        return [
            UIColor.light_rainbow_11, UIColor.light_rainbow_12, UIColor.light_rainbow_13, UIColor.light_rainbow_14,
            UIColor.light_rainbow_21, UIColor.light_rainbow_22, UIColor.light_rainbow_23, UIColor.light_rainbow_24,
            UIColor.light_rainbow_31, UIColor.light_rainbow_32, UIColor.light_rainbow_33, UIColor.light_rainbow_34,
            UIColor.light_rainbow_51, UIColor.light_rainbow_52, UIColor.light_rainbow_53, UIColor.light_rainbow_54,
            UIColor.light_rainbow_61, UIColor.light_rainbow_62, UIColor.light_rainbow_63, UIColor.light_rainbow_64,
            UIColor.light_rainbow_71, UIColor.light_rainbow_72, UIColor.light_rainbow_73, UIColor.light_rainbow_74,
            UIColor.light_rainbow_81, UIColor.light_rainbow_82, UIColor.light_rainbow_83, UIColor.light_rainbow_84, ]
    }
}
