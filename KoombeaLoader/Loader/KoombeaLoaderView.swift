//
//  KoombeaLoaderView.swift
//  KoombeaLoader
//
//  Created by Nelson Bolívar on 1/3/17.
//  Copyright © 2017 Nelson Bolívar. All rights reserved.
//

import UIKit

class KoombeaLoaderView: UIView, CAAnimationDelegate {
    
    @IBOutlet weak var loaderImageView: UIImageView?
    @IBOutlet weak var loaderLabel: UILabel?
    @IBOutlet weak var loaderImageViewWidthConstraint: NSLayoutConstraint?
    @IBOutlet weak var loaderImageViewHeightConstraint: NSLayoutConstraint?
    @IBOutlet weak var loaderRotateImageView: UIImageView!
    ///Loader Animation Time Interval. Default value: 1.0
    var timeInterval = 1.0
    var rotating = false
    var animation = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func hideLoader() {
        removeFromSuperview()
    }
    
    func setupBasicLoaderRotation(image: UIImage) {
        loaderRotateImageView?.image = image
    }
    
    func rotate() {
        if animation {
            loaderRotateImageView?.rotate360Degrees(duration: 1, completionDelegate: self)
        }
    }
    
    func setupBasicLoader(images: [UIImage], copy: String) {
        setupImages(images: images)
        setupLoadingCopy(copy: copy)
    }
    
    func setupImages(images: [UIImage]) {
        if images.count > 1 {
            loaderImageView?.animationImages = images
            loaderImageView?.animationDuration = timeInterval
            loaderImageView?.startAnimating()
        } else if images.count == 1 {
            loaderImageView?.image = images.first
        } else {
            return
        }
    }
    
    func setupLoadingCopy(copy: String) {
        loaderLabel?.text = copy
    }
    
    func setupLoaderImageSize(width: CGFloat, height: CGFloat) {
        loaderImageViewWidthConstraint?.constant = width
        loaderImageViewHeightConstraint?.constant = height
    }
    
    func setupLoaderBackgroundColor(color: UIColor) {
        backgroundColor = color
    }
    
    func setupCopyColor(color: UIColor) {
        loaderLabel?.textColor = color
    }
    
    func setupCopyFont(font: UIFont) {
        loaderLabel?.font = font
    }
    
    func setupTimeInterval(timeInterval: Double) {
        self.timeInterval = timeInterval
    }
    
    // MARK: CAAnimationDelegate
    
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        rotate()
    }
    
}
