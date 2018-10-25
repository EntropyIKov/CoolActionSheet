//
//  TwoImagesViewController.swift
//  CoolActionSheet
//
//  Created by Kovalenko Ilia on 25/10/2018.
//  Copyright © 2018 Kovalenko Ilia. All rights reserved.
//

import UIKit

class TwoImagesViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    //MARK: - Property
    var imageSheetViewController: ImageSheetViewController!
    var topImageViewAlertActions: [UIAlertAction] = []
    var bottomImageViewAlertActions: [UIAlertAction] = []
    
    //MARK: - Action
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        imageSheetViewController = ImageSheetViewController()
        addChild(imageSheetViewController)
    }
    
    @objc func topImageViewTap() {
        configureAndShowImageSheetViewController(for: .top)
    }
    
    @objc func bottomImageViewTap() {
        configureAndShowImageSheetViewController(for: .bottom)
    }
    
    //MARK: - Method
    func setupView() {
        let topGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(topImageViewTap))
        topImageView.isUserInteractionEnabled = true
        topImageView.addGestureRecognizer(topGestureRecognizer)
        topImageViewAlertActions.append(UIAlertAction(title: "Pum pum", style: .default) { _ in print("Pum pum") })
        topImageViewAlertActions.append(UIAlertAction(title: "Bum bum", style: .default) { _ in print("Bum bum") })
        
        let bottomGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(bottomImageViewTap))
        bottomImageView.isUserInteractionEnabled = true
        bottomImageView.addGestureRecognizer(bottomGestureRecognizer)
        bottomImageViewAlertActions.append(UIAlertAction(title: "Wrum wrum", style: .default) { _ in print("Wrum wrum") })
        bottomImageViewAlertActions.append(UIAlertAction(title: "Zoom zoom", style: .default) { _ in print("Zoom zoom") })
    }
    
    private func configureAndShowImageSheetViewController(for position: ImagePositionEnum) {
        switch position {
        case .top:
            imageSheetViewController.set(actions: topImageViewAlertActions)
            imageSheetViewController.getImageHandler = { [weak self] image in
                self?.topImageView.image = image
            }
            imageSheetViewController.targetSize = topImageView.frame.size
        case .bottom:
            imageSheetViewController.set(actions: bottomImageViewAlertActions)
            imageSheetViewController.getImageHandler = { [weak self] image in
                self?.bottomImageView.image = image
            }
            imageSheetViewController.targetSize = bottomImageView.frame.size
        }
        imageSheetViewController.showActionSheet()
    }

}

extension TwoImagesViewController {
    private enum ImagePositionEnum {
        case top
        case bottom
    }
}
