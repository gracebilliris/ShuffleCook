//
//  BrowseRecipeView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 14/2/2023.
//

import SwiftUI
import CoreData

struct BrowseRecipeView: View {
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State var text = ""
    
    @State private var goToNewView: Bool = false
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack (alignment: .leading){
                    Text("Browse")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 10)
                        .padding(.leading, 15)
                        .frame(maxHeight: 60)
                    
                    SearchBar(text: $text)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                                            
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: columns, spacing: 20){
                            ForEach(model.recipes.filter({ "\($0)".contains(text) || text.isEmpty})){
                                recipe in
                                ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)){
                                    NavigationLink(destination: RecipeView(recipe: recipe)){
                                      RecipeView(recipe: recipe)
                                    }
                                }
                            }
                        } .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
    }
}
               

struct BrowseRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseRecipeView()
    }
}
