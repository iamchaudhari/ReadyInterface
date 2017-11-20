//
//  ICShadowedView.swift
//  ReadyInterface
//
//  Created by Dhyanesh Chaudhari on 2017-11-17.
//

import UIKit
import MaterialComponents

public enum ICShadowElevation {
    case resting
    case dialog
}

class ICShadowedView: UIView {
    
    override class var layerClass: AnyClass {
        return MDCShadowLayer.self
    }

    var shadowLayer: MDCShadowLayer {
        return self.layer as! MDCShadowLayer
    }

    func setDefaultElevation() {
        self.shadowLayer.elevation = .cardResting
    }
    
    func setElevation(elevation: ICShadowElevation) {
        self.shadowLayer.elevation = transformElevation(elevation: elevation)
    }
    
    private func transformElevation(elevation: ICShadowElevation) -> ShadowElevation {
        switch elevation {
        case .resting:
            return .cardPickedUp
        case .dialog:
            return .dialog
        }
    }
    
}
