//
//  AboutLEDViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/14/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class AboutLEDViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        setViewControllers([getStepOne()], direction: .Forward, animated: true, completion: nil)
    }
    
    func getStepOne() -> SliderViewController {
        return storyboard?.instantiateViewControllerWithIdentifier("led") as! SliderViewController
    }
    
    func getStepTwo() -> SliderViewController {
        return storyboard?.instantiateViewControllerWithIdentifier("calendar") as! SliderViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 2
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
extension AboutLEDViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if viewController.restorationIdentifier == "led" {
            return getStepTwo()

        }else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if viewController.restorationIdentifier == "calendar" {
            return getStepOne()
            
        }else {
            return nil
        }
        
    }
    
    
    
}