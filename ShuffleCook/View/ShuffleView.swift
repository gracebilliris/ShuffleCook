//
//  ShuffleView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 14/2/2023.
//

import SwiftUI

struct ShuffleView: View {
    @State var currentContent = "Noodles"
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack (alignment: .leading){
                    HStack {
                        Text("Suggested Meal")
                            .font(.largeTitle)
                            .bold()
                            .padding(.top, 30)
                            .padding(.leading, 20)
                            .frame(minHeight: 70, alignment: .leading)
                        Spacer()
                        Button(action: {
                        // add button action here
                        }) {
                            Image(systemName: "arrow.clockwise")
                                .imageScale(.large)
                                .foregroundColor(.blue)
                                .padding(.top, 30)
                                .padding(.trailing)
                                .frame(alignment: .trailing)
                        }
                    }
                    
                    Divider()
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .padding(.top)
                        .overlay(.gray.opacity(0))
                    Spacer()
                }
                VStack(alignment: .center) {
                    Image(currentContent)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(30)
                        .padding()
                    Text(currentContent)
                        .font(.title)
                        .bold()
                        .padding()
                    NavigationLink(destination: ShuffleViewNavTest()) { // must now merge into main to view a recipe
                        VStack (alignment: .center) {
                            Text("Ingredients")
                                .font(.subheadline)
                                .bold()
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(.blue)
                                .clipShape(Capsule())
                        }
                    }
                    // change contents of page example of function
                    // not linked to database of recipes and recipe page yet
                    Button("SHUFFLE") {
                        if currentContent == "Noodles" {
                            currentContent = "Omelette"
                        } else {
                            currentContent = "Noodles"
                        }
                    }
                    .padding(.top)
                }
            }
        }
    }
}

struct ShuffleView_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleView()
    }
}
