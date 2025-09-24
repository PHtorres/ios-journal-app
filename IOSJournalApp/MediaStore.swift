//
//  MediaStore.swift
//  IOSJournalApp
//
//  Created by Paulo Henrique Torres on 22/09/25.
//
import SwiftUI

protocol MediaStore {
    func save(image: UIImage) throws -> String // returns filename
    func load(filename: String) -> UIImage?
    func delete(filename: String) throws
}
