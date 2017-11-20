//
//  ICSnackbar.swift
//  ReadyInterface
//
//  Created by Dhyanesh Chaudhari on 2017-11-20.
//

import MaterialComponents.MaterialSnackbar

public class ICSnackbar {
    
    private var message: MDCSnackbarMessage!
    
    public var buttonTextColor: UIColor = UIColor.white {
        didSet {
            message.buttonTextColor = buttonTextColor
        }
    }
    
    public var duration: TimeInterval = 4.0 {
        didSet {
            message.duration = duration
        }
    }
    
    public init(text: String) {
        commonInit()
        message.text = text
    }
    
    public init(attributexText: NSAttributedString) {
        commonInit()
        message.attributedText = attributexText
    }
    
    public func show() {
        MDCSnackbarManager.show(message)
    }
    
    public func setAction(withTitle title: String, handler: @escaping ()->()) {
        let action = MDCSnackbarMessageAction()
        action.handler = handler
        action.title = title
        message.action = action
    }
    
    private func commonInit(text: String? = nil) {
        message = MDCSnackbarMessage()
    }
    

}
