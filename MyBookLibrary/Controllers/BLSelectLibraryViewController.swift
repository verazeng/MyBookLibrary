//
//  BLSelectLibraryViewController.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/22/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import UIKit

class BLSelectLibraryViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var libraryName: UITextField!
    @IBOutlet weak var libraryNamePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.libraryNamePicker.dataSource = self
        self.libraryNamePicker.delegate = self
        self.libraryNamePicker.hidden = true
    }
    
    @IBAction func selectExistedLibrary(sender: UIButton) {
        guard self.existingLibraries() != nil && self.existingLibraries()!.count > 0 else {
            self.showAlertView("没有可用图书馆，请创建新的图书馆！")
            return
        }
        
        self.libraryNamePicker.hidden = false
        self.libraryNamePicker.reloadAllComponents()
    }
    
    @IBAction func enterExistLibrary(sender: UIButton) {
        guard self.validateLibraryName() else {
            return
        }
        
        guard let library = BLLibraryManager.sharedInstance.libraryForName(self.libraryName.text!) else {
            return
        }
        
        print(library)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.loadMainLibraryTabVC(library)
    }
    
    @IBAction func createNewLibrary(sender: UIButton) {
        let isLogedIn = BLUser.currentUser() != nil
        
        let createVC = self.storyboard?.instantiateViewControllerWithIdentifier("CreateLibraryVC") as! BLCreateLibraryViewController
        self.navigationController?.pushViewController(createVC, animated: isLogedIn)
        
        if !isLogedIn {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            self.showViewController(appDelegate.loginVC(), sender: nil)
        }
    }

    private func validateLibraryName() -> Bool {
        guard self.libraryName.text != nil else {
            self.showAlertView("馆名不能为空")
            return false
        }
        return true
    }
    
    private func existingLibraries() -> [BLLibrary]? {
        return BLLibraryManager.sharedInstance.exsitingLibaries
    }
    
    //MARK: - UIPickerViewDataSource and Delegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let _ = self.existingLibraries() {
            return self.existingLibraries()!.count
        } else {
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (self.existingLibraries()![row] as BLLibrary).name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.libraryName.text = (self.existingLibraries()![row] as BLLibrary).name
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
