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
    @IBOutlet weak var compose: UIImageView!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        phoneNumber.layer.borderWidth = 1.0
        phoneNumber.layer.borderColor = UIColor.whiteColor().CGColor
        
        compose.alpha = 0.3
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func phoneNumberAction(sender: UIButton) {
        makePhoneCall("2487658633")
    }

    private func makePhoneCall(phoneNum: String) {
        if let phoneCallURL = NSURL(string: "tel://\(phoneNum)") {
            let application = UIApplication.sharedApplication()
            if application.canOpenURL(phoneCallURL) {
                application.openURL(phoneCallURL)
            }
        }
    }

}
