//
//  CardView.swift
//  AxxessTest
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit

class CardView: UIView {
    private var shadowLayer: CAShapeLayer!

    @IBInspectable var cornerRadius: CGFloat = CGFloat(8) {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()

         if shadowLayer == nil {
             shadowLayer = CAShapeLayer()
             shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
             shadowLayer.fillColor = UIColor.white.cgColor

            shadowLayer.shadowColor = UIColor.appColor(.shadowColor)?.cgColor
             shadowLayer.shadowPath = shadowLayer.path
             shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
             shadowLayer.shadowOpacity = 0.8
             shadowLayer.shadowRadius = 2

             layer.insertSublayer(shadowLayer, at: 0)
             //layer.insertSublayer(shadowLayer, below: nil) // also works
         }else{
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.shadowPath = shadowLayer.path

        }
     }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
