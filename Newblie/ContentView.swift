//
//  ContentView.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State private var seeded = false
    
    var body: some View {
        
        TabView {
            
            VocabularyView()
                .tabItem {
                    Label("Vocabulary", systemImage: "character.book.closed")
                }
            
            DictionaryView()
                .tabItem {
                    Label("Dictionary", systemImage: "book")
                }
            
        }
        .onAppear {
            if !seeded {
                VocabularyData.seedVocabularyIfNeeded(context: context)
                seeded = true
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Vocabulary.self)
}
