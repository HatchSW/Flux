//
//  StudentDashboard_VC.swift
//  flux
//
//  Created by Nathan Bruno on 10/11/15.
//  Copyright © 2015 Hatch. All rights reserved.
//

import UIKit

class StudentDashboard_VC: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    var tempCourses = ["Period 1", "Period 2", "Period 3", "Period 4", "Period 5", "Period 6"]
    
    var student: Student?
    
    @IBOutlet weak var coursePicker: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempConfirmChoiceLabel: UILabel!
    @IBOutlet weak var timeUntilLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coursePicker.dataSource = self
        coursePicker.delegate = self
        
        determineTimeTillSas()
        
        //display student information
//        nameLabel.text = "\(student!.firstName) \(student!.lastName)"
        
        
    }
    
    //Mark: IBActions
    @IBAction func CheckInButtonPressed(sender: AnyObject) {
        
        //ToDo: Check student into selected class
    }
   
    @IBAction func logOutPressed(sender: AnyObject) {
        
        //remove username and password from NSUserDefaults
        NSUserDefaults.standardUserDefaults().removeObjectForKey("flux.username")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("flux.password")
        NSUserDefaults.standardUserDefaults().synchronize()
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    func determineTimeTillSas() {
        //SAS starts 9:40 am
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Hour, .Minute, .Second], fromDate: date)
//        let hour = components.hour;
        let minute = components.minute;
//        let second = components.second;
        
        if minute <= 40{
            let untilMinute = 40 - minute
            
            if untilMinute <= 5 {
                timeUntilLabel.textColor = UIColor.redColor()
            }else{
                timeUntilLabel.textColor = UIColor.greenColor()
            }
            
            timeUntilLabel.text = String(untilMinute) + "minutes"

        }else{
            timeUntilLabel.text = "Passed"
        }
        
        
        
    }
    
    
    
    
    
    
    
//    http://makeapppie.com/tag/uipickerview-in-swift/
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    //determines the number of rows in the picker
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tempCourses.count
    }
    
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tempCourses[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tempConfirmChoiceLabel.text = tempCourses[row]
    }

    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var pickerLabel = view as! UILabel!
        if view == nil {  //if no label there yet
            pickerLabel = UILabel()
            //color the label's background
            //Hues are spaced between 0 and 1, each will give you a different background color
            let hue = CGFloat(row)/CGFloat(tempCourses.count)
            pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        }
        let titleData = tempCourses[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel!.attributedText = myTitle
        pickerLabel!.textAlignment = .Center
        return pickerLabel
        
    }
    
    }
