//
//  Router.swift
//  CatalogIOS
//
//  Created by Румянцев Александр Дмитриевич on 07.07.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class Router{
    
    var UIWindowObject: UIWindow?
    var userData: [UserFields]?
    
    weak var navController: UINavigationController?
    weak var loginViewController: LoginViewController?
    
    let store: Store
    
    init(UIWindowObject: UIWindow, store: Store) {
        self.UIWindowObject = UIWindowObject
        self.store = store
    }
    
    func startApp(navController: UINavigationController){
        self.navController = navController
    }
    
    func autorization(
        appViewController: AppViewController,
        login: String,
        password: String,
        errorLabel: UILabel,
        userModel: UserModel
    ){
        let navigationController = UINavigationController(
            rootViewController: appViewController
        )
        userModel.getItem(
            login: login,
            password: password,
            errorLabel: errorLabel,
            completion: { data in
                if(data.count == 0){
                    DispatchQueue.main.async {
                        errorLabel.text = ErrorNames.USER_NOT_FOUND
                    }
                }else{
                    DispatchQueue.main.async {
                        self.userData = data
                        self.UIWindowObject?.rootViewController?.present(
                            navigationController, animated: true, completion: self.afterAutorization
                        )
                    }
                }
            }
        )
    }
    
    func afterAutorization() -> Void{
        //Записываю данные пользователя в стор
        self.store.add(
            type: "user",
            data: self.userData
        );
        
    }
    
    func switchScreen(controller: UIViewController){
        self.navController?.viewControllers = [controller]
        self.UIWindowObject?.rootViewController = self.navController
        self.UIWindowObject?.makeKeyAndVisible()
    }
}
