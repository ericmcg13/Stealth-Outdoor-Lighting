//
//  OptionOneViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/14/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class OptionOneViewController: UIViewController {

    @IBOutlet weak var snapText: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        snapText.layer.borderWidth = 1.0
        snapText.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backBtn(sender: UIButton) {
        
        if let homeVC = storyboard!.instantiateViewControllerWithIdentifier("homeVC") as? HomeViewController {
            presentViewController(homeVC, animated: true, completion: nil)
        }
        
    }
}
