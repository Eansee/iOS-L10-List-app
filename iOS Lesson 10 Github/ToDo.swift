//
//  ToDo.swift
//  iOS Lesson 10 Github
//
//  Created by Koh Ean See on 18/9/23.
//

import Foundation

struct Todo: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isDone: Bool = false

    init(title: String) {
        self.title = title
    }
}

