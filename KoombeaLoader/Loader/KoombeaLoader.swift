//
//  KoombeaLoaderViewController.swift
//  KoombeaLoader
//
//  Created by Nelson Bolívar on 1/2/17.
//  Copyright © 2017 Nelson Bolívar. All rights reserved.
//

import UIKit

public class KoombeaLoader {
    
    open static let shareInstance: KoombeaLoader = KoombeaLoader()
    private let appDelegate = UIApplication.shared.delegate
    private var view: UIView = UIView(frame: CGRect.zero)
    private var viewLoader: KoombeaLoaderView?
    
    public var showAnimationDuration = 0.3
    
    init() {
        self.load()
    }
    
    private func load() {
        let bundle = Bundle(for: KoombeaLoaderView.self)
        guard let viewLoader  = UINib(nibName: "KoombeaLoaderView", bundle: bundle).instantiate(withOwner: nil, options: nil).first as? KoombeaLoaderView else { return }
        view.frame = (appDelegate?.window??.bounds)!
        viewLoader.frame = (appDelegate?.window??.bounds)!
        self.viewLoader = viewLoader
        view.addSubview(viewLoader)
    }
    
    public func showLoader() {
        if viewLoader!.rotating {
            viewLoader?.animation = true
            viewLoader?.rotate()
        }
        view.alpha = 0
        appDelegate?.window??.addSubview(view)
        UIView.animate(withDuration: showAnimationDuration, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.alpha = 1
        }, completion: nil)
        
    }
    
    public func hideLoader() {
        view.removeFromSuperview()
        if viewLoader!.rotating {
            viewLoader?.animation = false
        }
    }
    
    ///Add your custom images sequence and copy text
    public func setupBasicLoader(images: [UIImage], copy: String) {
        viewLoader?.setupBasicLoader(images: images, copy: copy)
    }
    
    ///Add your custom image to rotate
    public func setupBasicLoaderRotation(image: UIImage) {
        viewLoader?.setupBasicLoaderRotation(image: image)
        viewLoader?.rotating = true
    }
    
    ///Add your custom images sequence
    public func setupImages(images: [UIImage]) {
        viewLoader?.setupImages(images: images)
    }
    
    ///Add you custom copy text
    public func setupLoadingCopy(copy: String) {
        viewLoader?.setupLoadingCopy(copy: copy)
    }
    
    ///Setup imageView size
    public func setupLoaderImageSize(width: CGFloat, height: CGFloat) {
        viewLoader?.setupLoaderImageSize(width: width, height: height)
    }
    
    ///Setup LoaderView background color
    public func setupLoaderBackgroundColor(color: UIColor) {
        viewLoader?.setupLoaderBackgroundColor(color: color)
    }
    
    ///Setup copy text color
    public func setupCopyColor(color: UIColor) {
        viewLoader?.setupCopyColor(color: color)
    }
    
    ///Setup copy text font and size
    public func setupCopyFont(font: UIFont) {
        viewLoader?.setupCopyFont(font: font)
    }
    
    ///Setup animation time interval
    public func setupTimeInterval(timeInterval: Double) {
        viewLoader?.setupTimeInterval(timeInterval: timeInterval)
    }
    
}
