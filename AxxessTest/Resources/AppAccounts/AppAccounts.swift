//
//  AppAccounts.swift
//  AxxessTest
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation

struct AppAccounts {
    enum JGSKeyChainKeys: String {
        case saveAPIDataKey  = "saveAPIData"
        
    }
    
    // MARK: - Properties
    
    var arrayContents : [ContentModel]? {
        get {
            do{
                guard let dataObj = KeychainWrapper.standard.data(forKey: JGSKeyChainKeys.saveAPIDataKey.rawValue) else { return nil }
                let model = try JSONDecoder().decode([ContentModel].self, from: dataObj)
                return model
            }catch {
                debugPrint("\(error)")
                return nil
            }
        }
        set(newValue) {
            guard let currentValue = newValue else {
                KeychainWrapper.standard.removeObject(forKey: JGSKeyChainKeys.saveAPIDataKey.rawValue)
                return
            }
            do{
                let jsonObj = try JSONEncoder().encode(currentValue)
                KeychainWrapper.standard.set(jsonObj, forKey: JGSKeyChainKeys.saveAPIDataKey.rawValue)
            }catch {
                debugPrint("\(error)")
                return
            }
        }
    }
        
    static func earseAllPreviousData() {
        KeychainWrapper.wipeKeychain()
    }
    
}
