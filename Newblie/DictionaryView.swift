//
//  DictionaryView.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftUI

struct DictionaryView: View {
    @State private var showAddSheet = false
    let vocab = VocabularyData.vocabulary
    var body: some View {
        let grouped = Dictionary(grouping: vocab, by: {$0.category})
        NavigationStack {
            List {
                ForEach(grouped.keys.sorted(), id: \.self) { category in
                    Section(category) {
                        
                        ForEach(grouped[category]!) { vocab in
                            
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    Text(vocab.word)
                                        .font(.headline)
                                    
                                    Text(vocab.desc)
                                        .font(.subheadline)
                                }
                                
                                Spacer()
                                
                                Text(vocab.category)
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(.blue.opacity(0.2))
                                    .foregroundStyle(.blue)
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
            }
            .navigationTitle("Dictionary")
            .navigationSubtitle("This is where the words gather")
                        .toolbar {
                            Button {
                                showAddSheet = true
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                        .sheet(isPresented: $showAddSheet) {
                            AddWordView()
                                .presentationDetents([.medium])
                                .presentationBackground(.white)
                        }
        }
    }
}

#Preview {
    DictionaryView()
}
