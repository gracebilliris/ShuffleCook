//
//  ShoppingListView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 13/2/2023.
//

import SwiftUI

private var items: [ListItem] = [ListItem]()

struct ShoppingListView: View {
    @State var text = ""
    @State var editMode = false
    @EnvironmentObject var model: Model
    var body: some View {
        VStack (alignment: .leading){
            let _: () = assembleShoppingList()
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
                    ForEach(model.globalSelectedRecipes) { rec in
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
                                        .shadow(radius: 2)
                                }
                                .offset(x: 82, y:-110)
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
                    GridRow  {
                        Image(systemName: "square").gridColumnAlignment(.center)
                            .padding(.leading, 20)
                            .frame(maxWidth: 60)
                        Text("Qty").gridColumnAlignment(.leading)
                        Text("Unit").gridColumnAlignment(.leading)
                        Text("Product").gridColumnAlignment(.leading)
                    }
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                    .offset(x: -20)
                    Divider()
                        .ignoresSafeArea()
    
                    ForEach(items, id: \.self) { item in
                        GridRow {
                            Button(){
                                if let row = items.firstIndex(where: {$0.self == item.self}) {
                                    items[row].collected = !items[row].collected
                                    print("Button pressed on row: " + String(row) + "\nCollected: " + String(items[row].collected) + ",\tname: " + String(items[row].name))
                                }
                            } label: {
                                Image(systemName: item.collected ? "checkmark.square.fill" : "square").gridColumnAlignment(.center)
                                let _ = print("Drawing button for: " + item.name + ",\tcollected: " + String(item.collected))
                            }
                            .foregroundColor(Color.black)
                            .padding(.leading, 20)

                            Text((item.unitType == "Kg") ? String(format:"%.2f", item.quantity) : String(format:"%.0f", item.quantity))
                                .gridColumnAlignment(.leading)
                            Text(item.unitType.description).gridColumnAlignment(.leading)
                            Text(item.name).gridColumnAlignment(.leading)
                        }
                        .offset(x: -20)
                        Divider()
                            .ignoresSafeArea()
                    }
                }
                .padding(.top)
            }
            Spacer()
        }
    }
    
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
    }
}
