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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(cardView: viewFromXib)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configureView(cardView: ICActionCardView) {
        cardView.loadCardImage(fromUrlString: "", placeholderImage: nil)
        cardView.configureContent(headline: "VIEW FROM CODE", title: "This view is generated programmatically", callout: "Click the button for view detail", buttonText: "View")
        cardView.buttonRadius = 10.0
        cardView.buttonTextColor = UIColor.white
        cardView.cardBackgroundColor = UIColor.darkGray
        cardView.headlineColor = UIColor.lightGray
        cardView.titleColor = UIColor.white
        cardView.calloutColor = UIColor.white
    }

}
