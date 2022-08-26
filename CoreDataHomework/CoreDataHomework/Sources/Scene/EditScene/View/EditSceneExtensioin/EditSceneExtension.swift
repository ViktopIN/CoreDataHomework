//
//  EditSceneExtension.swift
//  CoreDataHomework
//
//  Created by Виктор on 26/08/2022.
//

import UIKit

extension EditSceneView {
    func createCustomEditBarButton() -> UIBarButtonItem {
        let button: UIButton = {
            let button = UIButton(type: .system)
            
            button.setTitleColor(.black, for: .normal)
            button.setTitle("Edit", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 8
            
            return button
        }()
        
        button.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        let buttonBarItem = UIBarButtonItem(customView: button)
        
        return buttonBarItem
    }
    
    func createCustomBackBarButton(back to: Selector) -> UIBarButtonItem {
        let selector = to
        
        let button: UIButton = {
            let button = UIButton(type: .system)
            
            button.setBackgroundImage(UIImage(systemName: "arrow.backward")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal), for: .normal)
            button.contentMode = .scaleToFill
            
            
            button.addTarget(self, action: selector, for: .touchUpInside)
            return button
        }()
        
        button.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        let buttonBarItem = UIBarButtonItem(customView: button)
        
        return buttonBarItem
    }
}
