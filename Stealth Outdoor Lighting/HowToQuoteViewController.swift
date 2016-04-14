//
//  HowToQuoteViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/12/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class HowToQuoteViewController: UIViewController {
    
    @IBOutlet weak var phoneNumber: UIButton!
    
    let messageComposer = MessageComposer()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        phoneNumber.layer.borderWidth = 1.0
        phoneNumber.layer.borderColor = UIColor.whiteColor().CGColor
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func phoneNumberAction(sender: UIButton) {
        messageComposer.makePhoneCall("2487658633")
    }


}
