//
//  ContentView.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftUI

struct ContentView: View {
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
        
        
        
        
    }
}

#Preview {
    ContentView()
}
