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
        view.alpha = 0
        appDelegate?.window??.addSubview(view)
        UIView.animate(withDuration: showAnimationDuration, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.alpha = 1
        }, completion: nil)
    }
    
    public func hideLoader() {
        view.removeFromSuperview()
    }
    
    public func setupBasicLoader(images: [UIImage], copy: String) {
        viewLoader?.setupBasicLoader(images: images, copy: copy)
    }
    
    public func setupImages(images: [UIImage]) {
        viewLoader?.setupImages(images: images)
    }
    
    public func setupLoadingCopy(copy: String) {
        viewLoader?.setupLoadingCopy(copy: copy)
    }
    
    public func setupLoaderImageSize(width: CGFloat, height: CGFloat) {
        viewLoader?.setupLoaderImageSize(width: width, height: height)
    }
    
    public func setupLoaderBackgroundColor(color: UIColor) {
        viewLoader?.setupLoaderBackgroundColor(color: color)
    }
    
    public func setupCopyColor(color: UIColor) {
        viewLoader?.setupCopyColor(color: color)
    }
    
    public func setupCopyFont(font: UIFont) {
        viewLoader?.setupCopyFont(font: font)
    }
    
    public func setupTimeInterval(timeInterval: Double) {
        viewLoader?.setupTimeInterval(timeInterval: timeInterval)
    }

}
