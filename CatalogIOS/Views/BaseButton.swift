//
//  Button.swift
//  CatalogIOS
//
//  Created by Александр on 03/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    init(text: String) {
            
        super.init(frame: .zero)
        
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setTitle(text, for: .normal)

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
