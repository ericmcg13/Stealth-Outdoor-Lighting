//
//  AboutStealthViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/14/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class AboutStealthViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        setViewControllers([getStepOne()], direction: .Forward, animated: true, completion: nil)
    }
    
    func getStepOne() -> SliderViewController {
        return storyboard?.instantiateViewControllerWithIdentifier("michigan") as! SliderViewController
    }
    
    func getStepTwo() -> SliderViewController {
        return storyboard?.instantiateViewControllerWithIdentifier("home") as! SliderViewController
    }
    
    func getStepThree() -> SliderViewController {
        return storyboard?.instantiateViewControllerWithIdentifier("repairs") as! SliderViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
extension AboutStealthViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if viewController.restorationIdentifier == "michigan" {
            return getStepTwo()
            
        }else if viewController.restorationIdentifier == "home" {
            return getStepThree()
            
        }else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.restorationIdentifier == "home" {
            return getStepOne()
            
        }else if viewController.restorationIdentifier == "repairs" {
            return getStepTwo()
            
        }else {
            return nil
        }
        
    }
    
    
    
    
    
    
    
    
}