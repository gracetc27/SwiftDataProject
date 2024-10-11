//
//  UserView.swift
//  SwiftDataProject
//
//  Created by Grace couch on 11/10/2024.
//
import SwiftData
import SwiftUI

struct UserView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]

    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)

                Spacer()

                Text(String(user.jobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear(perform: addSample)
    }
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }

    func addSample() {
        let user1 = User(name: "Grace Couch", place: "Willingdon", joinDate: .now)
        let job1 = Job(name: "sort MOT", priority: 2)
        let job2 = Job(name: "go to dentist", priority: 3)

        modelContext.insert(user1)

        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}


#Preview {
    UserView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)
    ])
        .modelContainer(for: User.self)
}
