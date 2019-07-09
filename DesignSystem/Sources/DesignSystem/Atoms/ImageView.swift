//
//  ImageView.swift
//  DesignSystem
//
//  Created by anthony on 19/11/2018.
//  Copyright © 2018 mercari. All rights reserved.
//

import Foundation
import UIKit

public class ImageView: UIImageView, ThemeableViewProtocol {
    public var configureDesignClosure: ((UIView) -> Void)? { didSet { updateDesign() } }

    public func configureDesign() {
    }
}


