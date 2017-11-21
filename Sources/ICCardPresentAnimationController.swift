//
//  CardPresentAnimationController.swift
//  ReadyInterface_Example
//
//  Created by Dhyanesh Chaudhari on 2017-11-20.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

public class ICCardPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let originFrame: CGRect
    private let cornerRadius: CGFloat
    private let animationDuration: TimeInterval
    
    public init(originFrame: CGRect, cornerRadius: CGFloat, animationDuration: TimeInterval) {
        self.originFrame = originFrame
        self.cornerRadius = cornerRadius
        self.animationDuration = animationDuration
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Extract a reference to both the view controller being replaced and the one being presented. Make a snapshot of what the screen will look like after the transition.
        guard let fromVC = transitionContext.viewController(forKey: .from),
        let toVC = transitionContext.viewController(forKey: .to),
        let snapshot = toVC.view.snapshotView(afterScreenUpdates: true) else {
            return
        }
        
        // UIKit encapsulates the entire transition inside a container view to simplify managing both the view hierarchy and the animations. Get a reference to the container view and determine what the final frame of the new view will be.
        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        // Configure the snapshot’s frame and drawing so that it exactly matches and covers the card in the “from” view.
        snapshot.frame = CGRect(x: 0, y: 0, width: originFrame.width, height: snapshot.frame.height)
        
        let snapContainer = UIView(frame: originFrame)
        snapContainer.layer.cornerRadius = cornerRadius
        snapContainer.layer.masksToBounds = true
        snapContainer.addSubview(snapshot)
        snapContainer.backgroundColor = UIColor.blue
        
        // Add the new “to” view to the view hierarchy and hide it. Place the snapshot in front of it.
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapContainer)
        toVC.view.isHidden = true
        
        // Get the duration of the animation.
        let duration = transitionDuration(using: transitionContext)
        
        // You use a standard UIView keyframe animation. The duration of the animation must exactly match the length of the transition.
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            
            // Set the frame of the snapshot to fill the screen.
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                snapshot.frame = CGRect(x: 0, y: 0, width: finalFrame.width, height: finalFrame.height)
                snapContainer.frame = finalFrame
                snapContainer.layer.cornerRadius = 0
            })
        }) { (_) in
            // The snapshot now exactly matches the “to” view so it’s finally safe to reveal the real “to” view. Remove the snapshot from the view hierarchy since it’s no longer needed. Next, restore the “from” view to its original state; otherwise, it would be hidden when transitioning back. Calling completeTransition(_:) informs UIKit that the animation is complete. It will ensure the final state is consistent and remove the “from” view from the container.
            toVC.view.isHidden = false
            snapContainer.removeFromSuperview()
            fromVC.view.layer.transform = CATransform3DIdentity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}

public class ICCardDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let destinationFrame: CGRect
    private let cornerRadius: CGFloat
    private let animationDuration: TimeInterval
    
    public init(destinationFrame: CGRect, cornerRadius: CGFloat, animationDuration: TimeInterval) {
        self.destinationFrame = destinationFrame
        self.cornerRadius = cornerRadius
        self.animationDuration = animationDuration
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
        let toVC = transitionContext.viewController(forKey: .to),
        let snapshot = fromVC.view.snapshotView(afterScreenUpdates: true)
        else {
            return
        }
        
        let containerView = transitionContext.containerView
        let snapContainer = UIView(frame: snapshot.frame)
        snapContainer.addSubview(snapshot)
        snapContainer.layer.cornerRadius = 0
        snapContainer.layer.masksToBounds = true
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapContainer)
        fromVC.view.isHidden = true
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                snapshot.frame = CGRect(x: 0, y: 0, width: self.destinationFrame.width, height: snapshot.frame.height)
                snapContainer.frame = self.destinationFrame
                snapContainer.layer.cornerRadius = self.cornerRadius
            })
        }) { (_) in
            fromVC.view.isHidden = false
            snapContainer.removeFromSuperview()
            if (transitionContext.transitionWasCancelled) {
                toVC.view.removeFromSuperview()
            }
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
}
