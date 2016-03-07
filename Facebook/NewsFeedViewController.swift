//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

var initialSize: CGRect!
var initialY: CGFloat! = 110

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var imageView: UIImageView!
    var customTransition = PhotoTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer) {
        print("tapped \(sender.view)")
        imageView = sender.view as! UIImageView
        performSegueWithIdentifier("manualSegue", sender: self)
    }
    
 
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as! PhotoViewController

        destinationViewController.image = self.imageView.image
        
        initialSize = self.imageView.frame
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = customTransition
        customTransition.duration = 0.3
        
    }
    
}
