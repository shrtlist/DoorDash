//
//  ViewModel.swift
//  DoorDash_tech_screen
//
//  Created by Marco Abundo on 11/1/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var posts = [Post]()

    private let networkManager = NetworkManager()

    func fetchPosts() async {
        do {
            posts = try await networkManager.fetchPosts()
        } catch {
            print(error.localizedDescription)
        }
    }
}
