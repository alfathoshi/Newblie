//
//  AddWordView.swift
//  Newblie
//
//  Created by Muhammad Bintang Al-Fath on 11/03/26.
//

import SwiftUI
import PhotosUI

struct AddWordView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var word: String = ""
    @State private var title = ""
    @State private var description = ""
    @State private var notificationsOn = false
    @State private var category = "Work"
    @State private var selectedItem: PhotosPickerItem?
    @State private var imageData: Data?
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section {
                    TextField("Word", text: $title)
                    TextField("Description", text: $description)
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
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
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
        print("Save word")
    }
}

#Preview {
    AddWordView()
}


