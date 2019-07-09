//
//  ThemeableViewProtocol.swift
//  DesignSystem
//
//  Created by acantallops on 2019/07/09.
//  Copyright © 2019 mercari. All rights reserved.
//

import Foundation

public protocol ThemeableViewProtocol {
    var configureDesignClosure: ((UIView) -> Void)? { get set }

    func updateDesign()
    func configureDesign()
}

public extension ThemeableViewProtocol where Self: UIView {
    internal func setup() {
        updateDesign()
        _ = NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: BrandingManager.didChange), object: nil, queue: nil) { [weak self] (_) in
            self?.updateDesign()
        }
    }

    func updateDesign() {
        configureDesign()
        configureDesignClosure?(self)
    }

}
