//
//  JournalDetailScreen.swift
//  IOSJournalApp
//
//  Created by Paulo Henrique Torres on 22/09/25.
//

import SwiftUI

struct JournalDetailScreen: View {
    @Environment(\ .dismiss) private var dismiss
    let entry: JournalEntry
    private let store = FileMediaStore()
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(entry.title).font(.title2).bold()
                Text(entry.createdAt.formatted(date: .abbreviated, time: .shortened)).font(.caption).foregroundStyle(.secondary)
                if !entry.imageFilenames.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(entry.imageFilenames, id: \.self) { name in
                                if let ui = store.load(filename: name) {
                                    Image(uiImage: ui).resizable().scaledToFill().frame(width: 220, height: 160).clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }
                        }.padding(.vertical, 4)
                    }
                }
                Text(entry.body).font(.body)
                Spacer(minLength: 40)
            }
            .padding()
        }
        .navigationTitle("Entry")
        .navigationBarTitleDisplayMode(.inline)
    }
}
