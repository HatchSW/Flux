//
//  Authenticator.swift
//  flux
//
//  Created by Nathan Bruno on 10/11/15.
//  Copyright © 2015 Hatch. All rights reserved.
//

import UIKit

class Authenticator: NSObject {

    //if authentication fails, method returns nil
    //if authentication succeds, method returns the user object
    class func authenticate(username: String, password: String) -> NSObject {
        
        //this is just a stub until we get all the cloudkit stuff figured out
        return Student(first: "Zane", last: "Godfrey", studentID: "099999");
    }
}
