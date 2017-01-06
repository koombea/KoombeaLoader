//
//  KoombeaLoaderTests.swift
//  KoombeaLoaderTests
//
//  Created by Nelson Bolívar on 1/2/17.
//  Copyright © 2017 Nelson Bolívar. All rights reserved.
//

import XCTest
@testable import KoombeaLoader

class KoombeaLoaderTests: XCTestCase {
    
    var loaderView: KoombeaLoaderView!
    var dummyImage: UIImage!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loaderView =  UINib(nibName: "KoombeaLoaderView", bundle: Bundle(for: KoombeaLoaderView.self)).instantiate(withOwner: nil, options: nil).first as! KoombeaLoaderView
        
        let resourceBundle = Bundle(for: KoombeaLoaderTests.self)
        let imagePath = resourceBundle.path(forResource: "charmander", ofType: ".png")!
        dummyImage = UIImage(named: imagePath)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddImages_whenImagesArrayIsMoreThanOne_shouldImageEqualToNilAndAnimationImagesNotNil() {
        let images: [UIImage] = [dummyImage, dummyImage]
        
        loaderView.setupImages(images: images)
        
        XCTAssert(loaderView.loaderImageView!.animationImages!.count > 1)
        XCTAssert(loaderView.loaderImageView?.animationImages != nil)
        XCTAssert(loaderView.loaderImageView?.image == nil)
    }
    
    func testAddImages_whenImagesArrayIsEqualToOne_shouldImageNotEqualToNilAndAnimationImagesEqualToNil() {
        let images: [UIImage] = [dummyImage]
        
        loaderView.setupImages(images: images)
        
        XCTAssert(loaderView.loaderImageView?.animationImages == nil)
        XCTAssert(loaderView.loaderImageView?.image != nil)
    }
    
    func testAddImages_whenImagesArrayIsEmpty_shouldImageEqualToNilAndAnimationImagesEqualToNil() {
        let images: [UIImage] = []
        
        loaderView.setupImages(images: images)
        
        XCTAssert(loaderView.loaderImageView?.animationImages == nil)
        XCTAssert(loaderView.loaderImageView?.image == nil)
    }
    
}
