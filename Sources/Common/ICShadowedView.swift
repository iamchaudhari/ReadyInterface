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
    case none
}

class ICShadowedView: UIView {
    
    override class var layerClass: AnyClass {
        return MDCShadowLayer.self
    }

    var shadowLayer: MDCShadowLayer {
        return self.layer as! MDCShadowLayer
    }

    func setDefaultElevation() {
        self.shadowLayer.elevation = .none
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
        case .none:
            return .none
        }
    }
    
}
