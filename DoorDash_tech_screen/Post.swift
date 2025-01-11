//
//  Post.swift
//  DoorDash_tech_screen
//
//  Created by Marco Abundo on 6/22/24.
//

struct Post: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let body: String
}
