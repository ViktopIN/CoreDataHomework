//
//  ProfileAddingViewExtension.swift
//  CoreDataHomework
//
//  Created by Виктор on 25/08/2022.
//

import UIKit

extension ProfileAddingView {
    func createCustomTitleForNavigationBarView() -> UIView {
        let label: UILabel = {
            let label = UILabel()
            
            label.text = "Users"
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        let textField: UITextField = {
            let textField = UITextField()
            
            textField.borderStyle = .roundedRect
            textField.placeholder = "Print your name here"
            
            return textField
        }()
        
        let button: UIButton = {
            let button = UIButton(type: .system)
            
            button.setTitle("Press", for: .normal)
            
            return button
        }()
        // MARK: - Setup layout
    }
}
