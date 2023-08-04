//
//  EmployeeViewController.swift
//  DemoOnMVCAndMVVM
//
//  Created by Kumaran on 08/07/23.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    @IBOutlet weak var employeeListTableView: UITableView!
    
    //MARK:- View Model Instance / Object
    var employeeViewModel: EmployeeViewModel = EmployeeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        addBarButtonItem()
    }
    
}

extension EmployeeViewController {
    
    func configureTableView() {
        employeeListTableView.dataSource = self
        employeeListTableView.delegate = self
        employeeListTableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeTableViewCell")
    }
    
    func addBarButtonItem() {
        self.title = "Employees List"
        let barButtonImage = UIImage(systemName: "plus")
        let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: self, action: #selector(addNewEmployee(_:)))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func addNewEmployee(_ sender: UIBarButtonItem) {
        //Grabing the data from view model
        employeeViewModel.addNewEmployee(name: "Employee \(employeeViewModel.employeeListArray.count + 1)", address: "Address \(employeeViewModel.employeeListArray.count + 1)")
        //Assinging the data to UI. i.e to View.
        employeeListTableView.reloadData()
    }
}

extension EmployeeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeViewModel.employeeListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as? EmployeeTableViewCell {
            cell.textLabel?.text = employeeViewModel.employeeListArray[indexPath.row].name
            cell.detailTextLabel?.text = employeeViewModel.employeeListArray[indexPath.row].address
            return cell
        }
        return UITableViewCell()
    }
    
}

extension EmployeeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Employee: " , employeeViewModel.employeeListArray[indexPath.row].name ?? "")
    }
}
