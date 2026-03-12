//
//  VocabularyView.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftUI
import SwiftData

struct VocabularyView: View {
    
    @Query var vocabs: [Vocabulary]
    
    @State private var cardStack: [Vocabulary] = []
    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
        
        let visibleCards = Array(cardStack.prefix(3).enumerated())
        
        NavigationStack {
            ZStack {
                
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                if cardStack.isEmpty {
                    
                    Text("No vocabulary yet")
                        .foregroundStyle(.secondary)
                    
                } else {
                    
                    ForEach(visibleCards, id: \.element.id) { index, vocab in
                        
                        VocabularyCard(vocab: vocab)
                        
                            .scaleEffect(1 - CGFloat(index) * 0.05)
                            
                            .offset(
                                x: index == 0 ? dragOffset.width : 0,
                                y: CGFloat(index) * -36
                            )
                            
                            .rotationEffect(
                                .degrees(index == 0 ? Double(dragOffset.width / 20) : 0)
                            )
                            
                            .zIndex(Double(3 - index))
                            
                            .gesture(
                                index == 0 ?
                                DragGesture()
                                    .onChanged { value in
                                        dragOffset = value.translation
                                    }
                                    .onEnded { value in
                                        
                                        if abs(value.translation.width) > 120 {
                                            
                                            dragOffset.width = value.translation.width > 0 ? 1000 : -1000
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                moveCardToBack()
                                                dragOffset = .zero
                                            }
                                            
                                        } else {
                                            dragOffset = .zero
                                        }
                                    }
                                : nil
                            )
                    }
                }
            }
            .animation(.spring(), value: cardStack)
            .navigationTitle("Newblie")
            .navigationSubtitle("Learn more about Bali Language")
        }
        
        // sync database → UI stack
        .onAppear {
            cardStack = vocabs
        }
        .onChange(of: vocabs) {
            cardStack = vocabs
        }
    }
    
    
    func moveCardToBack() {
        guard !cardStack.isEmpty else { return }
        let first = cardStack.removeFirst()
        cardStack.append(first)
    }
}

#Preview {
    VocabularyView()
}
