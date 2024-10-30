//
//  NetworkManager.swift
//  DoorDash_tech_screen
//
//  Created by Marco Abundo on 6/22/24.
//

import Foundation
import Combine

// ObservableObject so must be done in MainActor
@MainActor
class NetworkManager: ObservableObject {
    @Published var posts = [Post]()

    func fetchPosts() async throws {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw DDError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw DDError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let posts = try decoder.decode([Post].self, from: data)

            self.posts = posts
        } catch {
            throw DDError.invalidData
        }
    }
}

enum DDError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
