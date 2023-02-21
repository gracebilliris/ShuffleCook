//
//  ShoppingListView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 13/2/2023.
//

import SwiftUI

private var item1 = ListItem(collected: true, unitType: "Kg", quantity: 1.5, name: "Flour", recipeId: "")
var item2 = ListItem(collected: false, unitType: "Pcs", quantity: 6, name: "Eggs", recipeId: "")
//private var items: [ListItem] = [item1, item2]
private var items: [ListItem] = [ListItem]()
//items.append(item1)
//items.append(item2)

struct ShoppingListView: View {
    //@State var selectedRecipe:[Recipe]
    @State var text = ""
    @State var editMode = false
//    @State var items: [ListItem] = []
    @EnvironmentObject var model: Model
    var body: some View {
        VStack (alignment: .leading){
            let _: () = assembleShoppingList()
            // HEADER / NAVIGATION
            Text("Shopping List")
                .font(.largeTitle)
                .padding(.top, 30)
                .padding(.leading, 30)
                .foregroundColor(Color("mainfont"))
            
            Button((editMode ? "Save" : "Edit")) {
                editAction()
            }.offset(x: 320, y: -30)
            
            Divider()
                .frame(minWidth: 100)
                .frame(height: 1)
                .overlay(.gray.opacity(0))
            // END HEADER / NAVIGATION
            
            ScrollView(.horizontal){
                HStack(spacing: 10) {
                    ForEach(model.globalSelectedRecipes) { rec in
                        ZStack{
                            
                            RecipeView(recipe: rec)
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
                                        .shadow(radius: 2)
                                }
                                .offset(x: 80, y:-100)
                            }
                        }
                    }
                }.padding()
                .frame(height: 230)
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
//                    let _: () = assembleShoppingList()
                    ForEach(items, id: \.self) { item in
                        GridRow {
                            Button(){
                                //item.changeCollected()
                                if let row = items.firstIndex(where: {$0.self == item.self}) {
//                                    items[row].changeCollected()
                                    items[row].collected = !items[row].collected
                                    print("Button pressed on row: " + String(row) + "\nCollected: " + String(items[row].collected) + ",\tname: " + String(items[row].name))
                                }
                            } label: {
                                Image(systemName: item.collected ? "checkmark.square.fill" : "square").gridColumnAlignment(.center)
                                let _ = print("Drawing button for: " + item.name + ",\tcollected: " + String(item.collected))
                            }
//                            Image(systemName: item.collected ? "checkmark.square.fill" : "square").gridColumnAlignment(.center)
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
        
        
    }//.onAppear(perform: assembleShoppingList())
//        .onReceive(<#T##P#>, perform: <#T##(P.Output) -> Void#>)
    
    private func removeRecipe(recipe: Recipe){
        var index = -1
        for i in 0..<model.globalSelectedRecipes.count{
            if (model.globalSelectedRecipes[i].name == recipe.name){
                index = i
                break
            }
        }
        if (index != -1){
            model.globalSelectedRecipes.remove(at: index)
        }
        print("func removeRecipe removing at index: " + String(index))
    }
    
    private func editAction(){
        editMode = !editMode
    }
    
    public func update(){
        editMode = !editMode
        editMode = !editMode
    }
    
    private func assembleShoppingList(){
        items = []
        //selectedRecipe
        for recit in 0..<model.globalSelectedRecipes.count{
            for ingr in 0..<model.globalSelectedRecipes[recit].ingredients.count{
//                if (items.contains(where: {$0.name == selectedRecipe[recit].name})){
//                    print(selectedRecipe[recit].name + " already exists in list, adding to quantity")
//                    let index = items.firstIndex(where: {$0.name == selectedRecipe[recit].name})
//                    items[index].quantity += selectedRecipe[recit].ingredients[ingr].quantity
//                }
                if let row = items.firstIndex(where: {$0.name == model.globalSelectedRecipes[recit].ingredients[ingr].name}) {
                    items[row].quantity += model.globalSelectedRecipes[recit].ingredients[ingr].quantity
                }
                else {
                    items.append(ListItem(collected: false, unitType: model.globalSelectedRecipes[recit].ingredients[ingr].unitType, quantity: model.globalSelectedRecipes[recit].ingredients[ingr].quantity, name: model.globalSelectedRecipes[recit].ingredients[ingr].name, recipeId: String(model.globalSelectedRecipes[recit].id)))
                }
            }
        }
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
        //        ShoppingListView(selectedRecipe: [Recipe(id: 3,
        //                                 name: "Margherita Pizza",
        //                                 ingredients: [
        //                                    Ingredient(quantity: 1, unitType: "Pcs", name: "Tomato", index: 0),
        //                                    Ingredient(quantity: 1, unitType: "Pcs", name: "Pizza Base", index: 1),
        //                                    Ingredient(quantity: 100, unitType: "Pcs", name: "Cheese", index: 2),
        //                                 ],
        //                                 totalTime: 10, instructions: ["1.", "2.", "3."],
        //                                 servings: 4,
        //                                 cardColor: "Color4"
        //                                ),
        //                          Recipe(id: 2, name: "Shepherds Pie",
        //                                 ingredients: [
        //                                    Ingredient(quantity: 1, unitType: "Pcs", name: "Potato", index: 0),
        //                                    Ingredient(quantity: 40.56, unitType: "Kg", name: "Cherry Tomatoes", index: 1),
        //                                 ],
        //                                 totalTime: 10, instructions: ["1.", "2.", "3."],
        //                                 servings: 4,
        //                                 cardColor: "Color3"
        //                                ),
        //                          Recipe(id: 1,
        //                                 name: "Cheese Sandwich",
        //                                 ingredients: [
        //                                    Ingredient(quantity: 2, unitType: "Pcs", name: "Slice of Bread", index: 0),
        //                                    Ingredient(quantity: 100, unitType: "g", name: "Cheese", index: 1),
        //                                ],
        //                                 totalTime: 10, instructions: ["1.", "2.", "3."],
        //                                 servings: 4,
        //                                 cardColor: "Color1"
        //                                )])
        //    }
    }
}
