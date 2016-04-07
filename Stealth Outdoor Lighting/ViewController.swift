//
//  ViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/6/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageArray = [imageName("pic1"), imageName("pic2"), imageName("pic3"), imageName("pic4"), imageName("pic5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

}

func imageName(name: String) -> UIImage? {
    let image = UIImage(named: name)
    return image
}
