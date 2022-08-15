//
//  User.swift
//  CatalogIOS
//
//  Created by Александр on 01/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit
import CoreData

public class GoodModel: ModelProtocol {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate //Singlton instance
    let context: NSManagedObjectContext!
    let api: ApiServices!
    let UIImageSupport: UIImageSupport
    
    let ItemGoodEntityName = "BaseItemGood"
    let actionGetAll = "getAllGoods"
    
    var goodArray: [CustomData] = []
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Good")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    init(uiImageSupport: UIImageSupport) {
        self.context = self.persistentContainer.viewContext
        self.UIImageSupport = uiImageSupport
        
        self.api = ApiServices(
            apiURL: SettingNames().SERVER_URL
        )
    }

    
    func saveUserData(_ goods: [GoodFields]) {
        
        for good in goods {
            
            // Описание сущности
            let entityDescription = NSEntityDescription.entity(
                forEntityName: self.ItemGoodEntityName, in: self.context
            )
            
            // Создание нового объекта
            let managedObject = NSManagedObject(
                entity: entityDescription!,
                insertInto: self.context!
            )
            
            // Установка значения атрибута
            managedObject.setValue(good.ID, forKey: "id")
            managedObject.setValue(good.TITLE, forKey: "title")
            managedObject.setValue(good.IMG, forKey: "img")

            do {
                try self.context.save()
                print("Success good = \(good.ID)")
            } catch {
                print("Error saving: \(error)")
            }
            
        }
        
    }
    
    func getFromCoreData(complete: @escaping ([CustomData]) throws -> Void){
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: self.ItemGoodEntityName)
        fetchRequest.returnsObjectsAsFaults = false;
        var array: [CustomData] = []
    
        
        do {
            let _data = try self.context.fetch(fetchRequest)
            
            for item in _data {
                
                let title: String = (item as AnyObject).value(forKey: "title") as! String
                let imgSrc: String = (item as AnyObject).value(forKey: "img") as! String
                
                array.append(
                    CustomData(
                        title: title,
                        backgroundImage: self.UIImageSupport.getForUrl(
                            url: imgSrc
                        ),
                        id: "",
                        discr: "",
                        count: "",
                        price: "",
                        sizes: "",
                        category: "",
                        comments: ""
                    )
                )
                
            }
            
            try complete(array)
            
        } catch {
            
        }
     
    }

    func getList(cb: @escaping ([CustomData])->()) -> Void  {
        
        self.getFromCoreData(
            complete: { dataFromCoreData in
                if(dataFromCoreData.count == 0) {
                    
                    self.api.query(
                        params: [
                            "action": self.actionGetAll
                        ],
                        complete: { data in
                            let goods: [GoodFields] = try JSONDecoder().decode([GoodFields].self, from: data!)
                            cb(goodAdapter(goods: goods) as! [CustomData])
                        }
                    )
                } else {
                    cb(dataFromCoreData as! [CustomData])
                }
            }
        )
        
    }
    
    deinit {
        print("deinit UserModel")
    }
}
