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
            
            ShoppingListView()
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

