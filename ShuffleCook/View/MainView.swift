//
//  MainView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 14/2/2023.
//

import SwiftUI
import CoreData
import Foundation

struct MainView: View {
    
    @State var name: String = ""
    @State public var selectedRecipes: [Recipe] = []

    var body: some View {
        TabView {
            BrowseRecipeView()
                .tabItem {
                    Label("Recipe", systemImage: "book")
                }
            
            ShuffleView()
                .tabItem {
                    Label("Shuffle", systemImage: "shuffle")
                }
            
            ShoppingListView(selectedRecipe: selectedRecipes)
                .tabItem {
                    Label("Shopping", systemImage: "list.dash")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

