//
//  Description.swift
//  Transfer
//
//  Created by Денис Александров on 10.05.2024.
//

import Foundation

final class User {
    let username: String
    let password: String
    var person: Person?
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

final class Person {
    let firstName: String
    let lastName: String
    let job: String
    let position: String
    let bio: String
    weak var user: User?
    
    init(firstName: String, lastName: String, job: String, position: String, bio: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.job = job
        self.position = position
        self.bio = bio
    }
}
