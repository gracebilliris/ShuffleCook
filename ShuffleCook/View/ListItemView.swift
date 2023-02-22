//
//  LitemItemView.swift
//  ShuffleCook
//
//  Created by John Collins on 22/2/2023.
//

import SwiftUI

struct ListItemView: View {
    @Binding var item: ListItem
    //var focusedItem: FocusState<ListItem?>.Binding
    var body: some View {
        GridRow {
            Button(){
                // Functionality
                item.collected.toggle()
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

//struct ListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListItemView()
//    }
//}
