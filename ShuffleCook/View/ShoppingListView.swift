//
//  ShoppingListView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 13/2/2023.
//

import SwiftUI

private var item1 = ListItem(collected: true, unitType: "Kg", quantity: 1.5, name: "Flour", recipeId: "")
var item2 = ListItem(collected: false, unitType: "Pcs", quantity: 6, name: "Eggs", recipeId: "")
private var items: [ListItem] = [item1, item2]
//private var items: [ListItem] = [ListItem]()
//items.append(item1)
//items.append(item2)

//var recipesSelected: [Recipe] = [Recipe(id: 3,
//                                        name: "Margherita Pizza",
//                                        ingredients: ["Tomato"],
//                                        totalTime: 10, instructions: ["1.", "2.", "3."],
//                                        servings: 4,
//                                        cardColor: "Color4"
//                                       ),
//                                 Recipe(id: 2, name: "Shepherds Pie",
//                                        ingredients: ["Beef"],
//                                        totalTime: 10, instructions: ["1.", "2.", "3."],
//                                        servings: 4,
//                                        cardColor: "Color3"
//                                       ),
//                                 Recipe(id: 1,
//                                        name: "Cheese Sandwich",
//                                        ingredients: ["Beef"],
//                                        totalTime: 10, instructions: ["1.", "2.", "3."],
//                                        servings: 4,
//                                        cardColor: "Color1"
//                                       )]

struct ShoppingListView: View {
    @State var selectedRecipe:[Recipe]
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
                    ForEach(selectedRecipe) { rec in
                        ZStack{
                            
                            RecipeView(recipe: rec)
//                            let _ = print("Rendering selected recipe: " + rec.name)
                            if (editMode){
                                Button(role: .destructive){
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
                    let _: () = assembleShoppingList()
                    ForEach(items, id: \.self) { item in
                        GridRow {
                            Image(systemName: item.collected ? "checkmark.square.fill" : "square").gridColumnAlignment(.center)
    //                        Text(String(format:"%.2f", item.quantity))
                            Text((item.unitType == "Pcs") ? String(format:"%.0f", item.quantity) : String(format:"%.2f", item.quantity))
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
        for i in 0..<selectedRecipe.count{
            if (selectedRecipe[i].name == recipe.name){
                index = i
                break
            }
        }
        if (index != -1){
            selectedRecipe.remove(at: index)
        }
        print("func removeRecipe removing at index: " + String(index))
    }
    
    private func editAction(){
        editMode = !editMode
    }
    
    private func assembleShoppingList(){
        items = []
        for recit in 0..<selectedRecipe.count{
            for ingr in 0..<selectedRecipe[recit].ingredients.count{
//                if (items.contains(where: {$0.name == selectedRecipe[recit].name})){
//                    print(selectedRecipe[recit].name + " already exists in list, adding to quantity")
//                    let index = items.firstIndex(where: {$0.name == selectedRecipe[recit].name})
//                    items[index].quantity += selectedRecipe[recit].ingredients[ingr].quantity
//                }
                if let row = items.firstIndex(where: {$0.name == selectedRecipe[recit].name}) {
                    items[row].quantity += selectedRecipe[recit].ingredients[ingr].quantity
                }
                else {
                    items.append(ListItem(collected: false, unitType: selectedRecipe[recit].ingredients[ingr].unitType, quantity: selectedRecipe[recit].ingredients[ingr].quantity, name: selectedRecipe[recit].ingredients[ingr].name, recipeId: String(selectedRecipe[recit].id)))
                }
            }
        }
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView(selectedRecipe: [Recipe(id: 3,
                                 name: "Margherita Pizza",
                                 ingredients: [
                                    Ingredient(quantity: 1, unitType: "Pcs", name: "Tomato", index: 0),
                                    Ingredient(quantity: 1, unitType: "Pcs", name: "Pizza Base", index: 1),
                                    Ingredient(quantity: 100, unitType: "Pcs", name: "Cheese", index: 2),
                                 ],
                                 totalTime: 10, instructions: ["1.", "2.", "3."],
                                 servings: 4,
                                 cardColor: "Color4"
                                ),
                          Recipe(id: 2, name: "Shepherds Pie",
                                 ingredients: [
                                    Ingredient(quantity: 1, unitType: "Pcs", name: "Potato", index: 0),
                                    Ingredient(quantity: 40.56, unitType: "Kg", name: "Cherry Tomatoes", index: 1),
                                 ],
                                 totalTime: 10, instructions: ["1.", "2.", "3."],
                                 servings: 4,
                                 cardColor: "Color3"
                                ),
                          Recipe(id: 1,
                                 name: "Cheese Sandwich",
                                 ingredients: [
                                    Ingredient(quantity: 2, unitType: "Pcs", name: "Slice of Bread", index: 0),
                                    Ingredient(quantity: 100, unitType: "g", name: "Cheese", index: 1),
                                ],
                                 totalTime: 10, instructions: ["1.", "2.", "3."],
                                 servings: 4,
                                 cardColor: "Color1"
                                )])
    }
}
