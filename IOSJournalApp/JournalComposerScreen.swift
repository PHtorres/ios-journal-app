//
//  JournalComposerScreen.swift
//  IOSJournalApp
//
//  Created by Paulo Henrique Torres on 22/09/25.
//

import SwiftUI
import PhotosUI
import SwiftData

struct JournalComposerScreen: View {
    @Environment(\.dismiss) private var dismiss
    private let context: ModelContext
    @StateObject private var vm: JournalViewModel
    
    
    init(context: ModelContext) {
        self.context = context
        _vm = StateObject(wrappedValue: JournalViewModel(context: context))
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Title") { TextField("A day to remember…", text: $vm.title) }
                Section("Photos") {
                    PhotosPicker(selection: $vm.pickedItems, maxSelectionCount: 6, matching: .images) {
                        Label("Pick Photos", systemImage: "photo.badge.plus")
                    }
                    .onChange(of: vm.pickedItems) {
                        Task { await vm.addImagesFromPicker() }
                    }
                    if !vm.images.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(Array(vm.images.enumerated()), id: \.offset) { _, img in
                                    Image(uiImage: img).resizable().scaledToFill().frame(width: 120, height: 90).clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }
                    }
                }
                Section("Entry") { TextEditor(text: $vm.body).frame(minHeight: 160) }
            }
            .navigationTitle("New Entry")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() } }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { do { try vm.saveEntry(); dismiss() } catch { print("Save error: \(error)") } }
                        .disabled(vm.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}
