//
//  Mock.swift
//  AANetworkTests
//
//  Created by Amir Ardalan on 4/20/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
@testable import AANetwork
struct Mock {
    static var jsonString = """
        [
            {
                "id":0,
                "title":"شلوار مردانه",
                "categoryColor":"#f57f17"
            }
        ]
        """
    
    static var jsonData:Data?{
        return jsonString.data(using: String.Encoding.utf8)
    }
}
