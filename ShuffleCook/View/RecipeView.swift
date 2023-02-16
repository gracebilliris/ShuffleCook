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
            VStack {
                Image(recipe.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 5)

                   // .frame(height: 100)
                
                HStack {
                    VStack (alignment: .leading){
                        Text(recipe.name)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color("mainfont"))
                        
//                                            Text(recipe.totalTime)
//                                                .foregroundColor(Color("subfont"))
//
//                                            Text(recipe.name)
//                                                .font(.headline)
//                                                .foregroundColor(Color("mainfont"))
//                                                .fontWeight(.semibold)
                    }
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .frame(width: 160.0)
        .frame(height: 200.0)
        .background(Color(recipe.cardColor))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color(recipe.cardColor).opacity(0.5), radius: 10, x:0, y: 10)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe(id: 2,
                                  name: "Noodles",
                          ingredients: ["Noodles", "Capsicums"],
                                  totalTime: 10, instructions: ["1.", "2.", "3."],
                                  servings: 1,
                          cardColor: "Color1"
                         ))
    }
}
