//
//  JournalViewModel.swift
//  IOSJournalApp
//
//  Created by Paulo Henrique Torres on 22/09/25.
//
import SwiftUI
import PhotosUI
import SwiftData

@MainActor
final class JournalViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var body: String = ""
    @Published var pickedItems: [PhotosPickerItem] = []
    @Published var images: [UIImage] = []
    
    
    private let mediaStore: MediaStore
    private let context: ModelContext
    
    
    init(context: ModelContext, mediaStore: MediaStore = FileMediaStore()) {
        self.context = context
        self.mediaStore = mediaStore
    }
    
    
    func addImagesFromPicker() async {
        for item in pickedItems {
            if let data = try? await item.loadTransferable(type: Data.self),
               let img = UIImage(data: data) {
                images.append(img)
            }
        }
        pickedItems.removeAll()
    }
    
    
    func saveEntry() throws {
        // Save images to disk first
        var filenames: [String] = []
        for img in images { filenames.append(try mediaStore.save(image: img)) }
        let entry = JournalEntry(title: title, body: body, imageFilenames: filenames)
        context.insert(entry)
        try context.save()
        // reset form
        title = ""; body = ""; images = []
    }
    
    
    func delete(entry: JournalEntry) {
        // best-effort cleanup of images
        entry.imageFilenames.forEach { try? mediaStore.delete(filename: $0) }
        context.delete(entry)
        try? context.save()
    }
}
