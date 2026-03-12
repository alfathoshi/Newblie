//
//  VocabularyData.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

struct VocabularyData {

    static let vocabulary: [Vocabulary] = [

        // MARK: - Greetings
        Vocabulary(word: "Om Swastyastu", desc: "Traditional Balinese greeting (hello)", category: "Greetings", imageName: "ask"),
        Vocabulary(word: "Rahajeng semeng", desc: "Good morning", category: "Greetings", imageName: "eat"),
        Vocabulary(word: "Rahajeng siang", desc: "Good afternoon", category: "Greetings", imageName: "eat"),
        Vocabulary(word: "Rahajeng wengi", desc: "Good evening / good night", category: "Greetings", imageName: "eat"),

        // MARK: - Polite expressions
        Vocabulary(word: "Suksma", desc: "Thank you", category: "Polite", imageName: "eat"),
        Vocabulary(word: "Matur suksma", desc: "Thank you very much", category: "Polite", imageName: "eat"),
        Vocabulary(word: "Pangaksama", desc: "Sorry / excuse me", category: "Polite", imageName: "ask"),
        Vocabulary(word: "Tulung", desc: "Please / help", category: "Polite", imageName: "ask"),

        // MARK: - Basic conversation
        Vocabulary(word: "Kenken kabare?", desc: "How are you?", category: "Conversation", imageName: "ask"),
        Vocabulary(word: "Becik", desc: "Good / fine", category: "Conversation", imageName: "eat"),
        Vocabulary(word: "Tiang", desc: "I / me", category: "Conversation", imageName: "ask"),
        Vocabulary(word: "Ragané", desc: "You", category: "Conversation", imageName: "eat"),

        // MARK: - Question words
        Vocabulary(word: "Napi", desc: "What", category: "Question", imageName: "ask"),
        Vocabulary(word: "Dija", desc: "Where", category: "Question", imageName: "eat"),
        Vocabulary(word: "Kenken", desc: "How", category: "Question", imageName: "ask"),
        Vocabulary(word: "Kuda", desc: "How much / how many", category: "Question", imageName: "eat"),

        // MARK: - Common responses
        Vocabulary(word: "Inggih", desc: "Yes", category: "Daily", imageName: "eat"),
        Vocabulary(word: "Nenten", desc: "No / not", category: "Daily", imageName: "ask"),
        Vocabulary(word: "Sampun", desc: "Already / finished", category: "Daily", imageName: "eat"),
        Vocabulary(word: "Durung", desc: "Not yet", category: "Daily", imageName: "ask"),

        // MARK: - Daily life
        Vocabulary(word: "Umah", desc: "House / home", category: "Daily", imageName: "eat"),
        Vocabulary(word: "Melali", desc: "To go for a trip / hang out", category: "Daily", imageName: "ask"),
        Vocabulary(word: "Jalan-jalan", desc: "To walk around / travel", category: "Daily", imageName: "eat"),
        Vocabulary(word: "Makan", desc: "To eat", category: "Daily", imageName: "eat"),
        Vocabulary(word: "Ngopi", desc: "Drink coffee", category: "Daily", imageName: "eat"),

        // MARK: - Slang / Casual
        Vocabulary(word: "Yen", desc: "If", category: "Slang", imageName: "ask"),
        Vocabulary(word: "Aget", desc: "Wait / hold on", category: "Slang", imageName: "ask"),

        // MARK: - Curse / rude expressions (casual street Bali)
        Vocabulary(word: "Cicing", desc: "Dog (can be used as insult)", category: "Curse", imageName: "ask"),
        Vocabulary(word: "Bego", desc: "Idiot / stupid", category: "Curse", imageName: "ask"),
        Vocabulary(word: "Ngamah", desc: "Shut up / stop talking", category: "Curse", imageName: "ask"),
        Vocabulary(word: "Lakar mati nyanan", desc: "You'll regret it later (threat)", category: "Curse", imageName: "ask")
    ]
}
