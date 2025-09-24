//
//  FileMediaStore.swift
//  IOSJournalApp
//
//  Created by Paulo Henrique Torres on 22/09/25.
//
import SwiftUI

final class FileMediaStore: MediaStore {
    private let dir: URL
    init() {
        self.dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    func save(image: UIImage) throws -> String {
        let name = UUID().uuidString + ".jpg"
        let url = dir.appendingPathComponent(name)
        guard let data = image.jpegData(compressionQuality: 0.9) else { throw NSError(domain: "Media", code: 1) }
        try data.write(to: url, options: .atomic)
        return name
    }
    func load(filename: String) -> UIImage? {
        let url = dir.appendingPathComponent(filename)
        guard let data = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: data)
    }
    func delete(filename: String) throws {
        let url = dir.appendingPathComponent(filename)
        try? FileManager.default.removeItem(at: url)
    }
}
