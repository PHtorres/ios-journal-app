//
//  EntryThumbnailView.swift
//  IOSJournalApp
//
//  Created by Paulo Henrique Torres on 22/09/25.
//
import SwiftUI

struct EntryThumbnailView: View {
    let entry: JournalEntry
    private let store = FileMediaStore()
    var body: some View {
        if let first = entry.imageFilenames.first, let ui = store.load(filename: first) {
            Image(uiImage: ui).resizable().scaledToFill().frame(width: 56, height: 56).clipShape(RoundedRectangle(cornerRadius: 8))
        } else {
            Image(systemName: "photo.on.rectangle.angled").frame(width: 56, height: 56)
        }
    }
}
