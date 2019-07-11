//
//  Switch.swift
//  DesignSample
//
//  Created by Anthony Smith on 11/09/2018.
//  Copyright © 2018 mercari. All rights reserved.
//

import Foundation
import UIKit

public final class Switch: UISwitch, ThemeableViewProtocol {
    public var configureDesignClosure: ((UIView) -> Void)? { didSet { updateDesign() } }



    public var dark: Bool = false { didSet { updateForDark() }}

    public init() {
        super.init(frame: .zero)
        setup()
    }

    @available (*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateForDark() {
        thumbTintColor = dark ? .text() : nil
    }

    public func configureDesign() {
        updateForDark()
        layer.cornerRadius = bounds.size.height/2
    }
}
