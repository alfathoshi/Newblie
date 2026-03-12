//
//  VocabularyView.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftUI

struct VocabularyView: View {
    @State var vocabs = VocabularyData.vocabulary
    @State private var dragOffset: CGSize = .zero
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                
                ForEach(Array(vocabs.prefix(3).enumerated()), id: \.element.id) { index, vocab in
                    
                    VocabularyCard(vocab: vocab)
                    
                        .scaleEffect(1 - CGFloat(index) * 0.05)
                        .offset(
                            x: index == 0 ? dragOffset.width : 0,
                            y: CGFloat(index) * -36
                        )
                    
                        .rotationEffect(.degrees(index == 0 ? Double(dragOffset.width / 20) : 0))
                    
                        .zIndex(Double(vocabs.count - index))
                    
                    
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
            .animation(.spring(), value: vocabs)
            .navigationTitle("Newblie")
            .navigationSubtitle("Learn more about Bali Language")
        }
    }
    func moveCardToBack() {
        let first = vocabs.removeFirst()
        vocabs.append(first)
    }
}

#Preview {
    VocabularyView()
}
