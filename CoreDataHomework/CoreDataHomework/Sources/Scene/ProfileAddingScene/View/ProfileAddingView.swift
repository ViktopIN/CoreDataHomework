//
//  ProfileAddingView.swift
//  CoreDataHomework
//
//  Created by Виктор on 25/08/2022.
//

import UIKit
import SnapKit
import CoreData

protocol ProfileAddingViewProtocol {
    func reloadTableView(person: NSManagedObject)
}

class ProfileAddingView: UIViewController {
// MARK: - Properties
    private lazy var countOfCells = persons.count
    private var cellHeight: CGFloat = 45
    var persons: [NSManagedObject] = []
    var presenter: ProfileAddingPresenterProtocol!
    
// MARK: - Views
    private lazy var namesTableView = UITableView()
    private lazy var  addingProfileView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var textField: CustomTextField = {
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
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Press", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.backgroundColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 8
        
        button.addTarget(self, action: #selector(addNewName), for: .touchUpInside)
        
        return button
    }()
    
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
     
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")

        do {
          persons = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
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
        addingProfileView.addSubview(textField)
        addingProfileView.addSubview(button)
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
        textField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.91)
            make.height.equalTo(42)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.91)
            make.height.equalTo(42)
            make.top.equalTo(textField.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
        }
        
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

// MARK: - Methods
    @objc func addNewName() {
        if let newName = saveNewName() {
            presenter.addingNewName(name: newName)
        }
    }
    
    func saveNewName() -> String? {
        var name = String()
        if let text = textField.text {
            name = text
            textField.text = nil
            return name
        } else {
            return nil
        }
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

// MARK: - Extensions -

extension ProfileAddingView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = persons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell().identificator,
                                                 for: indexPath)
        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
        return cell
    }
}

extension ProfileAddingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editSceneView = EditSceneView()
        navigationController?.pushViewController(editSceneView, animated: true)
    }
}

// MARK: - Protocol Extension
extension ProfileAddingView: ProfileAddingViewProtocol {
    func reloadTableView(person: NSManagedObject) {
        self.persons.append(person)
        self.namesTableView.reloadData()
        print(persons)
    }
}
