//
//  AboutUsViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/8/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func homeBtn(sender: UIBarButtonItem) {
        
        if let homeVC = storyboard!.instantiateViewControllerWithIdentifier("homeVC") as? HomeViewController {
            presentViewController(homeVC, animated: true, completion: nil)
        }
        
    }

}
