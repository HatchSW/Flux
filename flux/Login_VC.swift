//
//  Login_VC.swift
//  flux
//
//  Created by Nathan Bruno on 10/11/15.
//  Copyright © 2015 Hatch. All rights reserved.
//

import UIKit

class Login_VC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var authenticatedUser: NSObject?
    
    
    // MARK: - View Setup
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: load last logged user from NSUserDefaults
        
        //Mask the profile image into a circle with a white boarder
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 3.0
        profileImage.layer.borderColor = UIColor.whiteColor().CGColor

    }

    // MARK: - IBActions
    @IBAction func loginPressed(sender: UIButton) {
        
        let user = Authenticator.authenticate(username.text!, password: password.text!)
        if user.isKindOfClass(Student) {
            //launch Studnet Dashboard
            //TODO: save username to NSUserDefaults
            authenticatedUser = user
            performSegueWithIdentifier("Show Student Dashboard", sender: self)
            
        }else if user.isKindOfClass(Teacher){
            //TODO: save username to NSUserDefaults
            //launch Teacher Dashboard
            authenticatedUser = user
            performSegueWithIdentifier("Show Teacher Dashboard", sender: self)
            
        }else{
            //TODO:prompt user with login failure
            
        }
    }

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "Show Student Dashboard"{
            
            let dashboardVC = segue.destinationViewController as! StudentDashboard_VC
            dashboardVC.student = authenticatedUser as? Student
            
        }else if segue.identifier == "Show Teacher Dashboard"{
            
            let dashboardVC = segue.destinationViewController as! TeacherDashboard_VC
            dashboardVC.teacher = authenticatedUser as? Teacher
            
        }
    }


}
