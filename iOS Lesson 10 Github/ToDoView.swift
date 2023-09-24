//
//  ToDoView.swift
//  iOS Lesson 10 Github
//
//  Created by Koh Ean See on 18/9/23.
//

import SwiftUI

struct ToDoView: View {

    @State private var listofTodos = [
        Todo(title: "DO HOMEWORK"),
        Todo(title: "do your Swift homework!!!"),
        Todo(title: "walk the frog")
    ]
    
    @State private var newTask = ""
    
    let database = Database()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listofTodos) { todo in
                    HStack {
                        Text(todo.title)
                        
                        Spacer()
                        
                        Button {
                            toggleTodoCompletion(todo: todo)
                        } label: {
                            Image(systemName: todo.isDone ? "checkmark.circle" : "circle")
                        }
                    }
                }
                .onDelete(perform: deleteTask)
                .onMove(perform: moveTask)
            }
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        TextField("Add a new task", text: $newTask)
                        Button(action: {
                            addTask()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                            
                        }
                    }
                }
            }
        }
        .onDisappear {
            // Save the list of task titles to UserDefaults when the view disappears
            let taskTitles = listofTodos.map { $0.title }
            database.save(items: taskTitles)
        }
    }
    
    private func toggleTodoCompletion(todo: Todo) {
        if let index = listofTodos.firstIndex(where: { $0.id == todo.id }) {
            listofTodos[index].isDone.toggle()
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        listofTodos.remove(atOffsets: offsets)
    }
    
    private func moveTask(from source: IndexSet, to destination: Int) {
        listofTodos.move(fromOffsets: source, toOffset: destination)
    }
    
    private func addTask() {
        if !newTask.isEmpty {
            let todo = Todo(title: newTask)
            listofTodos.append(todo)
            newTask = ""
        }
    }
    
    struct ToDoView_Previews: PreviewProvider {
        static var previews: some View {
            ToDoView()
        }
    }
}
