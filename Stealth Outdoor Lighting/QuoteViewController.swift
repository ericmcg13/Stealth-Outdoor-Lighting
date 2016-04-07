//
//  QuoteViewController.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/7/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import UIKit
import MessageUI

class QuoteViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var takePhotoBtn: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    
    var imagePicker = UIImagePickerController()
    var messageController = MFMessageComposeViewController()
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        imagePicker.delegate = self
        messageController.delegate = self
        messageController.messageComposeDelegate = self
        
        
        // Style the Take Photo button
        self.takePhotoBtn.layer.borderWidth = 1.0
        self.takePhotoBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
        // Style the Send button
        self.sendBtn.layer.borderWidth = 1.0
        self.sendBtn.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = .ScaleAspectFit
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        
        switch (result) {
        case MessageComposeResultCancelled:
            self.dismissViewControllerAnimated(true, completion: nil)
            break
        case MessageComposeResultSent:
            break
        case MessageComposeResultFailed:
            break
        default:
            break
        }

            
        self.dismissViewControllerAnimated(true, completion: nil)

        
    }
    
    @IBAction func takePhotoAction(sender: UIButton) {
        
        camera()
    }
    
    @IBAction func sendAction(sender: UIButton) {
        
        sendQuote()
    }
    
    func camera() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            imagePicker.sourceType = .Camera
            imagePicker.cameraCaptureMode = .Photo
            imagePicker.allowsEditing = false
            
            label.alpha = 0.0
            
            presentViewController(imagePicker, animated: true, completion: nil)
            
        }else {
            let alert = UIAlertController(title: "Uh-oh", message: "The camera does not seem to be available at the moment.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func sendQuote() {
        
        if MFMessageComposeViewController.canSendText() {
            
            let photoData = UIImageJPEGRepresentation(imageView.image!, 1.0)
            
            messageController.body = "I would like a quote for lighting please."
            messageController.recipients = ["2487658633"]
            messageController.addAttachmentData(photoData!, typeIdentifier: "image/jpeg", filename: "PhotoQuote")
            
            presentViewController(messageController, animated: true, completion: nil)
            
        }else {
            print("No Luck")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
