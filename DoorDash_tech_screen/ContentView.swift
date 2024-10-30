//
//  ContentView.swift
//  DoorDash_tech_screen
//
//  Created by Marco Abundo on 6/22/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var networkManager = NetworkManager()

    var body: some View {
        NavigationStack {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(post: post)) {
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Posts")
            .refreshable {
                await doIt()
            }
            .task {
                await doIt()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                Task {
                    await doIt()
                }
            }
        }
    }

    private func doIt() async {
        do {
            try await networkManager.fetchPosts()
        } catch DDError.invalidData {

        } catch DDError.invalidResponse {

        } catch DDError.invalidURL {

        } catch {

        }
    }
}

#Preview {
    ContentView()
}
