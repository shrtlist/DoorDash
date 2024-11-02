//
//  NetworkManager.swift
//  DoorDash_tech_screen
//
//  Created by Marco Abundo on 6/22/24.
//

import Foundation

class NetworkManager {
    func fetchPosts() async throws -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            return try decoder.decode([Post].self, from: data)
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
}
