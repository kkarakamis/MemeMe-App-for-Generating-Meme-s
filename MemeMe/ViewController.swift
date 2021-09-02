//
//  ViewController.swift
//  MemeMe
//
//  Created by Kutay Karakamış on 2.09.2021.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    var imageDelegator: MemeImageControl = MemeImageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)

    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.allowsEditing = true
//        if let img = info[.originalImage] {
//            self.imageView.image = (img as! UIImage)
//        }
//        self.imageView.contentMode = .scaleAspectFit
//        picker.dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func selectAnImage(_ sender: Any) {
        let selectImageController = UIImagePickerController()
        selectImageController.delegate = self.imageDelegator
        selectImageController.sourceType = .photoLibrary
        present(selectImageController, animated: true, completion: nil)
    }
    
    
    @IBAction func selectAnImageFromAlbum(_ sender: Any) {
        let selectImageController = UIImagePickerController()
        selectImageController.delegate = self.imageDelegator
        selectImageController.sourceType = .photoLibrary
        present(selectImageController, animated: true, completion: nil)
    }
    

    @IBAction func selectAnImageFromCamera(_ sender: Any) {
        let selectImageController = UIImagePickerController()
        selectImageController.delegate = self.imageDelegator
        selectImageController.sourceType = .camera
        present(selectImageController, animated: true, completion: nil)
    }
    
}

