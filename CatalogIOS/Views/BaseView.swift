//
//  BaseView.swift
//  CatalogIOS
//
//  Created by Александр on 02/03/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    func setMainTitle(positionX: Int, positionY: Int){
        var title: UILabel
        title = UILabel()
        title.text = "xasxas"
        title.frame = CGRect(
            x: positionX,
            y: positionY,
            width: 100,
            height: 100
        )
        self.addSubview(title)
    }
    
    func setUILabel(positionX: Int, positionY: Int, key: Array<String>){
        var field: UILabel
        field = UILabel()
        field.text = key["text"] as! String
        field.frame = CGRect(
            x: positionX as! Int,
            y: positionY as! Int,
            width: key["width"] as! Int,
            height: key["height"] as! Int
        )
        self.addSubview(field)
    }
    
    func setUITextField(){
        var field: UITextField
        field = UITextField()
        field.text = key["text"] as! String
        field.frame = CGRect(
            x: positionX as! Int,
            y: positionY as! Int,
            width: key["width"] as! Int,
            height: key["height"] as! Int
        )
        self.addSubview(field)
    }
    
    func setUIButton(){
        var field: UIButton
        field = UIButton()
        field.setTitle(key["text"] as! String, for: .normal)
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .red
        
        field.frame = CGRect(
            x: positionX as! Int,
            y: positionY as! Int,
            width: key["width"] as! Int,
            height: key["height"] as! Int
        )
        //field.addTarget(field, action: #selector(key["click"]), for: .touchUpInside)
        self.addSubview(field)
    }
    
    

}
