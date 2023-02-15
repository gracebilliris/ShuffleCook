//
//  ShoppingListView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 13/2/2023.
//

import SwiftUI

private var item1 = ListItem(collected: true, unitType: UnitType.Kg, quantity: 1.5, name: "Flour", recipeId: "")
var item2 = ListItem(collected: false, unitType: UnitType.Pcs, quantity: 6, name: "Eggs", recipeId: "")
private var items: [ListItem] = [item1, item2]
//private var items: [ListItem] = [ListItem]()
//items.append(item1)
//items.append(item2)

var recipesSelected: [Recipe] = [Recipe(name: "Margherita Pizza",
                                        ingredients: ["Tomato"],
                                        instructions: ["1.", "2.", "3."],
                                        totalTime: "10",
                                        cardColor: "Color4"
                                       ),
                                 Recipe(name: "Shepherds Pie",
                                        ingredients: ["Beef"],
                                        instructions: ["1.", "2.", "3."],
                                        totalTime: "10",
                                        cardColor: "Color3"
                                       ),
                                 Recipe(name: "Cheese Sandwich",
                                        ingredients: ["Beef"],
                                        instructions: ["1.", "2.", "3."],
                                        totalTime: "10",
                                        cardColor: "Color1"
                                       )]

struct ShoppingListView: View {
    
    var body: some View {
        VStack (alignment: .leading){
            
//            NavigationView {
//                VStack (alignment: .leading){
//                    HStack (){
//                        Image(systemName: isOn ? "checkmark.square.fill" : "square")
//                        Text("Nav")
//                            .navigationTitle("Shopping List")
//                    }
//                }
//                    //.navigation
//                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
//
//            }
            Divider()
            ScrollView(.horizontal){
                HStack(spacing: 10) {
                    ForEach(recipesSelected) { rec in
                        RecipeView(recipe: rec)
                    }
                }.padding()
                .frame(height: 400)
                //Divider()
                Spacer()
            }
            .frame(height: 270.0)
            Divider()
            
            ScrollView(.vertical) {
                Grid() {
                    GridRow  {
                        Image(systemName: "square").gridColumnAlignment(.center)
                        Text("Quantity").gridColumnAlignment(.leading)
                        Text("Unit").gridColumnAlignment(.leading)
                        Text("Product").gridColumnAlignment(.leading)
                        //Spacer()
                        //Divider()
                    }
                    ForEach(items, id: \.self) { item in
                        GridRow {
                            Image(systemName: item.collected ? "checkmark.square.fill" : "square").gridColumnAlignment(.center)
    //                        Text(String(format:"%.2f", item.quantity))
                            Text((item.unitType == UnitType.Pcs) ? String(format:"%.0f", item.quantity) : String(format:"%.2f", item.quantity))
                                .gridColumnAlignment(.leading)
                            Text(item.unitType.description).gridColumnAlignment(.leading)
                            Text(item.name).gridColumnAlignment(.leading)
                        }
                    }
                }
            }
            Divider()
            Spacer()
        }
        .padding()
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
