//
//  OptionTwoViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/14/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class OptionTwoViewController: UIViewController {
    
    let messageComposer = MessageComposer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func textBtn(sender: UIButton) {
        if messageComposer.canSendText() {
            
            let messageComposeVC = messageComposer.sendMessage("", attachment: nil)
            presentViewController(messageComposeVC, animated: true, completion: nil)
            
        }else {
            print("There was a problem sending the text.")
        }
    }

    
    @IBAction func phoneBtn(sender: UIButton) {
        messageComposer.makePhoneCall("2487658633")
    }
    


}
