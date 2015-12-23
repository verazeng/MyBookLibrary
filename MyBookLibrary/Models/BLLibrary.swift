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
    @NSManaged var books : AVRelation
    @NSManaged var users : AVRelation
    
    class func parseClassName() -> String? {
        return "BLLibrary"
    }
}
