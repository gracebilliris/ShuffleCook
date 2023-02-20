//
//  CompleteRecipeView.swift
//  ShuffleCook
//
//  Created by Nicolas Ebon on 16/2/2023.
//

import SwiftUI

struct CompleteRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteRecipeView(recipe: Recipe(id: 7,
                                          name: "Prawn & Kimchi Fried Rice",ingredients: [Ingredient(quantity: 1, unitType: "Pcs", name: "Lebanese Cucumber", desc: "cut into matchsticks", index: 0),
                                                                                          Ingredient(quantity: 1, unitType: "Pcs", name: "Carrot", desc: "cut into matchsticks", index: 1),
                                                                                   Ingredient(quantity: 1, unitType: "Pcs", name: "Lime", desc: "juiced", index: 2),
                                                                                   Ingredient(quantity: 2, unitType: "Pcs", name: "Corn cob", desc: "Use a knife to cut down the side of corn to release the kernels", index: 3),
                                                                                   Ingredient(quantity: 2, unitType: "tbs", name: "Peanut oil", desc: "cut into matchsticks", index: 4),
                                                                                   Ingredient(quantity: 20, unitType: "Pcs", name: "Banana Prawns", desc: "pealed, leaving tails intact", index: 5),
                                                                                   Ingredient(quantity: 1, unitType: "cup", name: "kimchi", desc: "cut into matchsticks", index: 6),
                                                                                   Ingredient(quantity: 450, unitType: "g", name: "Microwavable Jasmine Rice", index: 7),
                                                                                   Ingredient(quantity: 2, unitType: "Pcs", name: "Eggs", desc: "Lightly whisked", index: 8)],
                                                                                          totalTime: 15, instructions: ["1. Combine the cucumber, carrot and lime juice in a bowl. Season.",
                                                                                                                        "2. Heat half the peanut oil in a wok or large non-stick frying pan over medium heat. Add the prawns and corn kernels and stir-fry for 3 mins or until prawns curl and change colour. Add the kimchi and stir-fry for 1 min or until heated through. Transfer the prawn mixture to a large bowl.",
                                                                                                                        "3.Heat remaining oil in the wok or pan over high heat. Add the rice and stir-fry for 3 mins or until heated through. Add the kimchi liquid and stir-fry for 1 min or until liquid evaporates. Use a spatula to move rice to the edge of the wok or pan. Pour egg into centre of wok or pan and cook until just set. Break up egg and stir to combine with rice mixture. Return the prawn mixture to wok or pan and mix until well combined and heated through.",
                                                                                                                        "4. Divide rice mixture among serving bowls. Top with cucumber mixture."],
                                                                     servings: 4,
                                                                     cardColor: "Color2"))
    }
}
//
//  RecipeView.swift
//
//  Created by Nicolas Ebon on 14/2/2023.
//

import SwiftUI
import ImageIO
import UIKit


