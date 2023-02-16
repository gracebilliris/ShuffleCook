//
//  BrowseRecipeView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 14/2/2023.
//

import SwiftUI
import CoreData

struct BrowseRecipeView: View {
    private var recipes = [
        Recipe(name: "Pear",
               ingredients: ["Pear"],
               instructions: ["1.", "2.", "3."],
               totalTime: "10",
               servings: 4,
               cardColor: "Color2"
              ),
        Recipe(name: "Noodles",
               ingredients: ["Noodles", "Capsicums"],
               instructions: ["1.", "2.", "3."],
               totalTime: "10",
               servings: 4,
               cardColor: "Color1"
              ),
        Recipe(name: "Margherita Pizza",
               ingredients: ["Tomato"],
               instructions: ["1.", "2.", "3."],
               totalTime: "10",
               servings: 4,
               cardColor: "Color4"
              ),
        Recipe(name: "Shepherds Pie",
               ingredients: ["Beef"],
               instructions: ["1.", "2.", "3."],
               totalTime: "10",
               servings: 4,
               cardColor: "Color3"
              ),
        Recipe(name: "Cheese Sandwich",
               ingredients: ["Beef"],
               instructions: ["1.", "2.", "3."],
               totalTime: "10",
               servings: 4,
               cardColor: "Color1"
              ),
        Recipe(name: "Omelette",
               ingredients: ["Tomato", "Eggs"],
               instructions: ["1.", "2.", "3."],
               totalTime: "10",
               servings: 4,
               cardColor: "Color2"
              ),
    ]
    
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State var text = ""
    
    @State private var goToNewView: Bool = false

//    init() {
//        print("recipes : \(String(describing: recipes))")
//    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack (alignment: .leading){
                    Text("Browse")
                        .font(.largeTitle)
                        .padding(.top, 30)
                        .padding(.leading, 30)
                        .foregroundColor(Color("mainfont"))
                    
                    Divider()
                        .frame(minWidth: 100)
                        .frame(height: 1)
                        .overlay(.gray.opacity(0))
                    
                    SearchBar(text: $text)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    Divider()
                        .frame(minWidth: 100)
                        .frame(height: 1)
                        .overlay(.gray.opacity(0))
                    
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: columns, spacing: 20){
                            ForEach(recipes.filter({ "\($0)".contains(text) || text.isEmpty})){
                                recipe in
                                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                                    NavigationLink(destination: ShoppingListView()){
                                        VStack {
                                            Image(recipe.name)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 150)
                                            
//                                            Text(recipe.totalTime)
//                                                .foregroundColor(Color("subfont"))
//
//                                            Text(recipe.name)
//                                                .font(.headline)
//                                                .foregroundColor(Color("mainfont"))
//                                                .fontWeight(.semibold)
//                                        }
//
//                                        Spacer()
//                                    }
//                                }
//                            }
//                            .frame(height: 150)
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 20)
//                            .background(Color(recipe.cardColor))
//                            .clipShape(RoundedRectangle(cornerRadius: 15))
//                            .shadow(color: Color(recipe.cardColor).opacity(0.5), radius: 10, x:0, y: 10)

                        }
                    }
                    .padding(.trailing, 20)
                    .padding(.leading, 20)
                    .padding(.top, 5)
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
