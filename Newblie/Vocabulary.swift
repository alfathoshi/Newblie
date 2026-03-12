//
//  Vocabulary.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftData
import Foundation

@Model
class Vocabulary {

    var id = UUID()
    var word: String
    var desc: String
    var category: String

    var imageName: String?
    var imageData: Data?

    init(word: String,
         desc: String,
         category: String,
         imageName: String? = nil,
         imageData: Data? = nil) {

        self.word = word
        self.desc = desc
        self.category = category
        self.imageName = imageName
        self.imageData = imageData
    }
}
