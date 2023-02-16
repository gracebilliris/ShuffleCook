//
//  Recipe.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 14/2/2023.
//

import Foundation
import CoreData
import SwiftUI

struct Recipe: Identifiable, Decodable {
    var id: Int
    var name: String
    var ingredients: Array<String>
    var totalTime: Int
    var instructions: Array<String>
    var servings: Int
    var cardColor: String
}
