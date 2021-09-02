//
//  ImageController.swift
//  MemeMe
//
//  Created by Kutay Karakamış on 2.09.2021.
//
//
import Foundation
import UIKit

class MemeImageControl: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var image: UIImage = UIImage()
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.allowsEditing = true
        if let img = info[.originalImage] {
            image = (img as! UIImage)
        }
        //self.imageView.contentMode = .scaleAspectFit
        picker.dismiss(animated: true, completion: nil)
    }
    
    func getImage() -> UIImage{
        return image
    }

}
