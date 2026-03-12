//
//  VocabularyData.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftData

struct VocabularyData {

    static let vocabulary: [Vocabulary] = [

        // MARK: - Greetings
        Vocabulary(word: "Om Swastyastu", desc: "Traditional Balinese greeting (hello)", category: "Greetings", imageName: "greetings"),
        Vocabulary(word: "Rahajeng semeng", desc: "Good morning", category: "Greetings", imageName: "greetings"),
        Vocabulary(word: "Rahajeng siang", desc: "Good afternoon", category: "Greetings", imageName: "greetings"),
        Vocabulary(word: "Rahajeng wengi", desc: "Good evening / good night", category: "Greetings", imageName: "greetings"),

        // MARK: - Polite expressions
        Vocabulary(word: "Suksma", desc: "Thank you", category: "Polite", imageName: "polite"),
        Vocabulary(word: "Matur suksma", desc: "Thank you very much", category: "Polite", imageName: "polite"),
        Vocabulary(word: "Pangaksama", desc: "Sorry / excuse me", category: "Polite", imageName: "polite"),
        Vocabulary(word: "Tulung", desc: "Please / help", category: "Polite", imageName: "polite"),

        // MARK: - Basic conversation
        Vocabulary(word: "Kenken kabare?", desc: "How are you?", category: "Conversation", imageName: "conversation"),
        Vocabulary(word: "Becik", desc: "Good / fine", category: "Conversation", imageName: "conversation"),
        Vocabulary(word: "Tiang", desc: "I / me", category: "Conversation", imageName: "conversation"),
        Vocabulary(word: "Ragané", desc: "You", category: "Conversation", imageName: "conversation"),

        // MARK: - Question words
        Vocabulary(word: "Napi", desc: "What", category: "Question", imageName: "question"),
        Vocabulary(word: "Dija", desc: "Where", category: "Question", imageName: "question"),
        Vocabulary(word: "Kenken", desc: "How", category: "Question", imageName: "question"),
        Vocabulary(word: "Kuda", desc: "How much / how many", category: "Question", imageName: "question"),

        // MARK: - Daily life
        Vocabulary(word: "Inggih", desc: "Yes", category: "Daily", imageName: "daily"),
        Vocabulary(word: "Nenten", desc: "No / not", category: "Daily", imageName: "daily"),
        Vocabulary(word: "Sampun", desc: "Already / finished", category: "Daily", imageName: "daily"),
        Vocabulary(word: "Durung", desc: "Not yet", category: "Daily", imageName: "daily"),
        Vocabulary(word: "Umah", desc: "House / home", category: "Daily", imageName: "daily"),
        Vocabulary(word: "Melali", desc: "To go for a trip / hang out", category: "Daily", imageName: "daily"),
        Vocabulary(word: "Makan", desc: "To eat", category: "Daily", imageName: "daily"),
        Vocabulary(word: "Ngopi", desc: "Drink coffee", category: "Daily", imageName: "daily"),

        // MARK: - Slang / Casual
        Vocabulary(word: "Yen", desc: "If", category: "Slang", imageName: "slang"),
        Vocabulary(word: "Aget", desc: "Wait / hold on", category: "Slang", imageName: "slang"),

        // MARK: - Curse / rude expressions (casual street Bali)
        Vocabulary(word: "Cicing", desc: "Dog (can be used as insult)", category: "Curse", imageName: "curse"),
        Vocabulary(word: "Bego", desc: "Idiot / stupid", category: "Curse", imageName: "curse"),
        Vocabulary(word: "Lakar mati nyanan", desc: "You'll regret it later (threat)", category: "Curse", imageName: "curse")
    ]
    
    
    static func seedVocabularyIfNeeded(context: ModelContext) {

        let descriptor = FetchDescriptor<Vocabulary>()
        
        do {
            let existing = try context.fetch(descriptor)
            
            if existing.isEmpty {
                for vocab in VocabularyData.vocabulary {
                    context.insert(vocab)
                }
                
                try context.save()
                print("Seed vocabulary success")
            }
            
        } catch {
            print("Seed error:", error)
        }
    }
}
