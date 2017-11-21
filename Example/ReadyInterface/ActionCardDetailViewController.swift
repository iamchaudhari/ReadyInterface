//
//  ActionCardDetailViewController.swift
//  ReadyInterface_Example
//
//  Created by Dhyanesh Chaudhari on 2017-11-20.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ReadyInterface

class ActionCardDetailViewController: UIViewController {

    @IBOutlet weak var viewFromXib: ICActionCardView!
    public var cardImage: UIImage?
    public var cornerRadius: CGFloat?
    public var clickedFromXib = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(cardView: viewFromXib, isXib: clickedFromXib)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configureView(cardView: ICActionCardView, isXib: Bool) {
        if let image = cardImage {
            cardView.loadCardImage(image: image)
        }
        if (isXib) {
            cardView.configureContent(headline: "VIEW FROM XIB", title: "This view is generated from Xib", callout: "Click the button for view detail", buttonText: "View")
        } else {
            cardView.configureContent(headline: "VIEW FROM CODE", title: "This view is generated programmatically", callout: "Click the button for view detail", buttonText: "View")
        }
        cardView.buttonRadius = cornerRadius ?? 10.0
        cardView.cornerRadius = cornerRadius ?? 10.0
        cardView.buttonTextColor = UIColor.blue
        cardView.cardBackgroundColor = UIColor.white
        cardView.headlineColor = UIColor.lightGray
        cardView.titleColor = UIColor.darkGray
        cardView.calloutColor = UIColor.darkGray
    }

}
