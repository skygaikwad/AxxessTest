//
//  UIColor+Ext.swift
//  AxxessTest
//
//  Created by apple on 7/11/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit

enum AssetsColor {
    case orange
    case white
    case green
    case black
    case darkGray
    case lightGray
    case red
    case backgroundColor
    case extraLighGrey
    case shadowColor
    case yellow
    case blue
    
    
}

extension UIColor {
    
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .orange:
            return UIColor(named: "AppOrange")
        case .white:
            return UIColor(named: "AppWhite")
        case .green:
            return UIColor(named: "AppGreen")
        case .black:
            return UIColor(named: "AppBlack")
        case .darkGray:
            return UIColor(named: "AppDarkGrey")
        case .lightGray:
            return UIColor(named: "AppLightGrey")
        case .red:
            return UIColor(named: "AppRed")
        case .backgroundColor:
            return UIColor(named: "AppBackground")
        case .extraLighGrey:
            return UIColor(named: "AppExtraLightGrey")
        case .shadowColor:
            return UIColor(named: "AppShadow")
        case .yellow:
            return UIColor(named: "AppYellow")
        case .blue:
                return UIColor(named: "AppBlue")

        }
        
    }
}
