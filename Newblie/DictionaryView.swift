//
//  DictionaryView.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftUI
import SwiftData

struct DictionaryView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Vocabulary.category)
    private var vocab: [Vocabulary]
    @State private var showAddSheet = false
    
    var body: some View {
        var grouped: [String: [Vocabulary]] {
            Dictionary(grouping: vocab, by: { $0.category })
        }
        NavigationStack {
            ZStack {
                
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                Group {
                    if vocab.isEmpty {
                        
                        Text("No vocabulary yet")
                            .foregroundStyle(.secondary)
                    } else {
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
}

#Preview {
    DictionaryView().modelContainer(for: Vocabulary.self)
}
