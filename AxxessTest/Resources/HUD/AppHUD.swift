//
//  AppHud.swift
//  AxxessTest
//
//  Created by apple on 6/17/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit
import SVProgressHUD

struct AppHUD {
    
    static func show(onView: UIView? = nil) {
        SVProgressHUD.setDefaultStyle(.light)
        SVProgressHUD.setRingThickness(4)
        SVProgressHUD.setForegroundColor(UIColor.appColor(.blue) ?? UIColor.black)
        SVProgressHUD.setDefaultAnimationType(.flat)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setBorderWidth(0)
        SVProgressHUD.setBorderColor(UIColor.clear)

        SVProgressHUD.show()
    }
    
    static func remove(onView: UIView? = nil, handler:(()->Void)? = nil) {
        SVProgressHUD.dismiss(completion: handler)
    }
    static func removeAfterDelay(delay: Double? = nil){
        SVProgressHUD.dismiss(withDelay: delay ?? 2.50)
    }
    
    static func showSuccessToast(onView: UIView? = nil, withText: String? = nil) {
        SVProgressHUD.setOffsetFromCenter(.init(horizontal: 0, vertical: 190))
        SVProgressHUD.showSuccess(withStatus: "\(withText ?? "")")
        SVProgressHUD.setForegroundColor(UIColor.appColor(.blue) ?? UIColor.black)
        SVProgressHUD.setBorderWidth(2)
        SVProgressHUD.setBorderColor(UIColor.appColor(.blue) ?? UIColor.black)

        SVProgressHUD.setDefaultAnimationType(.flat)
    }
    
    static func showErrorToast(onView: UIView? = nil, withText: String? = nil) {
        SVProgressHUD.setOffsetFromCenter(.init(horizontal: 0, vertical: 190))
        SVProgressHUD.showError(withStatus: "\(withText ?? "")")
        SVProgressHUD.setForegroundColor(UIColor.appColor(.blue) ?? UIColor.black)
        SVProgressHUD.setDefaultAnimationType(.flat)
        SVProgressHUD.setBorderWidth(2)
        SVProgressHUD.setBorderColor(UIColor.appColor(.blue) ?? UIColor.black)

    }

}
// Border
//SVProgressHUD.setBorderColor(UIColor.appColor(.blue) ?? UIColor.black)
//SVProgressHUD.setBorderWidth(1)

