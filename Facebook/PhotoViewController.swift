//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Vicki Tan on 3/4/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoView: UIImageView!
    var image: UIImage!
    
    @IBAction func dismissButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = image
        scrollView.contentSize = CGSize(width: 320, height: 569)
        
        scrollView.delegate = self
    
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return photoView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        let alpha = convertValue(abs(scrollView.contentOffset.y), r1Min: 0, r1Max: 180, r2Min: 1, r2Max: 0)
        
        scrollView.backgroundColor = UIColor(white: 0, alpha: alpha)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
        if abs(scrollView.contentOffset.y) > 50 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.

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
