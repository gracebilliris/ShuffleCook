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
    var desc : String?
    
    init(quantity: Float, unitType: UnitType, name: String){
        self.quantity = quantity
        self.unitType = unitType
        self.name = name
    }
    
    init(quantity: Float, unitType: UnitType, name: String, desc: String){
        self.quantity = quantity
        self.unitType = unitType
        self.name = name
        self.desc = desc
    }
    
//    init(from decoder: Decoder) throws {
//        <#code#>
//    }
}
