//
//  AppView.swift
//  CatalogIOS
//
//  Created by Александр on 04/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class AppView: UIView {
    
    let baseBackground: UIView = UIViewSupport.getBaseBackground()
    
    init() {
        super.init(frame: .zero)
        self.addSubview(
            self.baseBackground
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

