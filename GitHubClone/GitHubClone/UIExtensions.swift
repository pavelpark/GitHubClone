//
//  UIExtensions.swift
//  GitHubClone
//
//  Created by Pavel Parkhomey on 4/4/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

extension UIResponder {
    static var identifier : String {
        return String(describing: self)
    }
}
