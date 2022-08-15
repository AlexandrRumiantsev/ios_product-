//
//  UserProtocol.swift
//  CatalogIOS
//
//  Created by Румянцев Александр Дмитриевич on 12.07.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

protocol UserProtocol {

}

extension UserProtocol {
    
    func getItem(login: String, password: String, errorLabel: UILabel, completion: @escaping ([UserFields])->()) -> Void {
        
        let userModel: UserModel = UserModel()

        userModel.getItem(
            login: login,
            password: password,
            errorLabel: errorLabel,
            completion: completion
        )
        
    }
    
}

