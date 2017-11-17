//
//  ICActionCardView.swift
//  ReadyInterface
//
//  Created by Dhyanesh Chaudhari on 2017-11-15.
//  Copyright © 2017 iamchaudhari. All rights reserved.
//

import UIKit

@IBDesignable
class ICActionCardView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var calloutLabel: UILabel!
    @IBOutlet weak var calloutButton: UIButton!
    
    @IBInspectable
    public var cornerRadius: CGFloat = 5.0 {
        didSet {
            containerView.clipsToBounds = false
            containerView.layer.cornerRadius = cornerRadius
        }
    }
    
    public var buttonRadius: CGFloat = 0.0 {
        didSet {
            calloutButton.clipsToBounds = true
            calloutButton.layer.cornerRadius = buttonRadius
        }
    }
    
    public var showShadow: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let color = (showShadow) ? UIColor.lightGray.withAlphaComponent(0.2) : UIColor.clear
        ViewUtils.drawShadowFor(view: contentView, size: 8.0, color: color, radius: cornerRadius)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: ICActionCardView.self)
        bundle.loadNibNamed("ICActionCardView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        buttonRadius = 10.0
    }

}
