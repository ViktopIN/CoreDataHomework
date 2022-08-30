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
    private var countOfCells: Int {
        persons.count
    }
    var bottomConstraint: Constraint!
    private var cellHeight: CGFloat = 45
    var container: NSPersistentContainer!
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
    
        let managedContext = container.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        fetchRequest.returnsObjectsAsFaults = false

        do {
            persons = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
        namesTableView.reloadData()
    }
    
// MARK: - Settings
    private func tableViewConfiguration() {
        namesTableView.translatesAutoresizingMaskIntoConstraints = false
        namesTableView.layer.cornerRadius = 8
        namesTableView.rowHeight = cellHeight
        
        namesTableView.register(UITableViewCell.self,
                                forCellReuseIdentifier: "Cell")
        
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
        
        guard container != nil else {
             fatalError("This view needs a persistent container.")
         }
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
            make.width.equalToSuperview().multipliedBy(0.91)
            make.centerX.equalToSuperview()
            make.top.equalTo(addingProfileView.snp.bottom).offset(35)
            self.bottomConstraint = make.height.equalTo(45).constraint
        }
    }

// MARK: - Methods
    private func getTableViewCellsConstraint() -> CGFloat {
        var heightTable = CGFloat()
        if countOfCells < 11 {
            heightTable = CGFloat(countOfCells) * cellHeight
        } else {
            heightTable = 495
        }
        return heightTable
    }
    
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
}

// MARK: - Extensions -

extension ProfileAddingView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bottomConstraint.update(offset: getTableViewCellsConstraint() - 45)
        
        return countOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = persons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension ProfileAddingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = persons[indexPath.row].objectID
        navigationController?.pushViewController(presenter.getEditView(name: name),
                                                 animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let deleteObject = persons.remove(at: indexPath.row)
            
            presenter.deleteRow(delete: deleteObject)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

// MARK: - Protocol Extension
extension ProfileAddingView: ProfileAddingViewProtocol {
    func reloadTableView(person: NSManagedObject) {
        persons.insert(person, at: persons.startIndex)
        namesTableView.reloadData()
    }
}
