//
//  ApiTests.swift
//  CatalogIOSTests
//
//  Created by Румянцев Александр Дмитриевич on 15.08.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import XCTest
@testable import CatalogIOS

/**
 ApiTests - Класс, который содержит юнит тесты для работы методов ApiServices
 
 Список тестов:
 - testCreateParamsAPI
 Тестирую корректную сборку параметров для query строки
 
 - testGetApiURL
 Тестирую получение финального URL объекта для отправки на сервер
 
 - testQuery
 Тестирую отправку данных (запрос авторизации) на сервер и получение корректных данных пользователя.
 */

class ApiTests: XCTestCase {

    var apiServices: ApiServices!
    var goodModel: GoodModel!
    var responce: Int!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // в данном методе, который запускается перед началом тестов, инициируем объект в виде класа, что позволит нам обращаться к его свойствам и методам
        self.apiServices = ApiServices(apiURL: "www.example.ru")
    }
    
    override func tearDown() {
        self.apiServices = nil
        super.tearDown()
    }
    
    func testCreateParamsAPI() {
        let queryString = self.apiServices.createParamsString(params: ["t": "1", "v": "2"]);
        XCTAssertEqual(
            queryString,
            "?v=2&t=1&",
            "Собранные параметры"
        )
        
    }
    
    func testGetApiURL() {
        let queryString = self.apiServices.getApiURL(params: ["t": "1", "v": "2"]);
        XCTAssertEqual(
            queryString,
            URL(string: "www.example.ru?v=2&t=1&"),
            "Собраннй URL"
        )
    }
    
    
    func testQuery(){
        
        // 1. Инициализация объекта-ожидания
        let expectation = XCTestExpectation(description: "Ожидание")

        let api = ApiServices(apiURL: "http://inordic.alexweber.ru/api/index.php")
        
        var user: Data?

        api.query(
            params: ["action": "getUser", "LOGIN": "djiga200", "PASSWORD": "djiga200"],
            complete: { data in
                user = data
                expectation.fulfill()
            }
        );
        
        wait(for: [expectation], timeout: 3.0)
 
        XCTAssertTrue((user != nil), "Ответ от сервера получен")
        
        do {
            let userInfo: [UserFields] = try JSONDecoder().decode([UserFields].self, from: user!)
            XCTAssertEqual(userInfo[0].NAME, "Никита")
            XCTAssertEqual(userInfo[0].FAMILY, "Джигурда")
        } catch let error {
           XCTFail(error.localizedDescription)
        }
        
    }

}
