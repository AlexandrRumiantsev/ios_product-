//
//  LoginField.swift
//  CatalogIOS
//
//  Created by Александр on 03/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class BaseField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.borderWidth = 3;
        self.autocapitalizationType = .none
        self.textAlignment = .center
        self.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit LoginField")
    }
    
}
