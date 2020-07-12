//
//  ContentDetailViewController.swift
//  AxxessTest
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit

class ContentDetailViewController: UIViewController {

    lazy var lblCardText = UILabel.initSubHeadingLabel(withColor: UIColor.appColor(.black), withTextAlignment: .left, lines: 0)

    lazy var lblCardId = UILabel.initSubHeadingLabel(withColor: UIColor.appColor(.blue), withTextAlignment: .left, lines: 0)
    lazy var lblDate = UILabel.initBodyLightLabel(withColor: UIColor.appColor(.lightGray), withTextAlignment: .right, lines: 0)
    
    var imgData : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFit
        img.layer.borderColor = UIColor.appColor(.lightGray)?.cgColor
        img.layer.borderWidth = 1.0
        img.layer.cornerRadius = 8
        img.layer.masksToBounds = true
        img.isHidden = true
        return img
    }()

    let viewBackground : CardView = {
        let view = CardView()
        return view
    }()
    
    lazy var lblTitle = UILabel.initSubHeadingLabel(withColor: UIColor.appColor(.black), withTextAlignment: .center, lines: 0)


    let scrollView = UIScrollView()
    
    let btnClose : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "close"), for: .normal)
        btn.addTarget(self, action: #selector(btnCloseAction), for: .touchUpInside)
        return btn
    }()

    
    
    var viewModel : ContentModel? {
        didSet{
            if let model = viewModel {
                self.configView(with: model)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    // MARK: - btn Action
    
    @objc func btnCloseAction()  {
        self.dismiss(animated: true, completion: nil)
    }

    
    // MARK: - Data Binding
    
    func configView(with viewModel: ContentModel)  {
        
        lblDate.text = "\(viewModel.date ?? "")"
        lblCardId.text = "Card Id: \(viewModel.id ?? "")"
        lblCardText.text = "\(viewModel.data ?? "")"
        lblTitle.text = "\(viewModel.type?.rawValue.uppercased() ?? "") DETAILS"
        if viewModel.type == ContentTypeEnum.image {
            imgData.isHidden = false
            lblCardText.isHidden = true
            imgData.getImageFromUrl(with: "\(viewModel.data ?? "")")
        }else{
            lblCardText.isHidden = false
            imgData.isHidden = true
        }
    }
    
    // MARK: - Layout
    func configUI() {
        self.view.addSubview(lblTitle)
        self.view.addSubview(self.viewBackground)
        self.view.addSubview(btnClose)
        viewBackground.addSubview(scrollView)
        scrollView.addSubview(lblCardId)
        scrollView.addSubview(lblDate)
        scrollView.addSubview(lblCardText)
        scrollView.addSubview(imgData)
        
        self.setupAutoLayout()
    }
    
    
    func setupAutoLayout() {
        self.lblTitle.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, margin: .init(top: 16, left: 0, bottom: 0, right: 8))
        
        btnClose.anchor(top: view.safeAreaLayoutGuide.topAnchor, trailing: view.trailingAnchor, margin: .init(top: 8, left: 0, bottom: 0, right: 8), size: .init(width: 40, height: 40))

        
        self.viewBackground.anchor(top: btnClose.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, margin: .init(top: 16, left: 16, bottom: 16, right: 16))
        
        scrollView.anchorToFillView(viewBackground)
        
        lblCardId.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: nil, trailing: nil, margin: .init(top: 16, left: 16, bottom: 16, right: 0))
        lblCardId.setContentHuggingPriority(.defaultLow, for: .horizontal)
        lblDate.anchor(top: scrollView.topAnchor, leading: lblCardId.trailingAnchor, bottom: nil, trailing: scrollView.trailingAnchor, margin: .init(top: 16, left: 0, bottom: 0, right: 16))
        
        lblCardText.anchor(top: lblCardId.bottomAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, margin: .init(top: 8, left: 16, bottom: 8, right: 16))
        lblCardText.anchor(leading: viewBackground.leadingAnchor, trailing: viewBackground.trailingAnchor, margin: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        imgData.anchor(top: lblCardId.bottomAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, margin: .init(top: 8, left: 16, bottom: 8, right: 16))

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
