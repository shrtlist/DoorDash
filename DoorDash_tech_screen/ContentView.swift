//
//  ContentView.swift
//  DoorDash_tech_screen
//
//  Created by Marco Abundo on 6/22/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var navPath: [Post] = []

    var body: some View {
        NavigationStack(path: $navPath) {
            List(viewModel.posts) { post in
                Button(
                    action: {
                        navPath.append(post)
                    },
                    label: {
                        PostRowView(post: post)
                    }
                )
                .buttonStyle(.plain)
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
            .navigationDestination(for: Post.self) { post in
                DetailView(post: post)
            }
        }
    }
}

#Preview {
    ContentView()
}
