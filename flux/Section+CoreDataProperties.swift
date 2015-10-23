//
//  Section+CoreDataProperties.swift
//  flux
//
//  Created by Student on 10/23/15.
//  Copyright © 2015 Hatch. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Section {

    @NSManaged var name: String?
    @NSManaged var period: NSNumber?
    @NSManaged var room: String?
    @NSManaged var students: NSSet?
    @NSManaged var teacher: Teacher?

}
