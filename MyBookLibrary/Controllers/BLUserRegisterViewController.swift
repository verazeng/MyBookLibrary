//
//  BLUserRegisterViewController.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/23/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import UIKit

class BLUserRegisterViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerUser(sender: UIButton) {
        let user = BLUser()
        user.username = userName.text!
        user.password = password.text!
        user.email = email.text!
        user.mobilePhoneNumber = phoneNumber.text!
        user.signUpInBackgroundWithBlock { (successed: Bool, error: NSError!) -> Void in
            guard successed else {
                print(error)
                return
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
