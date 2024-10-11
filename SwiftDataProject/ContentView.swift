//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Grace couch on 09/10/2024.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()

    var body: some View {
        NavigationStack(path: $path) {
            List(users, id: \.self) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                      let user = User(name: "", place: "", joinDate: .now)
                      modelContext.insert(user)
                      path = [user]
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
