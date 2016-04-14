//
//  AboutUsViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/14/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    let messageComposer = MessageComposer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func homeBtn(sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let homeVC = storyboard.instantiateViewControllerWithIdentifier("homeVC") as? HomeViewController {
            presentViewController(homeVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func phone(sender: UIButton) {
        
        messageComposer.makePhoneCall("2487658633")
        
    }
    
    @IBAction func message(sender: UIButton) {
        
        let text = ""
        
        if messageComposer.canSendText() {
            
            let messageComposeVC = messageComposer.sendMessage(text, attachment: nil)
            presentViewController(messageComposeVC, animated: true, completion: nil)
            
        }else {
            print("There was a problem sending the text.")
        }
        
    }
    

    
}
