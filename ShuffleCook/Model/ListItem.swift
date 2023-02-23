//
//  ListItem.swift
//  ShuffleCook
//
//  Created by John Collins on 15/2/2023.
//

import Foundation

//enum UnitType {
//    case undef, mass, volume, pieces
//}
//enum UnitType: CustomStringConvertible, Codable {
//    case g, Kg, mL, L, Pcs, tbs, cup
//
//    var description : String {
//        switch self {
//        // Use Internationalization, as appropriate.
//        case .g: return "g"
//        case .Kg: return "Kg"
//        case .mL: return "mL"
//        case .L: return "L"
//        case .Pcs: return "Pcs"
//        case .tbs: return "tbs"
//        case .cup: return "cup"
//        }
//      }
//}

struct ListItem: Hashable {
    var collected : Bool
//    var unitType : UnitType
    var unitType: String
    var quantity : Float
    var name : String
    var recipeId : String
    
    mutating func changeCollected() -> () {
        self.collected = !self.collected
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
    
//    func roundAmount() -> Bool {
//        if (String(quantity * 10) == "0")
//            return true;
//        else
//            return false;
//    }
}
