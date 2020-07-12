//
//  ContentImageCell.swift
//  AxxessTest
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit

class ContentImageCell: UITableViewCell {
    
    static let identifer = "ContentImageCell"
    
    lazy var lblCardId = UILabel.initSubHeadingLabel(withColor: UIColor.appColor(.blue), withTextAlignment: .left, lines: 0)
    lazy var lblDate = UILabel.initBodyLightLabel(withColor: UIColor.appColor(.lightGray), withTextAlignment: .right, lines: 0)
    
    var imgData : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFill
        img.layer.borderColor = UIColor.appColor(.lightGray)?.cgColor
        img.layer.borderWidth = 1.0
        img.layer.cornerRadius = 8
        img.layer.masksToBounds = true
        return img
    }()

    
    let viewBackground : CardView = {
        let view = CardView()
        return view
    }()
    
    var viewModel : ContentModel? {
        didSet{
            if let model = viewModel {
                self.configCell(with: model)
            }
        }
    }
    func configCell(with viewModel: ContentModel)  {
        
        lblDate.text = "\(viewModel.date ?? "")"
        lblCardId.text = "Card Id: \(viewModel.id ?? "")"
        imgData.getImageFromUrl(with: "\(viewModel.data ?? "")")
    }
//
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configUI() {
        self.addSubview(self.viewBackground)
        viewBackground.addSubview(lblCardId)
        viewBackground.addSubview(lblDate)
        viewBackground.addSubview(imgData)
        self.setupAutoLayout()
    }
    
    
    func setupAutoLayout() {
        self.viewBackground.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, margin: .init(top: 8, left: 16, bottom: 4, right: 16))
        
        lblCardId.anchor(top: viewBackground.topAnchor, leading: viewBackground.leadingAnchor, bottom: nil, trailing: nil, margin: .init(top: 16, left: 16, bottom: 16, right: 0))
        lblCardId.setContentHuggingPriority(.defaultLow, for: .horizontal)
        lblDate.anchor(top: viewBackground.topAnchor, leading: lblCardId.trailingAnchor, bottom: nil, trailing: viewBackground.trailingAnchor, margin: .init(top: 16, left: 0, bottom: 0, right: 16))
        
        imgData.anchor(top: lblCardId.bottomAnchor, leading: viewBackground.leadingAnchor, bottom: viewBackground.bottomAnchor, trailing: viewBackground.trailingAnchor, margin: .init(top: 8, left: 16, bottom: 8, right: 16), size: .init(width: 0, height: 150))
    }
    
    
    
    
}
