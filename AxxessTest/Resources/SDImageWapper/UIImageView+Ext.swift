//
//  UIImageView+Ext.swift
//  AxxessTest
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import SDWebImage

// Wapper for SDWebImage

extension UIImageView {
    
    func getImageFromUrl(with path: String){
        if let url = URL(string: path) {
            self.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholderImage"))
        }
    }
    
}
