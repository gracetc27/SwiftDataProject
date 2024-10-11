//
//  Job.swift
//  SwiftDataProject
//
//  Created by Grace couch on 11/10/2024.
//

import SwiftData
import SwiftUI

@Model
class Job {
    var name: String
    var priority: Int
    var owner: User?

    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
