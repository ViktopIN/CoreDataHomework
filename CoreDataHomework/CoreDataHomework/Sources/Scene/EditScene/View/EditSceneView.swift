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
    }
    
    private func setupLayout() {
        imageButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(imageButton.snp.width)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
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
}
