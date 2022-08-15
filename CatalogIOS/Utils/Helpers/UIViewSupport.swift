//
//  UIViewSupport.swift
//  CatalogIOS
//
//  Created by Румянцев Александр Дмитриевич on 12.07.2022.
//  Copyright © 2022 Александр. All rights reserved.
//
import UIKit

class UIViewSupport{
    
    static let bgFileName: String = "bg.jpeg"
    
    static func getBaseBackground() -> UIView{
       
       let bgView = UIView()
       bgView.isUserInteractionEnabled = true
       bgView.translatesAutoresizingMaskIntoConstraints = false
       bgView.backgroundColor = UIColor(patternImage: UIImage(named: self.bgFileName)!)
       let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
       let blurEffectView = UIVisualEffectView(effect: blurEffect)
       blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       blurEffectView.alpha = 0.8
       bgView.addSubview(blurEffectView)
       return bgView
        
    }
}
