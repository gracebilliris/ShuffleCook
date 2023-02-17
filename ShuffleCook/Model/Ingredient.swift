//
//  Ingredient.swift
//  ShuffleCook
//
//  Created by John Collins on 17/2/2023.
//

import Foundation

struct Ingredient: Hashable, Codable { //, Identifiable
    //var id: ObjectIdentifier
    
    var unitType : UnitType
    var quantity : Float
    var name : String
    
//    init(from decoder: Decoder) throws {
//        <#code#>
//    }
}