struct CompleteRecipeView: View {
    //@State public var selectedRecipes: [Recipe]
    @State var recipe: Recipe
//    private var recipe = Recipe(id: 7,
//                                name: "Prawn & Kimchi Fried Rice",
////                                ingredients: [Ingredient(quantity: 1, unitType: UnitType.Pcs, name: "Lebanese Cucumber", desc: "cut into matchsticks", index: 0),
////                                Ingredient(quantity: 1, unitType: UnitType.Pcs, name: "Carrot", desc: "cut into matchsticks", index: 1),
////                         Ingredient(quantity: 1, unitType: UnitType.Pcs, name: "Lime", desc: "juiced", index: 2),
////                         Ingredient(quantity: 2, unitType: UnitType.Pcs, name: "Corn cob", desc: "Use a knife to cut down the side of corn to release the kernels", index: 3),
////                         Ingredient(quantity: 2, unitType: UnitType.tbs, name: "Peanut oil", desc: "cut into matchsticks", index: 4),
////                         Ingredient(quantity: 20, unitType: UnitType.Pcs, name: "Banana Prawns", desc: "pealed, leaving tails intact", index: 5),
////                         Ingredient(quantity: 1, unitType: UnitType.cup, name: "kimchi", desc: "cut into matchsticks", index: 6),
////                         Ingredient(quantity: 450, unitType: UnitType.g, name: "Microwavable Jasmine Rice", index: 7),
////                         Ingredient(quantity: 2, unitType: UnitType.Pcs, name: "Eggs", desc: "Lightly whisked", index: 8)],
//                                ingredients: [Ingredient(quantity: 1, unitType: "Pcs", name: "Lebanese Cucumber", desc: "cut into matchsticks", index: 0),
//                                Ingredient(quantity: 1, unitType: "Pcs", name: "Carrot", desc: "cut into matchsticks", index: 1),
//                         Ingredient(quantity: 1, unitType: "Pcs", name: "Lime", desc: "juiced", index: 2),
//                         Ingredient(quantity: 2, unitType: "Pcs", name: "Corn cob", desc: "Use a knife to cut down the side of corn to release the kernels", index: 3),
//                         Ingredient(quantity: 2, unitType: "tbs", name: "Peanut oil", desc: "cut into matchsticks", index: 4),
//                         Ingredient(quantity: 20, unitType: "Pcs", name: "Banana Prawns", desc: "pealed, leaving tails intact", index: 5),
//                         Ingredient(quantity: 1, unitType: "cup", name: "kimchi", desc: "cut into matchsticks", index: 6),
//                         Ingredient(quantity: 450, unitType: "g", name: "Microwavable Jasmine Rice", index: 7),
//                         Ingredient(quantity: 2, unitType: "Pcs", name: "Eggs", desc: "Lightly whisked", index: 8)],
//                                totalTime: 15, instructions: ["1. Combine the cucumber, carrot and lime juice in a bowl. Season.",
//                                                              "2. Heat half the peanut oil in a wok or large non-stick frying pan over medium heat. Add the prawns and corn kernels and stir-fry for 3 mins or until prawns curl and change colour. Add the kimchi and stir-fry for 1 min or until heated through. Transfer the prawn mixture to a large bowl.",
//                                                              "3.Heat remaining oil in the wok or pan over high heat. Add the rice and stir-fry for 3 mins or until heated through. Add the kimchi liquid and stir-fry for 1 min or until liquid evaporates. Use a spatula to move rice to the edge of the wok or pan. Pour egg into centre of wok or pan and cook until just set. Break up egg and stir to combine with rice mixture. Return the prawn mixture to wok or pan and mix until well combined and heated through.",
//                                                              "4. Divide rice mixture among serving bowls. Top with cucumber mixture."],
//           servings: 4,
//           cardColor: "Color2"
//          )
    
//    var recipe = Recipe(name:"testN", ingredients: ["2 eggs", "kimchi"]
//    , instructions: ["1. 2. "], )
//
    var body: some View {
        VStack{
            //page Title, add to list Hstack
            HStack(alignment: .center, spacing: 150){
                Text("Recipe")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .frame(width: 115.0)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                Button("+ Add to list") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }.padding(.bottom)
                .frame(width: 100.0)
            }.padding(1.0)
            
            Divider()
            
            ScrollView{
                VStack {

                    
                    //whole stack
                    VStack(alignment: .center) {
                        Text(recipe.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding()
  
                        //name, total time and recipe image Hstack
                        HStack(alignment: .center){
                            Image(recipe.name)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(38)
                            
                            VStack(alignment: .leading){
                                
                                //total time VStack
                                VStack{
                                    Text("Total Time")
                                        .font(.headline)
                                        .multilineTextAlignment(.leading)
                                    Text(String(recipe.totalTime) + " minutes \n").multilineTextAlignment(.leading)
                                    
                                    Text("Servings").font(.headline).multilineTextAlignment(.leading)

                                    Text(String(recipe.servings)).multilineTextAlignment(.leading)
                                    
                                }.padding(.leading)
                                
                                      
                                
                                
                            }
                            .frame(width: 150.0, height: 200.0)
                        }.frame(width: 375, height: 200)
                        
                        Spacer()
                        
                        Text("Ingredients")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .position(x:60,y:10)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        // New version of drawing the list of ingredients with new model.
                        // Feel free to rearrange and stylise!
                        
                        Grid(alignment:.leading) {

                            ForEach(recipe.ingredients, id: \.index) { ingr in
                                GridRow(){
                                    //                                            Text((ingr.unitType == UnitType.Pcs) ? String(format:"%.0f", ingr.quantity) : String(format:"%.2f", ingr.quantity))
                                    Text((ingr.unitType == "Pcs") ? String(format:"%.0f", ingr.quantity) :
                                            String(format:"%.0f", ingr.quantity) + " " + ingr.unitType)
                                    
//                                  if else for comma inclusion down here

                                    
                                    
                                    
                                    //IF the thing doesnt work just use this
                                    Text(ingr.name + ", " + (ingr.desc ?? " ")).multilineTextAlignment(.leading)

                                    
                                }
                                Divider()
                                //padding here?
                            }
                        }.padding(.leading, 10)
                        
                        Spacer()
                        
                        Text("Instructions")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .position(x:60,y:10)
                            .padding(.leading, 10)
                        
                        Spacer()

                       
                        
                        Text(recipe.instructions.joined(separator: "\n\n")).multilineTextAlignment(.leading).padding(.leading)

                        
                        //for each)
                        
                        
                        
                        
                    }
                    .padding()
                    
                }
                //scroll view closer below me
            }
        }
        
    }
}
