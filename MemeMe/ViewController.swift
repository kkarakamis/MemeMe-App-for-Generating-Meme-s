//
//  ViewController.swift
//  MemeMe
//
//  Created by Kutay Karakamış on 2.09.2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    
    var textDelegate = MemeTextDelegate()
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor:  UIColor.black/* TODO: fill in appropriate UIColor */,
        NSAttributedString.Key.foregroundColor: UIColor.white/* TODO: fill in appropriate UIColor */,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth:  7.0/* TODO: fill in appropriate Float */
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        topText.textAlignment = .center
        bottomText.textAlignment = .center
        topText.delegate = textDelegate
        bottomText.delegate = textDelegate
        topText.defaultTextAttributes = memeTextAttributes
        bottomText.defaultTextAttributes = memeTextAttributes
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {

        view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    @objc func keyboardWillHide(_ notification:Notification){
        view.frame.origin.y = 0
    }

    func getKeyboardHeight(_ notification:Notification) -> CGFloat {

        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    func subscribeToKeyboardNotifications() {

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.allowsEditing = true
        if let img = info[.originalImage] {
            self.imageView.image = (img as! UIImage)
        }
        self.imageView.contentMode = .scaleAspectFit
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectAnImage(_ sender: UIButton) {
        let selectImageController = UIImagePickerController()
        selectImageController.delegate = self
        let source: UIImagePickerController.SourceType = sender.tag == 0 ? .photoLibrary : .camera
        selectImageController.sourceType = source
        present(selectImageController, animated: true, completion: nil)
    }
    
}

