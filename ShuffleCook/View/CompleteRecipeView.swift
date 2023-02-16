//
//  CompleteRecipeView.swift
//  ShuffleCook
//
//  Created by Nicolas Ebon on 16/2/2023.
//

//
//  RecipeView.swift
//
//  Created by Nicolas Ebon on 14/2/2023.
//

import SwiftUI
import ImageIO
import UIKit


struct CompleteRecipeView: View {
    
    var recipe:Recipe
    
    var body: some View {
        VStack{
            //page Title, add to list Hstack
            HStack(alignment: .center, spacing: 150.0){
                Text("Recipe")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .frame(width: 115.0)
                Button("+ Add to list") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(width: 100.0)
            }
            .padding(1.0)
            Divider()
            
            

            ScrollView{
                VStack {
                    
                    //whole stack
                    VStack(alignment: .center) {
                        //name, total time and recipe image Hstack
                        HStack(alignment: .center){
                            Image(recipe.name)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(38)
                            
                            VStack(alignment: .leading){
                                Text(recipe.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    
                                
                                Text("Total Time: " + recipe.totalTime)
                                    .font(.headline)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                
                                Text("Servings: " + String(recipe.servings))
                                    .font(.headline)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                            }
                            .frame(width: 150.0, height: 250.0)
                        }
                        
                        Spacer()
                        
                        VStack(){
                            Text("Ingredients:")
                                .font(.title2)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .position(x:60,y:10)
                                
                            
                            
                            //ingredients
                            Text(recipe.ingredients.joined(separator: "\n \u{2022}"))
                                .padding()
                                
                                
                            
                            
                            Text(recipe.instructions.joined(separator: "\n "))
                                .multilineTextAlignment(.leading)
                            
                        }

                        
                        //for each)

                    }
                    .padding()
                    
   
                }
                //scroll view closer below me
            }
        }
        
        
    }
//View closed
    
}

struct CompleteRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteRecipeView(recipe: Recipe(name: "Prawn & Kimchi Fried Rice",
                                          ingredients: ["1 Lebanese cucumber, cut into matchsticks",
                                                        "1 carrot, peeled, cut into matchsticks",
                                                        "1 juiced lime",
                                                        "2 corn cobs, Use a knife to cut down the side of corn to release the kernels",
                                                       "2 tbs peanut oil",
                                                       "20 Raw Banana Prawns, peeled leaving tails intact",
                                                       "1 cup (250g) kimchi, save pickling liquid",
                                                       "450g pkt microwavable jasmine rice",
                                                       "2 Eggs, lightly whisked"],
                                          instructions: ["1. Combine the cucumber, carrot and lime juice in a bowl. Season.",
                                                         "2. Heat half the peanut oil in a wok or large non-stick frying pan over medium heat. Add the prawns and corn kernels and stir-fry for 3 mins or until prawns curl and change colour. Add the kimchi and stir-fry for 1 min or until heated through. Transfer the prawn mixture to a large bowl.",
                                                         "3.Heat remaining oil in the wok or pan over high heat. Add the rice and stir-fry for 3 mins or until heated through. Add the kimchi liquid and stir-fry for 1 min or until liquid evaporates. Use a spatula to move rice to the edge of the wok or pan. Pour egg into centre of wok or pan and cook until just set. Break up egg and stir to combine with rice mixture. Return the prawn mixture to wok or pan and mix until well combined and heated through.",
                                                        "4. Divide rice mixture among serving bowls. Top with cucumber mixture."],
                                          totalTime: "15",
                                          servings: 4,
                                          cardColor: "Color2"
                                         ))
    }
}
