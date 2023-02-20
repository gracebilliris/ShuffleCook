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

var recipesSelected: [Recipe] = [Recipe(id: 3,
                                        name: "Margherita Pizza",
                                        ingredients: ["Tomato"],
                                        totalTime: 10,
                                        instructions: ["1.", "2.", "3."],
                                        servings: 4,
                                        cardColor: "Color4"
                                       ),
                                 Recipe(id: 2, name: "Shepherds Pie",
                                        ingredients: ["Beef"],
                                        totalTime: 10,
                                        instructions: ["1.", "2.", "3."],
//                                        totalTime: "10",
                                        servings: 4,
                                        cardColor: "Color3"
                                       ),
                                 Recipe(id: 1,
                                        name: "Cheese Sandwich",
                                        ingredients: ["Beef"],
                                        totalTime: 10,
                                        instructions: ["1.", "2.", "3."],
//                                        totalTime: "10",
                                        servings: 4,
                                        cardColor: "Color1"
                                       )]

struct ShoppingListView: View {
    @State var text = ""
    @State var editMode = false
    var body: some View {
        VStack (alignment: .leading){
            
            // HEADER / NAVIGATION
            HStack {
                Text("Shopping List")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Button((editMode ? "Save" : "Edit")) {
                    editAction()
                }
            } .padding(.horizontal)
                .padding(.vertical)
            
            // END HEADER / NAVIGATION
            
            ScrollView(.horizontal){
                HStack(spacing: 10) {
                    ForEach(recipesSelected) { rec in
                        ZStack{
                            
                            RecipeView(recipe: rec)
                            if (editMode){
                                Button(role: .destructive)
                                    {
                                    print("Removing recipe from list:")
                                    print("rec: " + rec.name)
                                    removeRecipe(recipe: rec)
                                    editMode = !editMode
                                    editMode = !editMode
                                } label: {
                                    Image(systemName: "xmark.app.fill")
                                        .imageScale(Image.Scale.large)
                                }
                                .offset(x: 82, y:-110)
                                //.onTapGesture(perform: <#T##() -> Void#>)
                            }
                        }
                    }
                }.padding()
                .frame(height: 240)
                Spacer()
            }
            .frame(height: 220.0)
            
            ScrollView(.vertical) {
                Grid() {
//                    GridRow  {
//                        Image(systemName: "square").gridColumnAlignment(.center)
//                        Text("Quantity").gridColumnAlignment(.leading)
//                        Text("Unit").gridColumnAlignment(.leading)
//                        Text("Product").gridColumnAlignment(.leading)
//                    }
                    GridRow  {
                        GeometryReader { geometry in
                            Image(systemName: "square")
                                .gridColumnAlignment(.center)
//                                .frame(minWidth: geometry.size.width * 0.1) // Set a minimum width of 10% of the column width
                                .padding(.leading, 20)
                                .frame(maxWidth: 40)
                        }
                        GeometryReader { geometry in
                            Text("Qty")
                                .gridColumnAlignment(.leading)
//                                .frame(minWidth: geometry.size.width * 0.3) // Set a minimum width of 30% of the column width
                        }
                        GeometryReader { geometry in
                            Text("Unit")
                                .gridColumnAlignment(.leading)
//                                .frame(minWidth: geometry.size.width * 0.2) // Set a minimum width of 20% of the column width
                        }
                        GeometryReader { geometry in
                            Text("Product")
                                .gridColumnAlignment(.leading)
//                                .frame(minWidth: geometry.size.width * 0.4) // Set a minimum width of 40% of the column width
                        }
                        Spacer()
                    } .padding(.bottom, 10)
                        .fontWeight(.bold)
                        .background(Color(.red))
                        Divider()
                    
                    ForEach(items, id: \.self) { item in
                        GridRow {
//                            Image(systemName: item.collected ? "checkmark.square.fill" : "square").gridColumnAlignment(.center)
//    //                        Text(String(format:"%.2f", item.quantity))
//                            Text((item.unitType == UnitType.Pcs) ? String(format:"%.0f", item.quantity) : String(format:"%.2f", item.quantity))
//                                .gridColumnAlignment(.leading)
//                            Text(item.unitType.description).gridColumnAlignment(.leading)
//                            Text(item.name).gridColumnAlignment(.leading)
                            GeometryReader { geometry in
                                Image(systemName: item.collected ? "checkmark.square.fill" : "square")
                                    .gridColumnAlignment(.center)
                                    .frame(minWidth: geometry.size.width * 0.1) // Set a minimum width of 10% of the column width
                                    .padding(.leading, 20)
                                }
                                GeometryReader { geometry in
                                    Text((item.unitType == UnitType.Pcs) ? String(format:"%.0f", item.quantity) : String(format:"%.2f", item.quantity))
                                        .gridColumnAlignment(.leading)
                                        .frame(minWidth: geometry.size.width * 0.3) // Set a minimum width of 30% of the column width
                                }
                                GeometryReader { geometry in
                                    Text(item.unitType.description)
                                        .gridColumnAlignment(.leading)
                                        .frame(minWidth: geometry.size.width * 0.2) // Set a minimum width of 20% of the column width
                                }
                                GeometryReader { geometry in
                                    Text(item.name)
                                        .gridColumnAlignment(.leading)
                                        .frame(minWidth: geometry.size.width * 0.4) // Set a minimum width of 40% of the column width
                                }
                        } .padding(.bottom, 10)
                        Divider()
                    }
                }
                .padding(.top)
            }
            Spacer()
        }
        
        
    }
    
    private func removeRecipe(recipe: Recipe){
        var index = -1
        for i in 0..<recipesSelected.count{
            if (recipesSelected[i].name == recipe.name){
                index = i
                break
            }
        }
        if (index != -1){
            recipesSelected.remove(at: index)
        }
        print("func removeRecipe removing at index: " + String(index))
    }
    
    private func editAction(){
        editMode = !editMode
    }
    
    // Will not work yet, waiting for new model.
//    private func assembleShoppingList(){
//        items = []
//        for i..<recipesSelected.count{
//            items.append(recipesSelected[i].ingredients)
//        }
//    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
