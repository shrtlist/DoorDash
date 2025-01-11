//
//  PostRowView.swift
//  DoorDash_tech_screen
//
//  Created by Marco Abundo on 1/10/25.
//

import SwiftUI

struct PostRowView: View {
    let post: Post

    var body: some View {
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
