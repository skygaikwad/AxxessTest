//
//  ContentViewController.swift
//  AxxessTest
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    let viewModel = ContentViewModel(withAPIManage: APIManager())
    
    var arrayContents : [ContentModel]?
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        //        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    var pageMenu: TopMenu?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageMenu()
        setupAddView()
        setupAutoLayout()
        setupTableView()
        viewModel.getAllContents()
        
        // Do any additional setup after loading the view.
    }
    
    func setupPageMenu() {
        pageMenu = TopMenu(with: ["All", "Text", "Images"])
        pageMenu?.delegate = self
        pageMenu?.showSelectedIndex(with: 0)
    }
    
    // MARK: - TableView & layouts
    func setupAddView() {
        guard let menu = pageMenu else { return }
        self.view.addSubview(menu)
        self.view.addSubview(tableView)
        
    }
    func setupAutoLayout() {
        pageMenu?.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, margin: .init(top: 8, left: 16, bottom: 0, right: 8), size: .init(width: 0, height: 40))
        tableView.anchor(top: pageMenu?.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, margin: .init(top: 8, left: 0, bottom: 0, right: 0))
        
    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContetnTextCell.self, forCellReuseIdentifier: ContetnTextCell.identifer)
        tableView.register(ContentImageCell.self, forCellReuseIdentifier: ContentImageCell.identifer)

        viewModel.items.bind { [weak self] (array) in
            self?.arrayContents = array
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
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
// MARK: - TableView Delegate

extension ContentViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayContents?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = self.arrayContents?[indexPath.row] else { return UITableViewCell() }
        if model.type == ContentTypeEnum.image {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentImageCell.identifer, for: indexPath) as? ContentImageCell
                else { return UITableViewCell() }
            cell.viewModel = model
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContetnTextCell.identifer, for: indexPath) as? ContetnTextCell
                else { return UITableViewCell() }
            cell.viewModel = model
            return cell

        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = self.arrayContents?[indexPath.row] {
            let vcDetail = ContentDetailViewController()
            vcDetail.viewModel = model
            vcDetail.view.backgroundColor = .white
            self.present(vcDetail, animated: true, completion: nil)
            
        }
    }
    
}

// MARK: - Delegate Menu
extension ContentViewController : TopMenuDelegate {
    func didSelectMenuItem(with item: String, index: Int) {
        switch index {
        case 0:
            arrayContents = viewModel.filterOutItems()
        case 1:
            arrayContents = viewModel.filterOutItems(contentType: .text)
        case 2:
            arrayContents = viewModel.filterOutItems(contentType: .image)
        default:
            break
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    
}
