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

struct ShoppingListView: View {
    @State private var isOn = false
    
    
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
            
            Grid() {
                GridRow  {
                    Image(systemName: isOn ? "checkmark.square.fill" : "square").gridColumnAlignment(.center)
                    Text("Quantity").gridColumnAlignment(.leading)
                    Text("Unit").gridColumnAlignment(.leading)
                    Text("Type").gridColumnAlignment(.leading)
                    //Spacer()
                    //Divider()
                }
                ForEach(items, id: \.self) { item in
                    GridRow {
                        Image(systemName: item.collected ? "checkmark.square.fill" : "square").gridColumnAlignment(.center)
                        Text("\(item.quantity)").gridColumnAlignment(.leading)
                        Text(item.unitType.description).gridColumnAlignment(.leading)
                        Text(item.name).gridColumnAlignment(.leading)
                    }
                }
//                for item in items {
//                    GridRow {
//                        Image(systemName: item.collected ? "checkmark.square.fill" : "square").gridColumnAlignment(.center)
//                        Text(item.quantity).gridColumnAlignment(.leading)
//                        Text(item.unitType).gridColumnAlignment(.leading)
//                        Text(item.name).gridColumnAlignment(.leading)
//                    }
//                }
            }
            Divider()
            Spacer()
            //.frame(width: /*@START_MENU_TOKEN@*/500.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            
//            VStack {
//                Text("List View!")
//                    .font(.title)
//                    .foregroundColor(.blue)
//                HStack {
//                    Text("Blue Mountains National Park")
//                        .font(.subheadline)
//                    //Spacer()
//                    Text("NSW")
//                        .font(.subheadline)
//                }
//            }
        }
        .padding()
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
