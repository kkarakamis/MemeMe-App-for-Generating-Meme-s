//
//  MemeTextDelegate.swift
//  MemeMe
//
//  Created by Kutay Karakamış on 2.09.2021.
//

import Foundation
import UIKit

class MemeTextDelegate: NSObject, UITextFieldDelegate {
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
