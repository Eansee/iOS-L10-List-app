//
//  BlindingArrays.swift
//  iOS Lesson 10 Github
//
//  Created by Koh Ean See on 18/9/23.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var age: Int
}

struct BindingArrays: View {
    @State var personArray = [
        Person(name: "yang", age: 15),
        Person(name: "bing", age: 15)
    ]
    
    var body: some View {
        VStack{
            ForEach($personArray, id:\.id){ $person in
                DetailView(bindedHello: $person.name)
                
            }
        }
    }
}

struct BindingArrays_Previews: PreviewProvider {
    static var previews: some View {
        BindingArrays()
    }
}
