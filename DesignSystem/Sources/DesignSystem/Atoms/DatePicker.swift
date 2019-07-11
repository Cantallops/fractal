//
//  DatePicker.swift
//  DesignSystem
//
//  Created by acantallops on 2019/07/11.
//  Copyright © 2019 mercari. All rights reserved.
//

import UIKit

public final class DatePicker: UIDatePicker, ThemeableViewProtocol {
    public var configureDesignClosure: ((UIView) -> Void)? { didSet { updateDesign() } }

    public init() {
        super.init(frame: .zero)
        layer.cornerRadius = bounds.size.height/2
        setup()
    }

    @available (*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configureDesign() {
        // HACKY
        backgroundColor = .background(.secondary)
        setValue(UIColor.text(), forKey: "textColor")
        setValue(false, forKeyPath: "highlightsToday")
    }
}
