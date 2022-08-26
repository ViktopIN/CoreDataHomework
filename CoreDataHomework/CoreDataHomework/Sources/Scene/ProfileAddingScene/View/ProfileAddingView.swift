//
//  ProfileAddingView.swift
//  CoreDataHomework
//
//  Created by Виктор on 25/08/2022.
//

import UIKit
import SnapKit

class ProfileAddingView: UIViewController {
// MARK: - Views
    private lazy var addingProfileView: UIView = createAddingProfileView()
    
// MARK: - Initialize
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
        setupLayout()
    }
    
// MARK: - Private methods
    private func setupHierarchy() {
        view.addSubview(addingProfileView)
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 242/255,
                                       green: 242/255,
                                       blue: 247/255,
                                       alpha: 100)
        
        self.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupLayout() {
        addingProfileView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
}

