//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var photoViewController = toViewController as! PhotoViewController

        photoViewController.photoView.frame = initialSize
            photoViewController.photoView.frame.origin.y += 110
        UIView.animateWithDuration(duration, animations: {
            photoViewController.photoView.frame = CGRect(x: 0, y: 0, width: 320, height: 568)

        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var photoViewController = fromViewController as! PhotoViewController
       
        photoViewController.photoView.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
        
        UIView.animateWithDuration(duration, animations: {
            photoViewController.photoView.frame = initialSize
            photoViewController.photoView.frame.origin.y += 110
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}
