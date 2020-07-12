//
//  UILabel+Ext.swift
//  AxxessTest
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit
extension UILabel {
    
    class func initHeadingLabel(withColor color: UIColor? = nil, withTextAlignment alignment:NSTextAlignment? = nil, lines: Int? = nil) -> UILabel {
        let label = UILabel()
        if color != nil {
            label.textColor = color
        }else{
            if let defaultColor = UIColor.appColor(.black) {
                label.textColor = defaultColor
            }else{
                label.textColor = .black
            }
        }
        if let align = alignment {
            label.textAlignment = align
        }else{
            label.textAlignment = .left
        }
        if let count = lines {
            label.numberOfLines = count
        }else{
            label.numberOfLines = 0
        }
        
        label.font = UIFont.appMediumFont(ofSize: .huge)
        return label
    }
    
    class func initSubHeadingLabel(withColor color: UIColor? = nil, withTextAlignment alignment:NSTextAlignment? = nil, lines: Int? = nil, fontSize: AppFontSizes? = nil) -> UILabel {
        let label = UILabel()
        if color != nil {
            label.textColor = color
        }else{
            if let defaultColor = UIColor.appColor(.black) {
                label.textColor = defaultColor
            }else{
                label.textColor = .black
            }
        }
        if let align = alignment {
            label.textAlignment = align
        }else{
            label.textAlignment = .left
        }
        if let count = lines {
            label.numberOfLines = count
        }else{
            label.numberOfLines = 0
        }

        if let size = fontSize {
            label.font = UIFont.appMediumFont(ofSize: size)
        }else{
            label.font = UIFont.appMediumFont(ofSize: .large)
        }
        return label
    }
    
    class func initBodyLightLabel(withColor color: UIColor? = nil, withTextAlignment alignment:NSTextAlignment? = nil, lines: Int? = nil, fontSize: AppFontSizes? = nil) -> UILabel {
        let label = UILabel()
        if color != nil {
            label.textColor = color
        }else{
            if let defaultColor = UIColor.appColor(.darkGray) {
                label.textColor = defaultColor
            }else{
                label.textColor = .gray
            }
        }
        if let align = alignment {
            label.textAlignment = align
        }else{
            label.textAlignment = .left
        }
        if let count = lines {
            label.numberOfLines = count
        }else{
            label.numberOfLines = 0
        }
        if let size = fontSize {
            label.font = UIFont.appLightFont(ofSize: size)
        }else{
            label.font = UIFont.appLightFont(ofSize: .large)
        }
        return label
    }
}
