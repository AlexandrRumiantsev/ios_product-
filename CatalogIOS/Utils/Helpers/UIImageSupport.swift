//
//  UIImageSupport.swift
//  CatalogIOS
//
//  Created by Румянцев Александр Дмитриевич on 12.07.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class UIImageSupport{
    func getForUrl(url: String) -> UIImage{
        do {
            let currentUrl = URL(string: url)
            if let data = try? Data(contentsOf: currentUrl!)
            {
                guard var img = UIImage(
                    data: data
                ) else { return UIImage()}
                
                return img
            }
        }
        catch{
            print(error)
        }
        
        return UIImage()
    }
}

