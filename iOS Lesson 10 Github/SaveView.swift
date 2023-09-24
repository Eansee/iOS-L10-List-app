//
//  SaveView.swift
//  iOS Lesson 10 Github
//
//  Created by Koh Ean See on 18/9/23.
//

import Foundation

final class Database {
    private let SAVE_TASK = "save_changes" // Adjust the key as needed
    
    func save(items: [String]) {
        UserDefaults.standard.set(items, forKey: SAVE_TASK)
    }
    
    func load() -> [String] {
        return UserDefaults.standard.array(forKey: SAVE_TASK) as? [String] ?? []
    }
}
