//
//  AboutUsViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/8/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var michigan: UIImageView!
    @IBOutlet weak var tools: UIImageView!
    @IBOutlet weak var lightbulb: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        michigan.alpha = 0.3
        tools.alpha = 0.3
        lightbulb.alpha = 0.3
    }
    
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
