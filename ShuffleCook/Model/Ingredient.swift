//
//  Ingredient.swift
//  ShuffleCook
//
//  Created by John Collins on 17/2/2023.
//

import Foundation

struct Ingredient: Hashable, Codable { //, Identifiable
//    var id: ObjectIdentifier
    
//    var unitType : UnitType
    var unitType : String
    var quantity : Float
    var name : String
    var desc : String?
    var index : Int
    
    init(quantity: Float, unitType: String, name: String, index: Int){
        self.quantity = quantity
        self.unitType = unitType
        self.name = name
        self.index = index
    }
    
    init(quantity: Float, unitType: String, name: String, desc: String, index: Int){
        self.quantity = quantity
        self.unitType = unitType
        self.name = name
        self.desc = desc
        self.index = index
    }
    
    func getQuantityStr() -> String {
        print(name + ": quantity " + String(quantity) + " truncate: " + String((quantity).truncatingRemainder(dividingBy: 10)) + ",\ntimes ten: " +  String((quantity*10).truncatingRemainder(dividingBy: 10)))
        if ((quantity*10).truncatingRemainder(dividingBy: 10) != 0.0 || (quantity*100).truncatingRemainder(dividingBy: 10) != 0.0){
            return String(format: "%.2f", quantity)
        }
        else{
            return String(format: "%.0f", quantity)
        }
    }
    
//    init(from decoder: Decoder) throws {
//        <#code#>
//    }
}
