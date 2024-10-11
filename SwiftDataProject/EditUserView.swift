//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by Grace couch on 09/10/2024.
//
import SwiftData
import SwiftUI

struct EditUserView: View {
    @Bindable var user: User

    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            TextField("Place", text: $user.place)
            DatePicker("Join Date", selection: $user.joinDate)
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self , configurations: config)
        let user = User(name: "Grace", place: "willingdon", joinDate: .now)
        return EditUserView(user: user).modelContainer(container)
    } catch {
        return Text("Error loading preview \(error.localizedDescription)")
    }
}
