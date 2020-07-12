//
//  Font+Ext.swift
//  AxxessTest
//
//  Created by apple on 6/9/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func appRegularFont(ofSize fontSize: AppFontSizes) -> UIFont {
        return UIFont(name: "\(AppFonts.regular.rawValue)", size: fontSize.rawValue) ?? UIFont.systemFont(ofSize: fontSize.rawValue)
    }
    class func appMediumFont(ofSize fontSize: AppFontSizes) -> UIFont {
        return UIFont(name: "\(AppFonts.medium.rawValue)", size: fontSize.rawValue) ?? UIFont.systemFont(ofSize: fontSize.rawValue)
    }
    class func appMediumItalicFont(ofSize fontSize: AppFontSizes) -> UIFont {
        return UIFont(name: "\(AppFonts.mediumItalic.rawValue)", size: fontSize.rawValue) ?? UIFont.systemFont(ofSize: fontSize.rawValue)
    }
    class func appBoldFont(ofSize fontSize: AppFontSizes) -> UIFont {
//        print("\(AppFonts.bold.rawValue)")
        return UIFont(name: "\(AppFonts.bold.rawValue)", size: fontSize.rawValue) ?? UIFont.systemFont(ofSize: fontSize.rawValue)
    }
    class func appLightFont(ofSize fontSize: AppFontSizes) -> UIFont {
        return UIFont(name: "\(AppFonts.light.rawValue)", size: fontSize.rawValue) ?? UIFont.systemFont(ofSize: fontSize.rawValue)
    }
    class func appLightItalicFont(ofSize fontSize: AppFontSizes) -> UIFont {
        return UIFont(name: "\(AppFonts.lightItalic.rawValue)", size: fontSize.rawValue) ?? UIFont.systemFont(ofSize: fontSize.rawValue)
    }

}
