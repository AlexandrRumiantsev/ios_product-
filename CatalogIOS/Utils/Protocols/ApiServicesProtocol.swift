//
//  ApiServicesProtocol.swift
//  CatalogIOS
//
//  Created by Румянцев Александр Дмитриевич on 20.07.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import Foundation

protocol ApiServicesProtocol {
    //var config: Any { get set }
    func query(
        params: [String: String],
        complete: @escaping (Data?) throws -> Void
    )
}
