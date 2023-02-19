//
//  ShuffleView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 14/2/2023.
//

import SwiftUI
import Foundation

func randomise() -> Recipe {
    return recipes.randomElement() ?? Recipe(id: 1, name: "Cheese Sandwich",ingredients: ["Beef"], totalTime: 10,instructions: ["1.", "2.", "3."], servings: 4, cardColor: "Color1");
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
                            .padding(.top, 30)
                            .padding(.leading, 20)
                            .frame(minHeight: 70, alignment: .leading)
                        Spacer()
                        
                        Button {
                            recipe = randomise()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .imageScale(.large)
                                .foregroundColor(.blue)
                                .padding(.top, 30)
                                .padding(.trailing)
                                .frame(alignment: .trailing)
                                .onTapGesture (count: 1) {
                                    recipe = randomise()
                                }
                        }
                    }
                    
                    Divider()
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .padding(.top)
                        .overlay(.gray.opacity(0))
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
                    
                    NavigationLink(destination: RecipeView(recipe: recipe)){ // must now merge into main to view a recipe
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
        ShuffleView()
    }
}
