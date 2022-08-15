//
//  GoodAdapter.swift
//  CatalogIOS
//
//  Created by Румянцев Александр Дмитриевич on 11.08.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import Foundation

func goodAdapter(goods: [GoodFields]) -> [CustomData]{
    
    let UIImageSupport = UIImageSupport()
    var array: [CustomData] = []

    goods.forEach { good in
        var newGood = CustomData(
            title: good.TITLE,
            backgroundImage: UIImageSupport.getForUrl(
                url: good.IMG
            ),
            id: good.ID,
            discr: good.DISCR,
            count: good.COUNT,
            price: good.PRICE,
            sizes: good.SIZES,
            category: good.CATEGORY,
            comments: good.COMMENTS
        )
        
        array.append(newGood)
    }
    
    return array
    
}
