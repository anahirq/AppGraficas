//
//  ImageUploader.swift
//  AppGraficas
//
//  Created by Anahi Rojas on 04/10/21.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage){
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return}
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "userInfo/userImage\(filename)")
        
        ref.putData(imageData, metadata: nil ) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { (url, error) in
                guard let imageUrl = url?.absoluteString else { return }
            }
        }
    }
}

