//
//  ContentView.swift
//  iOS Lesson 10 Github
//
//  Created by Koh Ean See on 18/9/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDark = false
    @State var sheetShown = false
    @State var hello = "slay"
    @State var count = 3

    var body: some View {
        NavigationView {
            VStack {
                Toggle("Turn on dark mode", isOn: $isDark)
                    .padding(.horizontal)
                    .onChange(of: isDark) { _ in
                        // Handle dark mode change if needed
                    }
                    .preferredColorScheme(isDark ? .dark : .light)
                Spacer()

                NavigationLink(destination: ToDoView()) {
                    Text("Entrance to ToDo list")
                        .padding()
                }
                Text("\(count)")
                Stepper("Things that have not done", value: $count)
                    .padding(.horizontal)
                Spacer()

                Button("Add") {
                    hello += "y"
                }
                TextField("Enter some text", text: $hello)
            

                Button {
                    sheetShown.toggle()
                } label: {
                    Text("Show as Sheet")
                }
            }
            .sheet(isPresented: $sheetShown) {
                DetailView(bindedHello: $hello)
            }
            .navigationTitle("ContentView")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("+") {
                        sheetShown.toggle()
            
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
