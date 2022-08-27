//
//  EditSceneExtension.swift
//  CoreDataHomework
//
//  Created by Виктор on 26/08/2022.
//

import UIKit

extension EditSceneView {
    func createCustomEditBarButton() -> UIButton {
        let button: UIButton = {
            let button = UIButton(type: .system)
            
            button.setTitleColor(.gray, for: .normal)
            button.setTitle("Edit", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 8
            
            return button
        }()
        return button
    }
    
    func createCustomBackBarButton(back to: Selector) -> UIButton {
        let selector = to
        
        let button: UIButton = {
            let button = UIButton(type: .system)
            
            button.setBackgroundImage(UIImage(systemName: "arrow.backward")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal), for: .normal)
            button.contentMode = .scaleToFill
            
            
            button.addTarget(self, action: selector, for: .touchUpInside)
            return button
        }()
        
        return button
    }
}
