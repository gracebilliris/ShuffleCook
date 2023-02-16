//
//  Recipe.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 14/2/2023.
//

import Foundation
import CoreData
import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var ingredients: Array<String>
    var instructions: Array<String>
    var totalTime: String
    var servings: Int
    var cardColor: String
}



