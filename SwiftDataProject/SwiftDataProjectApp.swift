//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Grace couch on 09/10/2024.
//
import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            QueryPredicateExampleView()
        }
        .modelContainer(for: User.self)
    }
}
