//
//  ShuffleCookApp.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 13/2/2023.
//

import SwiftUI

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
