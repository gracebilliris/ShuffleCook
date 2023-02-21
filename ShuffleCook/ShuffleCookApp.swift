//
//  ShuffleCookApp.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 13/2/2023.
//

import SwiftUI
import Foundation

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

var recipes: [Recipe] = load("recipeData.json")

@main
struct ShuffleCookApp: App {
    
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(model)
                .onAppear(){
                    model.recipes = model.load("recipeData.json")
                }
        }
    }
}
