//
//  ActionCardViewController.swift
//  ReadyInterface_Example
//
//  Created by Dhyanesh Chaudhari on 2017-11-16.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ReadyInterface

class ActionCardViewController: UIViewController, ICActionCardViewDelegate {
    
    @IBOutlet weak var viewFromXib: ICActionCardView!
    @IBOutlet weak var programmaticContainer: UIView!
    
    private var viewFromCode: ICActionCardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView(cardView: viewFromXib, isXib: true)
        
        viewFromCode = ICActionCardView(frame: programmaticContainer.bounds)
        configureView(cardView: viewFromCode, isXib: false)
        programmaticContainer.addSubview(viewFromCode)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let viewFromCodeFrame = programmaticContainer.bounds
        viewFromCode.frame = viewFromCodeFrame
    }

    
    private func configureView(cardView: ICActionCardView, isXib: Bool) {
        cardView.loadCardImage(fromUrlString: "", placeholderImage: nil)
        if (isXib) {
            cardView.configureContent(headline: "VIEW FROM XIB", title: "This view is generated from Xib", callout: "Click the button for view detail", buttonText: "View")
        } else {
            cardView.configureContent(headline: "VIEW FROM CODE", title: "This view is generated programmatically", callout: "Click the button for view detail", buttonText: "View")
        }
        cardView.buttonBackgroundColor = UIColor.white
        cardView.buttonRadius = 10.0
        cardView.cornerRadius = 10.0
        cardView.buttonTextColor = UIColor.blue
        cardView.buttonBackgroundColor = UIColor.white
        cardView.cardBackgroundColor = UIColor.darkGray
        cardView.headlineColor = UIColor.lightGray
        cardView.titleColor = UIColor.white
        cardView.calloutColor = UIColor.white
        cardView.showShadow(withSize: 6.0, color: UIColor.lightGray.withAlphaComponent(1.0))
        cardView.delegate = self
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - ICActionCardViewDelegate
    
    func didClickCalloutButton(sender: ICActionCardView) {
        print("Clicked")
    }

}
