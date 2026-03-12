//
//  AddWordView.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftUI
import PhotosUI
import SwiftData

struct AddWordView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @State private var word = ""
    @State private var desc = ""
    @State private var category = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var imageData: Data?
    @State private var showCamera = false
    
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section {
                    TextField("Word", text: $word)
                    TextField("Description", text: $desc)
                    Picker("Category", selection: $category) {
                        Text("Daily").tag("Daily")
                        Text("Direction").tag("Direction")
                    }
                    if let imageData,
                       let uiImage = UIImage(data: imageData) {
                        
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
            .onChange(of: selectedItem) {
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                        imageData = data
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        saveWord()
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                        
                    }
                    .buttonStyle(.glassProminent)
                }
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Image(systemName: "photo")
                    }
                }
                ToolbarItem {
                    
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Image(systemName: "photo")
                    }
                }
            }
            .navigationTitle("Dictionary")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    func saveWord() {
        
        let vocab = Vocabulary(
            word: word,
            desc: desc,
            category: category,
            imageName: "ask", imageData: imageData
        )
        
        context.insert(vocab)
        
        print("Saved:", vocab.word)
    }
}

#Preview {
    AddWordView()
        .modelContainer(for: Vocabulary.self)
}
