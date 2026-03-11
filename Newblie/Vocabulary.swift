//
//  Vocabulary.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import Foundation
import SwiftData

@Model
final class Vocabulary {
    var word: String
    var desc: String
    var category: String
    var imageName: String?
        
    init(word: String, desc: String, category: String, imageName: String? = nil) {
        self.word = word
        self.desc = desc
        self.category = category
        self.imageName = imageName
    }
}
