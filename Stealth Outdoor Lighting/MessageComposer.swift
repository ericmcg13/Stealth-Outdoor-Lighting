//
//  MessageComposer.swift
//  Stealth Outdoor Lighting
//
//  Created by Eric McGaughey on 4/10/16.
//  Copyright © 2016 Eric McGaughey. All rights reserved.
//

import Foundation
import MessageUI


class MessageComposer: NSObject, MFMessageComposeViewControllerDelegate {
    
    
    func canSendText() -> Bool {
        return MFMessageComposeViewController.canSendText()
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        
        switch (result) {
        case MessageComposeResultCancelled:
            print("Message canceled")
        case MessageComposeResultSent:
            print("Message sent")
        case MessageComposeResultFailed:
            print("Message failed")
        default:
            break
        }
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func sendMessage(text: String, attachment: NSData?) -> MFMessageComposeViewController{
        
        let messageVC = MFMessageComposeViewController()
        messageVC.messageComposeDelegate = self
        messageVC.recipients = ["2487658633"]
        messageVC.body = text
        
        if attachment != nil {
            messageVC.addAttachmentData(attachment!, typeIdentifier: "image/jpeg", filename: "SOL - Image")
        }
        
        return messageVC
    }
    
}
