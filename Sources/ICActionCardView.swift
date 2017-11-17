//
//  ICActionCardView.swift
//  ReadyInterface
//
//  Created by Dhyanesh Chaudhari on 2017-11-15.
//  Copyright © 2017 iamchaudhari. All rights reserved.
//

import UIKit
import Kingfisher

@objc public protocol ICActionCardViewDelegate {
    @objc optional func didClickCalloutButton(sender: ICActionCardView)
}

@IBDesignable
public class ICActionCardView: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var cardImageView: UIImageView!
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var calloutLabel: UILabel!
    @IBOutlet private weak var calloutButton: UIButton!
    
    private var shadowSize: CGFloat = 0.0
    private var shadowColor: UIColor = UIColor.clear
    public weak var delegate: ICActionCardViewDelegate?
    
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
    
    public var cardBackgroundColor: UIColor = UIColor.clear {
        didSet {
            containerView.backgroundColor = cardBackgroundColor
        }
    }
    
    public var headlineColor: UIColor = UIColor.darkGray {
        didSet {
            headlineLabel.textColor = headlineColor
        }
    }
    
    public var titleColor: UIColor = UIColor.black {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    public var calloutColor: UIColor = UIColor.white {
        didSet {
            calloutLabel.textColor = calloutColor
        }
    }
    
    public var buttonTextColor: UIColor = UIColor.darkGray {
        didSet {
            calloutButton.tintColor = buttonTextColor
        }
    }
    
    public var buttonBackgroundColor: UIColor = UIColor.white {
        didSet {
            calloutButton.backgroundColor = buttonBackgroundColor
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        CommonUtils.drawShadowFor(view: contentView, size: shadowSize, color: shadowColor, radius: cornerRadius)
    }
    
    public func configureContent(headline: String?, title: String?, callout: String?, buttonText: String?) {
        headlineLabel.text = headline
        titleLabel.text = title
        calloutLabel.text = callout
        calloutButton.setTitle(buttonText, for: .normal)
    }
    
    public func showShadow(withSize size: CGFloat, color: UIColor) {
        shadowSize = size
        shadowColor = color
    }
    
    public func loadCardImage(fromUrlString urlString: String, placeholderImage: UIImage?) {
        guard let url = URL(string: urlString) else {
            return
        }
        cardImageView.kf.setImage(with: url, placeholder: placeholderImage)
    }
    
    private func commonInit() {
        CommonUtils.getResourceBundle(forClass: ICActionCardView.self).loadNibNamed("ICActionCardView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        buttonRadius = 10.0
    }

    
    @IBAction func calloutButtonClicked(_ sender: UIButton) {
        delegate?.didClickCalloutButton?(sender: self)
    }
    

}
