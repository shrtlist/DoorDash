//
//  ContentView.swift
//  DoorDash_tech_screen
//
//  Created by Marco Abundo on 6/22/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.posts) { post in
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
                await viewModel.fetchPosts()
            }
            .task {
                await viewModel.fetchPosts()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                Task {
                    await viewModel.fetchPosts()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
