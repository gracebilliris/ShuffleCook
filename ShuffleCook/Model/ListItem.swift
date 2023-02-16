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
enum UnitType: CustomStringConvertible {
    case g, Kg, mL, L, Pcs
    
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .g: return "g"
        case .Kg: return "Kg"
        case .mL: return "mL"
        case .L: return "L"
        case .Pcs: return "Pcs"
        }
      }
}

struct ListItem: Hashable {
    var collected : Bool
    var unitType : UnitType
    var quantity : Float
    var name : String
    var recipeId : String
}