//
//  SegmentedControl.swift
//  DesignSystem
//
//  Created by acantallops on 2019/04/25.
//  Copyright © 2019 mercari. All rights reserved.
//

import Foundation
import UIKit

public class SegmentedControl: UISegmentedControl, ThemeableViewProtocol {
    public var configureDesignClosure: ((UIView) -> Void)? { didSet { updateDesign() } }



    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    override public init(items: [Any]?) {
        super.init(items: items)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    public func configureDesign() {
        tintColor = .brand()
        backgroundColor = .clear
    }

}
