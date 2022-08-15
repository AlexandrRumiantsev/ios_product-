//
//  HomeTitle.swift
//  CatalogIOS
//
//  Created by Александр on 03/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class BaseLabel: UILabel {
    
    func setText(text: String) {
        self.text = text
    }

    init(colorText: UIColor, text: String, size: CGFloat) {
        super.init(frame: .zero)
        
        self.isUserInteractionEnabled = true
        //без этого анкоры не работают
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.text = text
        self.font = self.font.withSize(size)
        self.textColor = colorText
        self.textAlignment = .center
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit HomeTitle")
    }

}
