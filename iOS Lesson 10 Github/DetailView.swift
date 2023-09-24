//
//  DetailView.swift
//  iOS Lesson 10 Github
//
//  Created by Koh Ean See on 18/9/23.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var bindedHello: String
    
    var body: some View {
        Text(bindedHello)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(bindedHello: .constant("sayanora"))
    }
}
