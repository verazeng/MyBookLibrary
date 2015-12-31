//
//  BLLibraryManager.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/22/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import UIKit

class BLLibraryManager: NSObject {
    static let sharedInstance = BLLibraryManager()
    var exsitingLibaries : [BLLibrary]?
    
    private override init() {
        super.init()
        fetchAllLibraries()
    }
    
    private func fetchAllLibraries() {
        let query = BLLibrary.query()
        query.includeKey("books")
        query.includeKey("users")
        query.includeKey("admins")
        query.findObjectsInBackgroundWithBlock({ (libraries, error) -> Void in
            guard error == nil else {
                print(error)
                return
            }
            
            print(libraries)
            self.exsitingLibaries = libraries as? [BLLibrary]
        })
    }
    
    func updateExistingLibraries() {
        self.fetchAllLibraries()
    }
    
    func libraryForName(name: String) -> BLLibrary? {
        if let libraries = self.exsitingLibaries {
            return libraries.filter { (library) -> Bool in
                return library.name == name
                }.first
        } else {
            return nil
        }
    }
}
