//
//  RepairViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/7/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit



class RepairViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var lampsBtn: UIButton!
    @IBOutlet weak var wireBtn: UIButton!
    @IBOutlet weak var timerBtn: UIButton!
    @IBOutlet weak var otherBtn: UIButton!
    
    private let messageComposer = MessageComposer()
    private var addressTF: UITextField!
    private let defaults = NSUserDefaults.standardUserDefaults()
    private let key = "StealthAddress"
    
    var address: String?
    
    private struct repair {
        static let lamps = "Replace lamps at: "
        static let wire = "Cut wire at: "
        static let timer = "Timer reset at: "
        static let other = "Enter Message Here: "
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        lampsBtn.layer.borderWidth = 1.0
        lampsBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
        wireBtn.layer.borderWidth = 1.0
        wireBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
        timerBtn.layer.borderWidth = 1.0
        timerBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
        otherBtn.layer.borderWidth = 1.0
        otherBtn.layer.borderColor = UIColor.whiteColor().CGColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !storedAddress() {
            requestAddress()
        }

    }
    
    private func storedAddress() -> Bool {
        if let defaultAddress = defaults.stringForKey(key) {
            address = defaultAddress
            print("True: \(address!)")
            return true
        }else {
            print("False: \(address)")
            return false
        }
    }
    
    private func requestAddress() {
        
        let alert = UIAlertController(title: "Please Enter Your Address", message: "Address will be saved on local device in order to quickly request service and repairs.", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler{ (addressTF) in
            addressTF.placeholder = "address"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (UIAlertAction) in
            self.address = ""
        }
        let okAction = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default) { (UIAlertAction) in
            let textField = alert.textFields![0] as UITextField
            self.address = textField.text
            print("\(self.address)")
            
            if self.address != nil {
                self.defaults.setValue("\(self.address!)", forKey: self.key)
                self.defaults.synchronize()
            }
            
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    private func requestRepair(text: String) {
        
        if messageComposer.canSendText() {
            
            let messageComposeVC = messageComposer.sendMessage(text, attachment: nil)
            presentViewController(messageComposeVC, animated: true, completion: nil)
            
        }else {
            print("There was a problem sending the text.")
        }
    }
    
    @IBAction func homeBtn(sender: UIBarButtonItem) {
        
        if let homeVC = storyboard!.instantiateViewControllerWithIdentifier("homeVC") as? HomeViewController {
            presentViewController(homeVC, animated: true, completion: nil)
        }
    }
        
    @IBAction func lampsAction(sender: UIButton) {
        requestRepair(repair.lamps + "\(self.address!)")
    }
    
    @IBAction func wireAction(sender: UIButton) {
        requestRepair(repair.wire + "\(self.address!)")
    }
    
    @IBAction func timerAction(sender: UIButton) {
        requestRepair(repair.timer + "\(self.address!)")
    }

    @IBAction func otherAction(sender: UIButton) {
        requestRepair("\(self.address!)" + repair.other)
    }
    

}
