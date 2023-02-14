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
enum UnitType {
    case g, Kg, mL, L, Pcs
}

struct ListItem {
    var collected : Bool
    var unitType : UnitType
    var quantity : Float
    var name : String
    var recipeId : String
}
