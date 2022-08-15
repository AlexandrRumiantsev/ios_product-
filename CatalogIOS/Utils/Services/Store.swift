//
//  Store.swift
//  CatalogIOS
//
//  Created by Румянцев Александр Дмитриевич on 15.08.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import Foundation

/// Хранилище данных
final class Store {

    static var User: (Any)? = nil
    
    func add(type: String, data: Any){
        print(data)
        switch(type){
            case "user":
                Store.User = data
            break;
        default:
            print("ADD ERROR!")
        }
    
    }

    
}
