//
//  TeacherDashboard_TVC.swift
//  flux
//
//  Created by Diaz, Christopher on 10/21/15.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

class TeacherDashboard_TVC: UITableViewController,UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet var teacherTableView: UITableView!
    @IBOutlet var navigationBackButton: UINavigationItem!
    
    
    var teacher: Teacher?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }

  

}
