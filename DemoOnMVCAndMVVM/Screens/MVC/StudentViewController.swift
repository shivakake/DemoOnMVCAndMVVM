//
//  StudentViewController.swift
//  DemoOnMVCAndMVVM
//
//  Created by Kumaran on 08/07/23.
//

import UIKit

class StudentViewController: UIViewController {
    
    @IBOutlet weak var studentsListTableView: UITableView!
    
    var studentListArray: [Student] = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addNewStudent(_ sender: UIBarButtonItem) {
        //  MARK:- Data Grabing from Data Model
        //  Controller asking data from Model
        let student = Student(aName: "Student \(studentListArray.count + 1)", aAddress: "Address \(studentListArray.count + 1)")
        studentListArray.append(student)
        //  Controller is assigning data to UI (Intraction Between Controller and View)
        studentsListTableView.reloadData()
    }
    
    @IBAction func nextButtopnTapped(_ sender: UIBarButtonItem) {
        
        if let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmployeeViewController") as? EmployeeViewController {
            navigationController?.pushViewController(controller, animated: true)
        }
        //        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EmployeeViewController") as? EmployeeViewController else { return }
        //        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension StudentViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = studentListArray[indexPath.row].name
        cell.detailTextLabel?.text = studentListArray[indexPath.row].address
        return cell
    }
    
}

extension StudentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Student: ", studentListArray[indexPath.row].name ?? "")
    }
}
