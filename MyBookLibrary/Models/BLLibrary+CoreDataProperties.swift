//
//  BLLibrary+CoreDataProperties.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/22/15.
//  Copyright © 2015 verazeng. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension BLLibrary {

    @NSManaged var identifier: String?
    @NSManaged var name: String?
    @NSManaged var books: NSSet?
    @NSManaged var users: NSSet?

}
