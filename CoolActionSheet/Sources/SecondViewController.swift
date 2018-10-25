//
//  SecondViewController.swift
//  CoolActionSheet
//
//  Created by Kovalenko Ilia on 25/10/2018.
//  Copyright © 2018 Kovalenko Ilia. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    //MARK: - Property
    var imageSheetViewController: ImageSheetViewController!
    
    //MARK: - Action
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        configureImageSheetViewController()
    }
    
    @objc func topImageViewTap() {
        
        var actions: [UIAlertAction] = []
        actions.append(UIAlertAction(title: "Pum pum", style: .default) { _ in print("Pum pum") })
        actions.append(UIAlertAction(title: "Bum bum", style: .default) { _ in print("Bum bum") })
        imageSheetViewController.set(actions: actions)
        
        imageSheetViewController.getImageHandler = { [weak self] image in
            self?.topImageView.image = image
        }
        imageSheetViewController.targetSize = topImageView.frame.size
        imageSheetViewController.showActionSheet()
    }
    
    @objc func bottomImageViewTap() {
        
        var actions: [UIAlertAction] = []
        actions.append(UIAlertAction(title: "Wrum wrum", style: .default) { _ in print("Wrum wrum") })
        actions.append(UIAlertAction(title: "Zoom zoom", style: .default) { _ in print("Zoom zoom") })
        imageSheetViewController.set(actions: actions)
        
        imageSheetViewController.getImageHandler = { [weak self] image in
            self?.bottomImageView.image = image
        }
        imageSheetViewController.targetSize = bottomImageView.frame.size
        imageSheetViewController.showActionSheet()
    }
    
    //MARK: - Method
    func setupView() {
        let topGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(topImageViewTap))
        topImageView.isUserInteractionEnabled = true
        topImageView.addGestureRecognizer(topGestureRecognizer)
        
        let bottomGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(bottomImageViewTap))
        bottomImageView.isUserInteractionEnabled = true
        bottomImageView.addGestureRecognizer(bottomGestureRecognizer)
    }
    
    func configureImageSheetViewController() {
        imageSheetViewController = ImageSheetViewController()
        addChild(imageSheetViewController)
    }

}
