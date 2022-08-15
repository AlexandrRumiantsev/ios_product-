//
//  User.swift
//  CatalogIOS
//
//  Created by Александр on 01/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

public class UserModel: ModelProtocol {
    
    var api: ApiServices!
    let actionsGetItem: String = "getUser"
    
    struct DefaultsKeys {
        static let NAME = "NAME";
        static let FAMILY = "FAMILY";
        static let AUTH_ERROR = "AUTH_ERROR";
    }
    
    
    init() {
        self.api = ApiServices(
            apiURL: SettingNames().SERVER_URL
        )
    }
    
    func getItem(login: String, password: String, errorLabel: UILabel, completion: @escaping ([UserFields])->()) -> Void  {

        self.api.query(
            params: [
                "action": self.actionsGetItem,
                "LOGIN": login,
                "PASSWORD": password
            ],
            complete: { data in
            
            do {
                let userInfo: [UserFields] = try JSONDecoder().decode([UserFields].self, from: data!)
                completion(userInfo)
            } catch {
                errorLabel.text = ErrorNames.SERVER_ERROR
            }
            

        })
         
    }
    
    deinit {
        print("deinit UserModel")
    }
    
}
