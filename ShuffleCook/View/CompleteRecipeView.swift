//
//  CompleteRecipeView.swift
//  ShuffleCook
//
//  Created by Nicolas Ebon on 16/2/2023.
//

import SwiftUI

struct CompleteRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteRecipeView(
            recipe: Recipe(
                id: 5,
                name: "Tomato, Spinach and Feta Linguine",
                ingredients: [
                    Ingredient(quantity: 1, unitType: "Pcs", name: "Lebanese Cucumber", desc: "cut into matchsticks", index: 0),
                    Ingredient(quantity: 1, unitType: "Pcs", name: "Carrot", desc: "cut into matchsticks", index: 1),
                    Ingredient(quantity: 1, unitType: "Pcs", name: "Lime", desc: "juiced", index: 2),
                    Ingredient(quantity: 2, unitType: "Pcs", name: "Corn cob", desc: "Use a knife to cut down the side of corn to release the kernels", index: 3),
                    Ingredient(quantity: 2, unitType: "tbs", name: "Peanut oil", desc: "cut into matchsticks", index: 4),
                    Ingredient(quantity: 20, unitType: "Pcs", name: "Banana Prawns", desc: "pealed, leaving tails intact", index: 5),
                    Ingredient(quantity: 1, unitType: "cup", name: "kimchi", desc: "cut into matchsticks", index: 6),
                    Ingredient(quantity: 450, unitType: "g", name: "Microwavable Jasmine Rice", index: 7),
                    Ingredient(quantity: 2, unitType: "Pcs", name: "Eggs", desc: "Lightly whisked", index: 8)],
                  totalTime: 15,
                  instructions: ["1. Combine the cucumber, carrot and lime juice in a bowl. Season.", "2. Heat half the peanut oil in a wok or large non-stick frying pan over medium heat. Add the prawns and corn kernels and stir-fry for 3 mins or until prawns curl and change colour. Add the kimchi and stir-fry for 1 min or until heated through. Transfer the prawn mixture to a large bowl.", "3.Heat remaining oil in the wok or pan over high heat. Add the rice and stir-fry for 3 mins or until heated through. Add the kimchi liquid and stir-fry for 1 min or until liquid evaporates. Use a spatula to move rice to the edge of the wok or pan. Pour egg into centre of wok or pan and cook until just set. Break up egg and stir to combine with rice mixture. Return the prawn mixture to wok or pan and mix until well combined and heated through.", "4. Divide rice mixture among serving bowls. Top with cucumber mixture."],
                  servings: 4
            )
        )
    }
}

import ImageIO
import UIKit

struct CompleteRecipeView: View {
    
    @State var showingAlert = false
    
    @State var recipe: Recipe
    @EnvironmentObject var model: Model
    var body: some View {
      
            
            VStack{
                //page Title, add to list Hstack
                
                Divider()
                
                ScrollView{
                    VStack {
                        //whole stack
                        VStack() {
                            Text(recipe.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            //name, total time and recipe image Hstack
                            HStack(){
                                Image(recipe.name)
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(25)
                                
                                VStack(){
                                    
                                    //total time VStack
                                    VStack{
                                        Text("Total Time")
                                            .font(.headline)
                                            .multilineTextAlignment(.leading)
                                            .padding(.bottom, 1)
                                        
                                        Text(String(recipe.totalTime) + " minutes \n").multilineTextAlignment(.leading)
                                        
                                        Text("Servings").font(.headline).multilineTextAlignment(.leading)
                                            .padding(.bottom, 1)
                                        
                                        Text(String(recipe.servings)).multilineTextAlignment(.leading)
                                    }
                                }.frame(width: 150.0, height: 200.0)
                            }.frame(width: 375, height: 200)
                            
//                            Spacer()
                            
                            Text("Ingredients")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.leading, 10)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
//                            Spacer()
                            
                            // New version of drawing the list of ingredients with new model.
                            // Feel free to rearrange and stylise!
                            
                            Grid(alignment:.leading) {
                                ForEach(recipe.ingredients, id: \.index) { ingr in
                                    GridRow(){
                                        Text(ingr.getQuantityStr())

                                        //                                  if else for comma inclusion down here

                                        //IF the thing doesnt work just use this
                                        if ingr.desc != nil {
                                            Text(ingr.name + ", " + (ingr.desc ?? " "))
                                                .multilineTextAlignment(.leading)
                                        }
                                        else {
                                            Text(ingr.name)
                                                .multilineTextAlignment(.leading)
                                        }

                                    }
                                    Divider()
                                }
                                .padding(.horizontal)
                            }
                            
                                                        
                            VStack(alignment: .leading, spacing: 15){
                                Text("Instructions")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.leading, 10)
                                    .padding(.top, 10)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ForEach(recipe.instructions.indices, id: \.self) { index in
                                        Text(recipe.instructions[index])
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading, 10)
                                            .padding(.trailing, 10)
                                            .lineSpacing(5)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                            }
                        }
                        .navigationBarTitle("Recipe")
                        .navigationBarItems(trailing:
                                Button(action: {
                                showingAlert = true
                            // Handle button press
//                            self.alert(isPresented: $showingAlert) {
//                                Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
//                            }
//                            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
                                model.globalSelectedRecipes.append(recipe)
                            }){
                            Text("Add to List")
                        }
                            .alert("Recipe added to shopping list!", isPresented: $showingAlert){
                                Button("OK", role: .cancel) {}
                            }
                        )
                        .padding()
                    }
                }
                
            }
            

            
 
            
        

    }
}



