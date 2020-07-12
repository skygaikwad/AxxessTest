//
//  JGSPageMenuCell.swift
//  AxxessTest
//
//  Created by apple on 7/7/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit

class TopMenuCell: UICollectionViewCell {
    static let identifer = "TopMenuCell"
    
    lazy var lblTitle : UILabel = {
        let lbl = UILabel.initSubHeadingLabel(withColor: UIColor.appColor(.lightGray), lines: 0)
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    lazy var viewCircle : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }()
    
    var strTitle : String? {
        didSet{
            if let title = strTitle {
                lblTitle.text = title                
            }
        }
    }
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubView()
        setupAutoLayout()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAddSubView()
        setupAutoLayout()
//        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet{
            if isSelected == true {
                UIView.animate(withDuration: 0.33) {
                    self.updateSelected()
                    self.updateCornerRadi()
                }
            }else{
                UIView.animate(withDuration: 0.33) {
                    self.updateDeSelected()
                }
            }
        }
    }
    

    func updateDeSelected() {
        viewCircle.backgroundColor = .clear
        lblTitle.textColor = UIColor.appColor(.lightGray)
        
    }
    func updateSelected() {
        viewCircle.backgroundColor = UIColor.appColor(.blue)
        lblTitle.textColor = UIColor.black
        
    }
    func updateCornerRadi() {
        self.layoutIfNeeded()
        self.viewCircle.layer.cornerRadius = viewCircle.frame.height*0.5
        self.viewCircle.layer.masksToBounds = true
    }
    
    func setupAddSubView() {
        self.addSubview(viewCircle)
        self.addSubview(lblTitle)
    }
    func setupAutoLayout() {
        self.lblTitle.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, margin: .init(top: 4, left: 4, bottom: 16, right: 4))
//        self.lblTitle.setContentHuggingPriority(.defaultLow, for: .horizontal)
        self.viewCircle.anchor(top: lblTitle.bottomAnchor, margin: .init(top: 2, left: 0, bottom: 0, right: 0), size: .init(width: 8, height: 8))
        self.viewCircle.centerX(inView: lblTitle)
    }
    
    //forces the system to do one layout pass
//    var isHeightCalculated: Bool = false
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        //Exhibit A - We need to cache our calculation to prevent a crash.
////        if !isHeightCalculated {
//            setNeedsLayout()
//            layoutIfNeeded()
//            let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//            var newFrame = layoutAttributes.frame
//            newFrame.size.width = CGFloat(ceilf(Float(size.width)))
//            layoutAttributes.frame = newFrame
////            isHeightCalculated = true
////        }
//        return layoutAttributes
//    }
    
}
