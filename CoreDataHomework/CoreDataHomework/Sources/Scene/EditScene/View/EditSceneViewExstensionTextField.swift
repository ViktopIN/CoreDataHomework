//
//  EditSceneViewExstensionTextField.swift
//  CoreDataHomework
//
//  Created by Виктор on 30/08/2022.
//

import UIKit

extension EditSceneView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
