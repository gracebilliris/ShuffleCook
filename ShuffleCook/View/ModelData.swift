//
//  ModelData.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 16/2/2023.
//

import Foundation


class Model: NSObject, ObservableObject {
    @Published var globalSelectedRecipes: [Recipe] = []
    @Published var recipes: [Recipe] = [] //load("recipeData.json")
    @Published var items: [ListItem] = []
    
    
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
//    public func assembleShoppingList(){
//        items = []
//        //selectedRecipe
//        var index = 0
//        for recit in 0..<globalSelectedRecipes.count{
//            for ingr in 0..<globalSelectedRecipes[recit].ingredients.count{
//                if let row = items.firstIndex(where: {$0.name == globalSelectedRecipes[recit].ingredients[ingr].name}) {
//                    items[row].quantity += globalSelectedRecipes[recit].ingredients[ingr].quantity
//                }
//                else {
//                    items.append(ListItem(collected: false, unitType: globalSelectedRecipes[recit].ingredients[ingr].unitType, quantity: globalSelectedRecipes[recit].ingredients[ingr].quantity, name: globalSelectedRecipes[recit].ingredients[ingr].name, recipeId: String(globalSelectedRecipes[recit].id), id: index))
//                    index += 1
//                }
//            }
//        }
//    }
}
