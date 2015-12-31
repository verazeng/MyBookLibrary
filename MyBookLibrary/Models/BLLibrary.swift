//
//  BLLibrary.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/22/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import Foundation

class BLLibrary: AVObject, AVSubclassing {

    @NSManaged var name : String
    @NSManaged var books : NSArray?
    @NSManaged var users : NSArray?
    @NSManaged var admins : NSArray
    
    class func parseClassName() -> String? {
        return "BLLibrary"
    }
}
