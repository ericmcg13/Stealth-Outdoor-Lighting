//
//  ProductGalleryViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/6/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class ProductGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageArray = [imageName("pic1"), imageName("pic2"), imageName("pic3"), imageName("pic4"), imageName("pic5"), imageName("pic6"), imageName("pic7"), imageName("pic8"), imageName("pic9"), imageName("pic10"), imageName("pic11"), imageName("pic12"), imageName("pic13"), imageName("pic14"), imageName("pic15"), imageName("pic16"), imageName("pic17"), imageName("pic18"), imageName("pic19"), imageName("pic20"), imageName("pic21"), imageName("pic22"), imageName("pic23"), imageName("pic24")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.cellImageView.image = self.imageArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showImage" {
            
            let indexPaths = self.collectionView.indexPathsForSelectedItems()
            let indexPath = indexPaths![0] as NSIndexPath
            let vc = segue.destinationViewController as! ImageViewController
            
            vc.image = self.imageArray[indexPath.row]!
            
        }
    }
    
    @IBAction func homeBtn(sender: UIBarButtonItem) {
        
        if let homeVC = storyboard!.instantiateViewControllerWithIdentifier("homeVC") as? HomeViewController {
            presentViewController(homeVC, animated: true, completion: nil)
        }
    }
}

func imageName(name: String) -> UIImage? {
    let image = UIImage(named: name)
    return image
}
