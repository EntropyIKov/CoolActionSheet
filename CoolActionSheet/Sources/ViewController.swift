//
//  ViewController.swift
//  CoolActionSheet
//
//  Created by Kovalenko Ilia on 23/10/2018.
//  Copyright © 2018 Kovalenko Ilia. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak private var imageView: UIImageView!
    
    //MARK: - Property
    var imageSheetViewController: ImageSheetViewController!
    
    //MARK: - Action
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @objc func tapHandler() {
        imageSheetViewController.showActionSheet()
    }
    
    //MARK: - Method
    private func setupView() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gestureRecognizer)
        
        configureImageSheetViewController()
    }
    
    func configureImageSheetViewController() {
        imageSheetViewController = ImageSheetViewController()
        
        var actions: [UIAlertAction] = []
        actions.append(UIAlertAction(title: "First", style: .default) { _ in print("first") })
        actions.append(UIAlertAction(title: "Second", style: .default) { _ in print("second") })
        actions.append(UIAlertAction(title: "Third", style: .default) { _ in print("third") })
        
        imageSheetViewController.set(actions: actions)
        imageSheetViewController.getImageHandler = { [weak self] image in
            self?.imageView.image = image
        }
        imageSheetViewController.targetSize = imageView.frame.size
        
        addChild(imageSheetViewController)
    }
    
    

}
