//
//  BLCreateLibraryViewController.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/30/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import UIKit

class BLCreateLibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryName: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createLibrary(sender: UIButton) {
        guard self.validateLibraryName() else {
            return
        }
        
        guard BLLibraryManager.sharedInstance.libraryForName(self.libraryName.text!) == nil else {
            self.showAlertView("该图书馆已存在")
            return
        }
        
        let library = BLLibrary()
        library.name = libraryName.text!
        library.admins = Array(arrayLiteral: BLUser.currentUser()!)
        library.saveInBackgroundWithBlock { (successed, error) -> Void in
            guard successed else {
                print(error)
                return
            }
            
            BLLibraryManager.sharedInstance.updateExistingLibraries()
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.loadMainLibraryTabVC(library)
        }
    }
    
    private func validateLibraryName() -> Bool {
        guard self.libraryName.text != nil else {
            self.showAlertView("馆名不能为空")
            return false
        }
        return true
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
