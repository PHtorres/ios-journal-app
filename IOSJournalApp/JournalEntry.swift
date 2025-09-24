//
//  JournalEntry.swift
//  IOSJournalApp
//
//  Created by Paulo Henrique Torres on 22/09/25.
//
import SwiftUI
import SwiftData

@Model
final class JournalEntry {
    @Attribute(.unique) var id: UUID
    var createdAt: Date
    var title: String
    var body: String
    /// We persist only filenames; binary lives on disk via MediaStore
    var imageFilenames: [String]
    
    
    init(id: UUID = UUID(), createdAt: Date = Date(), title: String, body: String, imageFilenames: [String] = []) {
        self.id = id
        self.createdAt = createdAt
        self.title = title
        self.body = body
        self.imageFilenames = imageFilenames
    }
}
