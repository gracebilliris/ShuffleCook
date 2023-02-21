//
//  RecipeView.swift
//  ShuffleCook
//
//  Created by John Collins on 15/2/2023.
//

import SwiftUI

struct RecipeView: View {
    var recipe:Recipe
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
            ZStack {
                Image(recipe.name)
                    .resizable()
                    .frame(width: 170, height: 170)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(15)
                    .offset(y: -25)
                ZStack {
                    Rectangle()
                            .fill(Color.white)
                            .frame(height: 60)
                            .offset()
                    Text(recipe.name)
                        .font(.headline)
                        .foregroundColor(Color("mainfont"))
                } .offset(y: 80)
            }
            .padding()
            .frame(width: 170.0)
            .frame(height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 10)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe(id: 2,
                                  name: "Noodles",
                          ingredients: [Ingredient(quantity: 1, unitType: "Pcs", name: "Noodles", index: 0),
                                        Ingredient(quantity: 1, unitType: "Pcs", name: "Capsicum", index: 1)],
                                  totalTime: 10, instructions: ["1.", "2.", "3."],
                                  servings: 1
                 ))
    }
}
