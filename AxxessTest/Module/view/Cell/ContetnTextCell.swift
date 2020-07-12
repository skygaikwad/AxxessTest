//
//  ContetnTextCell.swift
//  AxxessTest
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit

class ContetnTextCell: UITableViewCell {
    
    static let identifer = "ContetnTextCell"
    
    lazy var lblCardText = UILabel.initSubHeadingLabel(withColor: UIColor.appColor(.black), withTextAlignment: .left, lines: 0)

    lazy var lblCardId = UILabel.initSubHeadingLabel(withColor: UIColor.appColor(.blue), withTextAlignment: .left, lines: 0)
    lazy var lblDate = UILabel.initBodyLightLabel(withColor: UIColor.appColor(.lightGray), withTextAlignment: .right, lines: 0)
    
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
        lblCardText.text = "\(viewModel.data ?? "")"
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
        viewBackground.addSubview(lblCardText)
        self.setupAutoLayout()
    }
    
    
    func setupAutoLayout() {
        self.viewBackground.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, margin: .init(top: 8, left: 16, bottom: 4, right: 16))
        
        lblCardId.anchor(top: viewBackground.topAnchor, leading: viewBackground.leadingAnchor, bottom: nil, trailing: nil, margin: .init(top: 16, left: 16, bottom: 16, right: 0))
        lblCardId.setContentHuggingPriority(.defaultLow, for: .horizontal)
        lblDate.anchor(top: viewBackground.topAnchor, leading: lblCardId.trailingAnchor, bottom: nil, trailing: viewBackground.trailingAnchor, margin: .init(top: 16, left: 0, bottom: 0, right: 16))
        
        lblCardText.anchor(top: lblCardId.bottomAnchor, leading: viewBackground.leadingAnchor, bottom: viewBackground.bottomAnchor, trailing: viewBackground.trailingAnchor, margin: .init(top: 8, left: 16, bottom: 8, right: 16))

        
    }
    
    
    
    
}
