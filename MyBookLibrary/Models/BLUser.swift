//
//  BLUser.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/22/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import Foundation
import CoreData

@objc enum AuthorityType : Int {
    case eAuthorityAdmin    = 0
    case eAuthorityCommon   = 1
}

class BLUser: NSManagedObject {
    @NSManaged var authorityType : AuthorityType
// Insert code here to add functionality to your managed object subclass
    
}
