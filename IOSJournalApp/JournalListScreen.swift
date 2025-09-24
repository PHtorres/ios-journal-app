//
//  JournalListScreen.swift
//  IOSJournalApp
//
//  Created by Paulo Henrique Torres on 22/09/25.
//
import SwiftUI
import SwiftData

struct JournalListScreen: View {
    @Environment(\ .modelContext) private var context
    @Query(sort: [SortDescriptor(\JournalEntry.createdAt, order: .reverse)]) private var entries: [JournalEntry]
    @State private var showComposer = false
    
    
    var body: some View {
        NavigationStack {
            Group {
                if entries.isEmpty {
                    ContentUnavailableView("No entries yet", systemImage: "square.and.pencil", description: Text("Tap + to write your first journal entry."))
                } else {
                    List {
                        ForEach(entries) { entry in
                            NavigationLink(value: entry) {
                                HStack(alignment: .top, spacing: 12) {
                                    EntryThumbnailView(entry: entry)
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(entry.title).font(.headline).lineLimit(1)
                                        Text(entry.body).font(.subheadline).foregroundStyle(.secondary).lineLimit(2)
                                        Text(entry.createdAt, style: .date).font(.caption).foregroundStyle(.secondary)
                                    }
                                }.padding(.vertical, 4)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: JournalEntry.self) { entry in
                JournalDetailScreen(entry: entry)
            }
            .navigationTitle("Journal")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showComposer = true } label: { Image(systemName: "plus") }
                }
            }
            .sheet(isPresented: $showComposer) {
                JournalComposerScreen(context: context)
            }
        }
    }
}
