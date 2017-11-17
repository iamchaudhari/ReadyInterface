//
//  ViewUtils.swift
//  ReadyInterface
//
//  Created by Dhyanesh Chaudhari on 2017-11-16.
//  Copyright © 2017 iamchaudhari. All rights reserved.
//

import UIKit
import Foundation

class CommonUtils {
    
    private static let RESOURCE_BUNDLE = "ReadyInterface.bundle"
    
    static func getResourceBundle(forClass: Swift.AnyClass) -> Bundle {
        let bundle = Bundle(for: forClass)
        if let url = bundle.resourceURL?.appendingPathComponent(RESOURCE_BUNDLE) {
            return Bundle(url: url)!
        } else {
            return bundle
        }
    }
}
