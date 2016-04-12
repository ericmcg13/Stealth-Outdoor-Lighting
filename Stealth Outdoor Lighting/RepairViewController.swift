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
    
    let messageComposer = MessageComposer()
    
    struct repair {
        static let lamps = "I need some lamps replaced."
        static let wire = "There seems to be a wire cut somewhere."
        static let timer = "The timer needs to be reset."
        static let other = "Please enter your message here:"
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestRepair(text: String) {
        
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
        requestRepair(repair.lamps)
    }
    
    @IBAction func wireAction(sender: UIButton) {
        requestRepair(repair.wire)
    }
    
    @IBAction func timerAction(sender: UIButton) {
        requestRepair(repair.timer)
    }

    @IBAction func otherAction(sender: UIButton) {
        requestRepair(repair.other)
    }
    

}
