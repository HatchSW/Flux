//
//  Student.swift
//  flux
//
//  Created by Nathan Bruno on 10/11/15.
//  Copyright © 2015 Hatch. All rights reserved.
//

import UIKit

class Student: NSObject {

    let firstName: String
    let lastName: String
    let studentID: String
    
    init(first: String, last: String, studentID: String) {
        self.firstName = first
        self.lastName = last
        self.studentID = studentID
    }
}
