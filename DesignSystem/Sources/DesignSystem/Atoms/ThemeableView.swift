//
//  ThemeableView.swift
//  DesignSystem
//
//  Created by acantallops on 2019/07/09.
//  Copyright © 2019 mercari. All rights reserved.
//

import UIKit

open class ThemeableView: UIView, ThemeableViewProtocol {

    public var configureDesignClosure: ((UIView) -> Void)? {
        didSet { updateDesign() }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    open func configureDesign() {
    }

}
