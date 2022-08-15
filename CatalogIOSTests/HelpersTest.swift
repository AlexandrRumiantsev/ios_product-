//
//  HelpersTest.swift
//  CatalogIOSTests
//
//  Created by Румянцев Александр Дмитриевич on 15.08.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import XCTest

/**
 HelpersTest - Класс, который содержит юнит тесты для вспомогательных методов и классов
 
 Список тестов:
 - testGetImgForURL
 Получение изображения по урлу и проверка его длины и высоты
 */
class HelpersTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetImgForURL() throws {
        
        let uiImageSupport =  UIImageSupport()
        
        let img = uiImageSupport.getForUrl(url: "https://www.sberbank.ru/static/images/banner/2021_10/1633332060000_23242_imgUrl.jpeg?_=1633332420665"
        )
        XCTAssertEqual(img.size.height, 437.0)
        XCTAssertEqual(img.size.width, 1280.0)
    }

  

}
