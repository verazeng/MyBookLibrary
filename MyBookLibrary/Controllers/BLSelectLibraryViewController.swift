//
//  BLSelectLibraryViewController.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/22/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import UIKit

class BLSelectLibraryViewController: UIViewController {

    @IBOutlet weak var libraryName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enterExistLibrary(sender: UIButton) {
        let query = BLLibrary.query()
        query.whereKey("name", equalTo: self.libraryName.text!)
        query.findObjectsInBackgroundWithBlock { (libraries, error) in
            guard libraries.count > 0 else {
                return
            }
            
            let library = libraries.first as! BLLibrary
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.loadMainLibraryTabVC(library)
        }
    }
    
    @IBAction func createNewLibrary(sender: UIButton) {
        let library = BLLibrary()
        library.name = libraryName.text!
        library.saveInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
            let storyBoard = UIStoryboard.init(name: "SelectLibrary", bundle: nil)
            let registerVC = storyBoard.instantiateViewControllerWithIdentifier("UserRegister") as! BLUserRegisterViewController
            registerVC.registerAsAdmin = true
            registerVC.library = library
            self.navigationController?.showViewController(registerVC, sender: sender)
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
