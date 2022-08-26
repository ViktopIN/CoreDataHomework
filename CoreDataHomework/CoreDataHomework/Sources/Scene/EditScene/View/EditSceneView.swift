//
//  EditSceneView.swift
//  CoreDataHomework
//
//  Created by Виктор on 26/08/2022.
//

import UIKit

class EditSceneView: UIViewController {
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
// MARK: - Private func
    func setupView() {
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = createCustomEditBarButton()        
        navigationItem.leftBarButtonItem = createCustomBackBarButton(back: #selector(goBack))
    }
// MARK: - Methods
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
