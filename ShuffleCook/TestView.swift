//
//  TestView.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 13/2/2023.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Pizza 🍕")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                .padding()
                HStack {
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Include Tomato")/*@END_MENU_TOKEN@*/
                    }
                    .padding()
                }
                HStack {
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Include Mozzarella")/*@END_MENU_TOKEN@*/
                    }
                    .padding()
                }
                HStack {
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Include Pineapple")/*@END_MENU_TOKEN@*/
                    }
                    .padding()
                }
                Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Quantity")/*@END_MENU_TOKEN@*/
                }
                .padding()
            }
            
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
