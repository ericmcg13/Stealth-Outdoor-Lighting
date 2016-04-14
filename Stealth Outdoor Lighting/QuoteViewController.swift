//
//  QuoteViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/7/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var takePhotoBtn: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var imagePlaceHolder: UIImageView!
    
    let imagePicker = UIImagePickerController()
    let messageComposer = MessageComposer()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        // Style the Take Photo button
        self.takePhotoBtn.layer.borderWidth = 1.0
        self.takePhotoBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
        // Style the Send button
        self.sendBtn.layer.borderWidth = 1.0
        self.sendBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.imagePlaceHolder.alpha = 0.3
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }

    @IBAction func infoBtn(sender: UIButton) {
        
        if let howToVC = storyboard!.instantiateViewControllerWithIdentifier("howtoquote") as? HowToQuote {
            presentViewController(howToVC, animated: true, completion: nil)
        }
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = .ScaleToFill
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func homeBtn(sender: UIBarButtonItem) {
        
        if let homeVC = storyboard!.instantiateViewControllerWithIdentifier("homeVC") as? HomeViewController {
            presentViewController(homeVC, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func takePhotoAction(sender: UIButton) {
        camera()
    }
    
    @IBAction func sendAction(sender: UIButton) {
        if imageView.image == nil {
            let alert = UIAlertController(title: "No Image", message: "You need to submit a photo before you can send your quote request.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }else {
            sendQuote()
        }
    }
    
    func camera() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            imagePicker.sourceType = .Camera
            imagePicker.cameraCaptureMode = .Photo
            imagePicker.allowsEditing = false
            
            presentViewController(imagePicker, animated: true, completion: nil)
            
        }else {
            let alert = UIAlertController(title: "Uh-oh", message: "The camera does not seem to be available at the moment.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func sendQuote() {
        
        if messageComposer.canSendText() {
            
            let photoData = UIImageJPEGRepresentation(imageView.image!, 1.0)
            let messageVC = messageComposer.sendMessage("New quote.", attachment: photoData)
            self.presentViewController(messageVC, animated: true, completion: nil)
            
        }else {
            print("Cannot send text.")
        }
    }

}
