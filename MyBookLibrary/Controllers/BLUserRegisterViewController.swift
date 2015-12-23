//
//  BLUserRegisterViewController.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/23/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import UIKit

@objc
class BLUserRegisterViewController: UIViewController {

    @IBOutlet weak var libraryID: UILabel!
    @IBOutlet weak var libraryName: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    var registerAsAdmin = false
    var library : BLLibrary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        libraryID.text = library.objectId
        libraryName.text = library.name
    }
    
    @IBAction func registerUser(sender: UIButton) {
        let user = BLUser()
        user.username = userName.text!
        user.password = password.text!
        user.email = email.text!
        user.mobilePhoneNumber = phoneNumber.text!
        user.libraryID = library.objectId
        user.signUpInBackgroundWithBlock { (successed: Bool, error: NSError!) -> Void in
            guard successed else {
                print(error)
                return
            }
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.loadMainLibraryTabVC(self.library)
        }
    }
}
