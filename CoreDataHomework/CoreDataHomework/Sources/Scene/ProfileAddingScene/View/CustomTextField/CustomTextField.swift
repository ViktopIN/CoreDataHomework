//
//  CustomTextField.swift
//  CoreDataHomework
//
//  Created by Виктор on 26/08/2022.
//

import UIKit

class CustomTextField: UITextField {
// MARK: - Properties
    let insets: UIEdgeInsets
    
// MARK: - Initialize
    init(insets: UIEdgeInsets = ProfileAddingView.Metrics.textFieldInsetEdges
    ){
        self.insets = insets
        super.init(frame: .zero)
        
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = ProfileAddingView.Metrics.textFieldsLayerButtonCornerRadius
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
