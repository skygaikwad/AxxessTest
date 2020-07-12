//
//  ContentViewModel.swift
//  AxxessTest
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation

class ContentViewModel {
    
    private let api : APINetworkable?
    
    init(withAPIManage: APINetworkable) {
        api = withAPIManage
    }

    var items : Box<[ContentModel]?> = Box(nil)

    
    
    // MARK: - API
    func getAllContents()  {
        AppHUD.show()
        api?.excuteRequest(withAPI: .getContents) { (result) in
            switch result {
            case .success(let response):
                AppHUD.remove()
                self.items.value = response
                var user = AppAccounts()
                user.arrayContents = self.items.value
            case .failure(let error):
                AppHUD.remove()
                self.items.value = AppAccounts().arrayContents ?? nil
                AppHUD.showErrorToast(onView: nil, withText: error.rawValue)
                print(error)
            }
        }
        
    }
    
    func filterOutItems(contentType : ContentTypeEnum? = nil)-> [ContentModel]?  {
        guard let type = contentType else { return items.value }
        guard let arrayContents = self.items.value else { return nil }
        let array = arrayContents.filter({$0.type == type })
        return array
    }
    
    
}
