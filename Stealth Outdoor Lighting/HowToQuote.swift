//
//  HowToQuote.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/14/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class HowToQuote: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        setViewControllers([getOptionOne()], direction: .Forward, animated: true, completion: nil)

    }
    
    func getOptionOne() -> OptionOneViewController {
        return storyboard?.instantiateViewControllerWithIdentifier("optionOne") as! OptionOneViewController
    }
    
    func getOptionTwo() -> OptionTwoViewController {
        return storyboard?.instantiateViewControllerWithIdentifier("optionTwo") as! OptionTwoViewController
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 2
    }

}

extension HowToQuote : UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if viewController.restorationIdentifier == "optionOne" {
            return getOptionTwo()
        }else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if viewController.restorationIdentifier == "optionTwo" {
            return getOptionOne()
        }else {
            return nil
        }
    }
    
}