//
//  ColorExtensions.swift
//  Colours-iOS
//
//  Created by Eric Eddy on 2020-01-20.
//  Copyright © 2020 Eric Eddy. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    
    public class var light_rainbow_11: UIColor { return UIColor(rgb: 0xff6666) }
    public class var light_rainbow_12: UIColor { return UIColor(rgb: 0xff8766) }
    public class var light_rainbow_13: UIColor { return UIColor(rgb: 0xff9666) }
    public class var light_rainbow_14: UIColor { return UIColor(rgb: 0xffa866) }
    
    public class var light_rainbow_21: UIColor { return UIColor(rgb: 0xffb366) }
    public class var light_rainbow_22: UIColor { return UIColor(rgb: 0xffc466) }
    public class var light_rainbow_23: UIColor { return UIColor(rgb: 0xffd966) }
    public class var light_rainbow_24: UIColor { return UIColor(rgb: 0xffeb66) }
    
    public class var light_rainbow_31: UIColor { return UIColor(rgb: 0xffff66) }
    public class var light_rainbow_32: UIColor { return UIColor(rgb: 0xe3ff66) }
    public class var light_rainbow_33: UIColor { return UIColor(rgb: 0xd6ff66) }
    public class var light_rainbow_34: UIColor { return UIColor(rgb: 0xbaff66) }
    
    public class var light_rainbow_51: UIColor { return UIColor(rgb: 0x66ff66) }
    public class var light_rainbow_52: UIColor { return UIColor(rgb: 0x61f277) }
    public class var light_rainbow_53: UIColor { return UIColor(rgb: 0x5ce68a) }
    public class var light_rainbow_54: UIColor { return UIColor(rgb: 0x57d9a5) }
    
    public class var light_rainbow_61: UIColor { return UIColor(rgb: 0x52cccc) }
    public class var light_rainbow_62: UIColor { return UIColor(rgb: 0x52adcc) }
    public class var light_rainbow_63: UIColor { return UIColor(rgb: 0x528fcc) }
    public class var light_rainbow_64: UIColor { return UIColor(rgb: 0x5270cc) }
    
    public class var light_rainbow_71: UIColor { return UIColor(rgb: 0x5252cc) }
    public class var light_rainbow_72: UIColor { return UIColor(rgb: 0x7052cc) }
    public class var light_rainbow_73: UIColor { return UIColor(rgb: 0x9054cc) }
    public class var light_rainbow_74: UIColor { return UIColor(rgb: 0xad52cc) }

    public class var light_rainbow_81: UIColor { return UIColor(rgb: 0xcc52cc) }
    public class var light_rainbow_82: UIColor { return UIColor(rgb: 0xd957a5) }
    public class var light_rainbow_83: UIColor { return UIColor(rgb: 0xe65c8a) }
    public class var light_rainbow_84: UIColor { return UIColor(rgb: 0xf26177) }
}
