//
//  ImageSaver.swift
//  InstaFilter
//
//  Created by Abul Kalam Azad on 27/8/23.
//

import SwiftUI

class ImageSaver: NSObject {
    
    var successHangler: (() -> Void)?
    var errorHandler:((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHangler?()
        }
    }
}
