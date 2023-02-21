//
//  ShuffleView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 14/2/2023.
//

import SwiftUI
import Foundation

struct ShuffleView: View {
    @State private var newShuffleRecipe: Bool = false
    
    var defaultRecipe = Recipe(id: 1, name: "Cheese Sandwich",ingredients: [Ingredient(quantity: 1, unitType: "Pcs", name: "Beef", index: 1)], totalTime: 10,instructions: ["1.", "2.", "3."], servings: 4);
    
    @EnvironmentObject var model: Model
    
    @State private var recipe = recipes.randomElement() ?? Recipe(id: 1, name: "Cheese Sandwich",ingredients: [Ingredient(quantity: 1, unitType: "Pcs", name: "Beef", index: 1)], totalTime: 10,instructions: ["1.", "2.", "3."], servings: 4);

    var body: some View {
        NavigationView {
            ZStack {
                VStack (alignment: .leading){
                    HStack {
                        Text("Suggested Meal")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 15)
                            .frame(maxHeight: 50)

                        Spacer()
                        
                        Button {
                            recipe = model.recipes.randomElement() ?? defaultRecipe
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .imageScale(.large)
                                .foregroundColor(.blue)
                                .padding(.trailing)
                                .onTapGesture (count: 1) {
                                    recipe = model.recipes.randomElement() ?? defaultRecipe
                                }
                        }
                    } .padding(.vertical)
                    
                    Divider()
                    Spacer()
                }
                VStack(alignment: .center) {
                    Image(recipe.name)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(30)
                        .padding()
                    
                    Text(recipe.name)
                        .font(.title)
                        .bold()
                        .padding()
                    
                    NavigationLink(destination: CompleteRecipeView(recipe: recipe)){
                        VStack (alignment: .center) {
                            Text("Ingredients")
                                .font(.subheadline)
                                .bold()
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(.blue)
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.top)
                }
            }
        }
    }
}

struct ShuffleView_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleView(defaultRecipe: Recipe(id: 1, name: "Cheese Sandwich",ingredients: [Ingredient(quantity: 1, unitType: "Pcs", name: "Beef", index: 1)], totalTime: 10,instructions: ["1.", "2.", "3."], servings: 4)
        )
    }
}
