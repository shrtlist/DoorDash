//
//  DetailView.swift
//  DoorDash_tech_screen
//
//  Created by Marco Abundo on 6/22/24.
//

import SwiftUI

struct DetailView: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(post.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(post.body)
                .font(.body)
        }
        .padding()
        .navigationTitle("Detail")
    }
}
