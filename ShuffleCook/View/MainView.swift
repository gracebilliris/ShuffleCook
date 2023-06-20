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
    
    @State var selectedTab: Int = 0
    
    @State var name: String = ""
//    @State public var selectedRecipes: [Recipe] = []

    var body: some View {
        TabView(selection: $selectedTab) {
            BrowseRecipeView()
                .tabItem {
                    Label("Recipe", systemImage: "book")
                }
                .tag(0)
            
            ShuffleView()
                .tabItem {
                    Label("Shuffle", systemImage: "shuffle")
                }
                .tag(1)
            
            ShoppingListView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Shopping", systemImage: "list.dash")
                }
                .tag(2)
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView().environmentObject(Model()) // Run build to preview 
//    }
//}

