//
//  EditTextField.swift
//  CoreDataHomework
//
//  Created by Виктор on 27/08/2022.
//

import UIKit

class EditTextField: UITextField {
// MARK: - Properties
    let insets: UIEdgeInsets
    
// MARK: - Initialize
    init(insets: UIEdgeInsets = UIEdgeInsets(top: 15,
                                             left: 42,
                                             bottom: 15,
                                             right: 15)
    ){
        self.insets = insets
        super.init(frame: .zero)
        layer.cornerRadius = 6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
}
