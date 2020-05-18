//
//  Mapper.swift
//  Data
//
//  Created by Amir Ardalan on 5/10/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import RxCocoa

protocol Mapper {
    associatedtype Input
    associatedtype OutPut
    
    func from(input:Input)->OutPut
    
}
