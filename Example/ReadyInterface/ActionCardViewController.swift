//
//  ActionCardViewController.swift
//  ReadyInterface_Example
//
//  Created by Dhyanesh Chaudhari on 2017-11-16.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ReadyInterface

class ActionCardViewController: UIViewController, ICActionCardViewDelegate, UIViewControllerTransitioningDelegate {
    
    @IBOutlet private weak var viewFromXib: ICActionCardView!
    @IBOutlet private weak var programmaticContainer: UIView!
    @IBOutlet private weak var xibContainer: UIView!
    
    private var viewFromCode: ICActionCardView!
    private var cornerRadius: CGFloat = 10.0
    private var viewContainerBeingAnimated: UIView?
    
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
            cardView.tag = 1
        } else {
            cardView.configureContent(headline: "VIEW FROM CODE", title: "This view is generated programmatically", callout: "Click the button for view detail", buttonText: "View")
            cardView.tag = 2
        }
        cardView.buttonRadius = cornerRadius
        cardView.cornerRadius = cornerRadius
        cardView.buttonTextColor = UIColor.white
        cardView.cardBackgroundColor = UIColor.darkGray
        cardView.headlineColor = UIColor.lightGray
        cardView.titleColor = UIColor.white
        cardView.calloutColor = UIColor.white
        cardView.showShadow(.resting)
        cardView.delegate = self
    }
    
    // MARK: - ICActionCardViewDelegate
    
    func didClickCalloutButton(sender: ICActionCardView) {
        switch sender.tag {
        case 1:
            viewContainerBeingAnimated = xibContainer
        case 2:
            viewContainerBeingAnimated = programmaticContainer
        default: break
        }
        self.performSegue(withIdentifier: "segueActionDetail", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination
        destinationVC.transitioningDelegate = self
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CardPresentAnimationController(originFrame: viewContainerBeingAnimated!.frame, cornerRadius: cornerRadius)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CardDismissAnimationController(destinationFrame: viewContainerBeingAnimated!.frame, cornerRadius: cornerRadius)
    }

}
