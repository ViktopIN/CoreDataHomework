//
//  ProfileAddingView.swift
//  CoreDataHomework
//
//  Created by Виктор on 25/08/2022.
//

import UIKit
import SnapKit

class ProfileAddingView: UIViewController {
// MARK: - Properties
    private lazy var countOfCells = Int(12)
    private var cellHeight: CGFloat = 45
// MARK: - Views
    private lazy var addingProfileView: UIView = createAddingProfileView()
    private var namesTableView = UITableView()
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewConfiguration()
        
        setupHierarchy()
        setupView()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.subviews.forEach({ $0.removeFromSuperview() })
    }
    
// MARK: - Settings
    private func tableViewConfiguration() {
        namesTableView.translatesAutoresizingMaskIntoConstraints = false
        namesTableView.layer.cornerRadius = 8
        namesTableView.rowHeight = cellHeight
        
        namesTableView.register(CustomTableViewCell.self,
                                forCellReuseIdentifier: CustomTableViewCell().identificator)
        
        namesTableView.dataSource = self
        namesTableView.delegate = self
    }
    private func setupHierarchy() {
        view.addSubview(addingProfileView)
        view.addSubview(namesTableView)
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
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(120)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        namesTableView.snp.makeConstraints { make in
            make.top.equalTo(addingProfileView.snp.bottom).offset(32)
            make.width.equalToSuperview().multipliedBy(0.91)
            make.height.equalTo(getHeight())
            make.centerX.equalToSuperview()
        }
    }
}

// MARK: - Extensions -

extension ProfileAddingView: UITableViewDataSource {
// TODO: - finish correct table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countOfCells = 12
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.namesTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "nanana"
        
        return cell
    }
    
    private func getHeight() -> CGFloat {
        if countOfCells < 11 {
            let height = CGFloat(countOfCells) * cellHeight
            return height
        } else {
            return CGFloat(495)
        }
    }
}

extension ProfileAddingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editSceneView = EditSceneView()
        navigationController?.pushViewController(editSceneView, animated: true)
    }
}

