//
//  ViewModel.swift
//  DoorDash_tech_screen
//
//  Created by Marco Abundo on 11/1/24.
//

import SwiftUI

@MainActor
@Observable class ViewModel {
    var posts = [Post]()
    var isLoading: Bool = false
    private let networkManager = NetworkManager()

    func fetchPosts() async {
        guard !isLoading else { return }
        isLoading = true

        do {
            posts = try await networkManager.fetchPosts()
        } catch {
            print(error.localizedDescription)
        }

        isLoading = false
    }
}
