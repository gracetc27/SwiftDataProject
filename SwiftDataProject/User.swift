//
//  User.swift
//  SwiftDataProject
//
//  Created by Grace couch on 09/10/2024.
//

import SwiftData
import SwiftUI

@Model
class User {
    var name: String
    var place: String
    var joinDate: Date
    @Relationship(deleteRule: .cascade) var jobs = [Job]()

    init(name: String, place: String, joinDate: Date) {
        self.name = name
        self.place = place
        self.joinDate = joinDate
    }
}
