//
//  ContentView.swift
//  HelloCoreML
//
//  Created by Mohammad Azam on 5/19/23.
//

import SwiftUI
import PhotosUI
import SwiftData

struct PhotoSelection: Hashable {

    var photoItem: PhotosPickerItem?
    var image: UIImage?
}

struct ContentView: View {
    
    @State private var isCameraSelected: Bool = false
    @Environment(\.modelContext) private var context
    
    @State private var selection: PhotoSelection = PhotoSelection()
    
    private func handleSelectedPhotoItem() {
        
        if let selectedPhotoItem = selection.photoItem {
            selectedPhotoItem.loadTransferable(type: Data.self) { result in
                switch result {
                    case .success(let data):
                        if let imageData = data {
                           print(imageData)
                        }
                    case .failure(let error):
                        print("Error loading photo item: \(error.localizedDescription)")
                }
            }
        } else if let img = selection.image, let imageData = img.pngData() {
               print(imageData)
        }
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            HStack {
                
                PhotosPicker(selection: $selection.photoItem, matching: .images, photoLibrary: .shared()) {
                   Text("Select a Photo")
                }
                
                Button("Camera") {
                    isCameraSelected = true
                }.buttonStyle(.bordered)
            }
            
        }
        .onChange(of: selection, {
            handleSelectedPhotoItem()
        })
        
        .sheet(isPresented: $isCameraSelected, content: {
            ImagePicker(image: $selection.image, sourceType: .camera)
        })
        .padding()
        .navigationTitle("SwiftData Storing Images")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
