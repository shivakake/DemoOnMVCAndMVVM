//
//  EmployeeViewModel.swift
//  DemoOnMVCAndMVVM
//
//  Created by Kumaran on 08/07/23.
//

import Foundation

class EmployeeViewModel {
    
    //MARK:- Model
    // Here we manipulate the entair data manipulation in this swift file i.e view model file.
    var employeeListArray: [Employee] = [Employee]()
    
    func addNewEmployee(name: String?, address: String?) {
        // Accessing the data model from model
        let employee = Employee(aName: name, aAddress: address)
        employeeListArray.append(employee)
    }
}
 
