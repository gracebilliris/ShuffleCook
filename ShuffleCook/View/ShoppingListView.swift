//
//  ShoppingListView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 13/2/2023.
//

import SwiftUI

struct ShoppingListView: View {
    var body: some View {
        VStack {
            Text("Shuffle")
                .font(.largeTitle)
                .fontWeight(.bold)
            Image(systemName: "fork.knife")
                .imageScale(.large)
            Text("Cook")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding()
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
