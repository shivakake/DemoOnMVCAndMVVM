//
//  StudentModel.swift
//  DemoOnMVCAndMVVM
//
//  Created by Kumaran on 08/07/23.
//

import Foundation

//Model.
// This File contails only data.

class Student {
    var name: String?
    var address: String?
    
    init(aName: String?, aAddress: String?) {
        name = aName
        address = aAddress
    }
}
