//
//  JGSPageMenu.swift
//  AxxessTest
//
//  Created by apple on 7/7/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit

protocol TopMenuDelegate: AnyObject {
    func didSelectMenuItem(with item: String, index: Int)
}


class TopMenu: UIView {
    
    var collectionView:UICollectionView?
    
    var arrayItems : [String]?
    
    weak var delegate : TopMenuDelegate?
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    init(with items: [String]?) {
        super.init(frame: .zero)
        arrayItems = items
        setupCollectionView()
        setupAddView()
        setupAutoLayout()
        self.setNeedsLayout()
        
    }
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        self.setupCollectionView()
        //        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setupAutoLayout() {
        collectionView?.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    
    func setupAddView() {
        self.addSubview(collectionView!)
    }
    
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 0
        //        layout.estimatedItemSize = CGSize(width: 100, height: 35)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView?.register(TopMenuCell.self, forCellWithReuseIdentifier: TopMenuCell.identifer)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.allowsSelection = true
        collectionView?.allowsMultipleSelection = false
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    func showSelectedIndex(with index: Int) {
        collectionView?.selectItem(at: .init(item: 0, section: 0), animated: true, scrollPosition: .top)
        if let delegation = delegate {
            if let model  = arrayItems?[0] {
                delegation.didSelectMenuItem(with: model, index: 0)
            }
        }
        
    }
    
}

extension TopMenu : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopMenuCell.identifer, for: indexPath) as? TopMenuCell else {return UICollectionViewCell()}
        if let title  = arrayItems?[indexPath.item] {
            cell.strTitle = title
        }
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let name  = arrayItems?[indexPath.item] ?? ""
        let width = self.estimatedCellFrame(text: name).width + 16
        return CGSize(width: width, height: 39)
    }
    
    func estimatedCellFrame(text: String) -> CGRect {
        let size = CGSize(width: UIApplication.shared.windows.first?.frame.width ?? 200 , height: 1000) // temporary size
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.appMediumFont(ofSize: .large)], context: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
        if let delegation = delegate {
            if let model  = arrayItems?[indexPath.item] {
                delegation.didSelectMenuItem(with: model, index: indexPath.item)
            }
        }
    }
    
    
}
