//
//  ProfileAddingViewExtension.swift
//  CoreDataHomework
//
//  Created by Виктор on 25/08/2022.
//

import UIKit
import SnapKit

extension ProfileAddingView {
    func createAddingProfileView() -> UIView {
        let view: UIView = {
            let view = UIView()
            
            view.backgroundColor = .white
            
            return view
        }()
        
        let textField: CustomTextField = {
            let textField = CustomTextField()
            
            textField.translatesAutoresizingMaskIntoConstraints = false
            
            textField.placeholder = "Print your name here"
            textField.font = UIFont.systemFont(ofSize: 14)
                        
            textField.backgroundColor = UIColor(red: 242/255,
                                                green: 242/255,
                                                blue: 247/255,
                                                alpha: 100)
            
            return textField
        }()
        
        let button: UIButton = {
            let button = UIButton(type: .system)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.setTitle("Press", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.setTitleColor(.white, for: .normal)
            
            button.layer.backgroundColor = UIColor.systemBlue.cgColor
            button.layer.cornerRadius = 8
            
            return button
        }()
        // MARK: - Setup layout
        view.addSubview(textField)
        view.addSubview(button)
        
        textField.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.91)
            make.height.equalTo(38)
            make.top.equalTo(view.snp.top)
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.91)
            make.height.equalTo(38)
            make.top.equalTo(textField.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
        }
        
        return view
    }
}
