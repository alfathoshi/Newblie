//
//  VocabularyCard.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftUI

struct VocabularyCard: View {
    var vocab: Vocabulary
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.regularMaterial)
                .shadow(
                    color: .black.opacity(0.1),
                    radius: 25,
                    y: 20
                )
            
            
            VStack(spacing: 16) {
                
                Text(vocab.category)
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(.blue.opacity(0.2))
                    .foregroundStyle(.blue)
                    .clipShape(Capsule())
                
                if let data = vocab.imageData,
                   let uiImage = UIImage(data: data) {
                    
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                    
                } else if let imageName = vocab.imageName {
                    
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                    
                } else {
                    
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                }
                
                
                
                Text(vocab.word)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(vocab.desc)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
            }
            .padding(16)
        }
        .frame(width: 354, height: 497)
    }
}

#Preview {
    VocabularyCard(vocab: Vocabulary(word: "Test", desc: "Test", category: "Test"))
}
