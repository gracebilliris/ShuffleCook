//
//  Ingredient.swift
//  ShuffleCook
//
//  Created by John Collins on 17/2/2023.
//

import Foundation

struct Ingredient: Hashable, Codable { //, Identifiable
//    var id: ObjectIdentifier
    
    var unitType : UnitType
    var quantity : Float
    var name : String
    var desc : String?
    var index : Int
    
    init(quantity: Float, unitType: UnitType, name: String, index: Int){
        self.quantity = quantity
        self.unitType = unitType
        self.name = name
        self.index = index
    }
    
    init(quantity: Float, unitType: UnitType, name: String, desc: String, index: Int){
        self.quantity = quantity
        self.unitType = unitType
        self.name = name
        self.desc = desc
        self.index = index
    }
    
//    init(from decoder: Decoder) throws {
//        <#code#>
//    }
}
