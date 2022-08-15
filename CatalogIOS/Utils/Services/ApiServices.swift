//
//  ApiServices.swift
//  CatalogIOS
//
//  Created by Александр on 02/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit


class ApiServices: ApiServicesProtocol {
    
    var apiURL: String
    var queryUrl: URL?
    
    init(
        apiURL: String
    ){
        self.apiURL = apiURL
    }
    
    func createParamsString(params: [String : String]) -> String{
        var str = "?"
        params.forEach { word in
            str += "\(word.key)=\(word.value)&"
        }
        return str
    }
    
    func getApiURL(params: [String : String]) -> URL {
        return URL(string: "\(self.apiURL)\( self.createParamsString(params: params))")!
    }
    
    func query(
        params: [String : String],
        complete: @escaping (Data?) throws -> Void
    ) {
        
        DispatchQueue.main.async {
            
            let url = self.getApiURL(
                params: params
            )
            
            let task = URLSession.shared.dataTask(with: url as URL) { (data, response, error) in
                do {
                    try complete(data)
                } catch {
                    print("JSONSerialization error:", error)
                }
            }
            task.resume()
           
        }
        
    }
}
