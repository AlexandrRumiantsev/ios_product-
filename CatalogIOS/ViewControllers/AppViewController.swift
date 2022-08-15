//
//  AppController.swift
//  CatalogIOS
//
//  Created by Александр on 08/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit
import CoreData

struct CustomData {
    var title: String
    var backgroundImage: UIImage
    var id: String
    var discr: String
    var count: String
    var price: String
    var sizes: String
    var category: String
    var comments: String
}

class MyTapGesture: UITapGestureRecognizer {
    var operation = String()
}


class AppViewController: UIViewController, UICollectionViewDelegate {

    let goodModel: GoodModel
    let baseBackground: UIView
    let countInString: Int = 2
    
    var data: Array = [CustomData]()
    
    init(
        baseBackground: UIView,
        goodModel: GoodModel
    ){
        self.baseBackground = UIViewSupport.getBaseBackground()
        self.goodModel = GoodModel(uiImageSupport: UIImageSupport())
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func goToDetail(_ sender: UITapGestureRecognizer) {}
    
    fileprivate let pageTitle: UILabel = {
        
        let yourLabel = UILabel()
        yourLabel.translatesAutoresizingMaskIntoConstraints = false
        yourLabel.textColor = .white
        yourLabel.textAlignment = .center
        yourLabel.text = "Каталог товаров"
        yourLabel.backgroundColor = UIColor.black.withAlphaComponent(0)
        return yourLabel
        
    }()

    
    func renderGoodList(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.red.withAlphaComponent(0)
        
        self.baseBackground.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        //set click img
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.goToDetail(_:)))
        collectionView.addGestureRecognizer(guestureRecognizer)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //let goodProtocol: GoodProtocol = GoodProtocol()
        
        //Sett base back
        self.view.addSubview(self.baseBackground)
        
        NSLayoutConstraint.activate([
            baseBackground.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            baseBackground.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            baseBackground.heightAnchor.constraint(equalToConstant: self.view.frame.height)
        ])
        
        self.baseBackground.addSubview(pageTitle)
        
        pageTitle.centerYAnchor.constraint(equalTo: self.baseBackground.topAnchor, constant: 100).isActive = true
        pageTitle.widthAnchor.constraint(equalTo: self.baseBackground.widthAnchor, constant: self.baseBackground.bounds.width - 20).isActive = true
        pageTitle.heightAnchor.constraint(equalTo: self.baseBackground.heightAnchor, constant: 75).isActive = true
        
        
        self.goodModel.getList(
            cb: { goods in
                DispatchQueue.main.async {
                    self.data = goods
                    self.renderGoodList()
                }
            }
        )
         
         
        
    }

}


extension AppViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
        
        }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.item] as! CustomData
        return cell
        
    }
    

}



class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            
            guard let data = data else { return }
            img.image = data.backgroundImage
            title.text = data.title
            
        }
    }
    
    fileprivate let img: UIImageView = {
        
           let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 12
            return iv
        
    }()
    
    fileprivate let title: UILabel = {
        
        let yourLabel = UILabel()
        yourLabel.translatesAutoresizingMaskIntoConstraints = false
        yourLabel.textColor = .white
        yourLabel.textAlignment = .center
        yourLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        yourLabel.font.withSize(10)
        return yourLabel
        
    }()
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        let bg = UIView()
        self.addSubview(bg)
        bg.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: -85).isActive = true
        bg.widthAnchor.constraint(equalTo: self.widthAnchor, constant: self.bounds.width).isActive = true
        bg.heightAnchor.constraint(equalTo: self.heightAnchor, constant: self.bounds.height).isActive = true
        bg.addSubview(img)
        
        img.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: -85).isActive = true
        img.widthAnchor.constraint(equalTo: self.widthAnchor, constant: self.bounds.width).isActive = true
        img.heightAnchor.constraint(equalTo: self.heightAnchor, constant: self.bounds.height).isActive = true
        img.addSubview(title)
        
        title.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: -85).isActive = true
        title.widthAnchor.constraint(equalTo: self.widthAnchor, constant: self.bounds.width).isActive = true
        title.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

