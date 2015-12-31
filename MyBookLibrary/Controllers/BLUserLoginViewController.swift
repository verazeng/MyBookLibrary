//
//  BLUserLoginViewController.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/30/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import UIKit

class BLUserLoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(sender: UIButton) {
        BLUser.logInWithUsernameInBackground(userName.text, password: password.text) { (user, error) -> Void in
            guard error == nil else {
                print(error)
                self.showAlertView(error.userInfo["error"] as! String)
                return
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
