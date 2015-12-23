//
//  BLUser.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/22/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import Foundation

class BLUser: AVUser {
    @NSManaged var libraryID : String
    
    override static func parseClassName() -> String! {
        return "_User"
    }
}
