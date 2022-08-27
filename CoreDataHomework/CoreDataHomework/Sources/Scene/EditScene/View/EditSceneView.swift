//
//  EditSceneView.swift
//  CoreDataHomework
//
//  Created by Виктор on 26/08/2022.
//

import UIKit
import SnapKit

class EditSceneView: UIViewController {
// MARK: - Views
    private lazy var imageButton: UIButton = {
        let button = UIButton()
        
        let photo = UIImage(named: "jimm")
        button.setImage(photo, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.layer.cornerRadius = view.bounds.width / 4
        
        return button
    }()
    
    private lazy var nameTextField = addEditTextField(image: "person", placeholder: "Name")
    private lazy var dateBirthTextField = addEditTextField(image: "calendar", placeholder: "Date Birth")
    private lazy var currentCityTextField = addEditTextField(image: "mappin.and.ellipse", placeholder: "Current City")

    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
// MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(imageButton)
        view.addSubview(nameTextField)
        view.addSubview(dateBirthTextField)
        view.addSubview(currentCityTextField)
    }
    
    private func setupLayout() {
        imageButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(imageButton.snp.width)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.91)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
            make.top.equalTo(imageButton.snp.bottom).offset(38)
        }
        
        dateBirthTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.91)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextField.snp.bottom).offset(28)
        }
        
        currentCityTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.91)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
            make.top.equalTo(dateBirthTextField.snp.bottom).offset(28)
        }
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }

    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        
        let editButton = createCustomEditBarButton()
        let backButton = createCustomBackBarButton(back: #selector(goBack))
        
        navigationController?.navigationBar.addSubview(editButton)
        editButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        navigationController?.navigationBar.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(12)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
    }
    
// MARK: - Methods
    @objc private func goBack() {
         navigationController?.popViewController(animated: true)
    }
    
    private func addEditTextField(image: String, placeholder: String) -> UITextField {
        let image = UIImage(systemName: image)?.withTintColor(UIColor.black,
                                                              renderingMode: .alwaysOriginal)
        
        let imageView: UIImageView = {
            let imageView = UIImageView(image: image)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            imageView.snp.makeConstraints { make in
                make.width.equalTo(27)
                make.height.equalTo(27)
            }
            
            return imageView
        }()
        
        let textField: EditTextField = {
            let textField = EditTextField()
            
            textField.borderStyle = .none
            textField.leftViewMode = .always
            textField.leftView = imageView
            textField.font = UIFont.systemFont(ofSize: 14)
            
            textField.placeholder = placeholder
            
            return textField
        }()
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0,
                                  y: textField.frame.height - 1,
                                  width: textField.frame.width,
                                  height: 1)
        bottomLine.borderColor = UIColor.gray.cgColor
        
        textField.layer.addSublayer(bottomLine)
        
        return textField
    }
}
