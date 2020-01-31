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


extension UIView {
    func pinToView(_ pinTo: UIView, _ top: CGFloat = 0, _ bottom: CGFloat = 0, _ left: CGFloat = 0, _ right: CGFloat = 0){
        setupForAutoLayout(self)
        setupForAutoLayout(pinTo)
        let lc_t = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: pinTo, attribute: .top, multiplier: 1, constant: top)
        let lc_b = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: pinTo, attribute: .bottom, multiplier: 1, constant: bottom)
        let lc_l = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: pinTo, attribute: .left, multiplier: 1, constant: left)
        let lc_r = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: pinTo, attribute: .right, multiplier: 1, constant: right)
        pinTo.addConstraints([ lc_t, lc_b, lc_l, lc_r ])
    }
    func pinToView(_ pinTo: UIView, _ attr: NSLayoutConstraint.Attribute, _ attr2: NSLayoutConstraint.Attribute? = nil, _ const: CGFloat = 0) -> NSLayoutConstraint {
        let attr2 = attr2 == nil ? attr : attr2!
        setupForAutoLayout(self)
        setupForAutoLayout(pinTo)
        let lc = NSLayoutConstraint(item: self, attribute: attr, relatedBy: .equal, toItem: pinTo, attribute: attr2, multiplier: 1, constant: const)
        self.addConstraint(lc)
        return lc
    }
    func setHeightWidth(height: CGFloat? = nil, width: CGFloat? = nil) {
        setupForAutoLayout(self)
        if let height = height {
            self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: height))
        }
        if let width = width {
            self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: width))
        }
    }
    
    func getConstraint(_ attr: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        if let constraint = (self.constraints.filter{$0.firstAttribute == attr}.first) {
            return constraint
        }
        return nil
    }
        
        
    
    func setupForAutoLayout(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
