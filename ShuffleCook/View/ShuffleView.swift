//
//  ShuffleView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 14/2/2023.
//

import SwiftUI
import Foundation

func randomise() -> Recipe {
    return recipes.randomElement() ?? Recipe(id: 1, name: "Cheese Sandwich",ingredients: [Ingredient(quantity: 1, unitType: "Pcs", name: "Beef", index: 1)], totalTime: 10,instructions: ["1.", "2.", "3."], servings: 4);
}

struct ShuffleView: View {
    @State private var recipe: Recipe = randomise();
    
    @State private var newShuffleRecipe: Bool = false
    
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
                            recipe = randomise()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .imageScale(.large)
                                .foregroundColor(.blue)
                                .padding(.trailing)
                                .onTapGesture (count: 1) {
                                    recipe = randomise()
//                                    if !newShuffleRecipe {
//                                        newShuffleRecipe = true
//                                        recipe = randomise()
//                                    }
                                }
                        }
                    } .padding(.vertical)
                    
                    Divider()
//                        .padding()
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
                    
                    NavigationLink(destination: RecipeView(recipe: recipe)){
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
        } //.onDisappear {newShuffleRecipe = false}
    }
}

struct ShuffleView_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleView()
    }
}
