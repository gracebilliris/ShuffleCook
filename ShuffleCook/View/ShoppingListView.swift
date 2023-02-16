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
                                        totalTime: 10, instructions: ["1.", "2.", "3."],
                                        servings: 4,
                                        cardColor: "Color4"
                                       ),
                                 Recipe(id: 2, name: "Shepherds Pie",
                                        ingredients: ["Beef"],
                                        totalTime: 10, instructions: ["1.", "2.", "3."],
                                        servings: 4,
                                        cardColor: "Color3"
                                       ),
                                 Recipe(id: 1,
                                        name: "Cheese Sandwich",
                                        ingredients: ["Beef"],
                                        totalTime: 10, instructions: ["1.", "2.", "3."],
                                        servings: 4,
                                        cardColor: "Color1"
                                       )]

struct ShoppingListView: View {
    @State var text = ""
    @State var editMode = false
    var body: some View {
        VStack (alignment: .leading){
            
            // HEADER / NAVIGATION
            Text("Shopping List")
                .font(.largeTitle)
                .padding(.top, 30)
                .padding(.leading, 30)
                .foregroundColor(Color("mainfont"))
            
            Button((editMode ? "Save" : "Edit")) {
                editAction()
            }.offset(x: 320, y: -30)
            
//            Divider()
//                .frame(minWidth: 100)
//                .frame(height: 1)
//                .overlay(.gray.opacity(0))

//            SearchBar(text: $text)
//                .padding(.leading, 20)
//                .padding(.trailing, 20)
            
            Divider()
                .frame(minWidth: 100)
                .frame(height: 1)
                .overlay(.gray.opacity(0))
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
                                       // .offset(x: 80, y:-100)
//                                        .position(x: 190, y:75)
                                        .shadow(radius: 2)
                                }
                                .offset(x: 80, y:-100)
                                //.onTapGesture(perform: <#T##() -> Void#>)
                            }
                        }
                    }
                }.padding()
                .frame(height: 230)
                //Divider()
                Spacer()
            }
            .frame(height: 220.0)
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
