//
//  Label.swift
//  Mercari
//
//  Created by Shinichiro Oba on 21/06/2018.
//  Copyright © 2018 Mercari, Inc. All rights reserved.
//

import UIKit

public class Label: UILabel, ThemeableViewProtocol {
    public var configureDesignClosure: ((UIView) -> Void)? { didSet { updateDesign() }}


    public var typography: BrandingManager.Typography = .medium { didSet { lineHeight = numberOfLines == 1 ? 0.0 : typography.lineHeight } }
    public var actualLineHeight: CGFloat { return max(lineHeight, font.lineHeight) }
    public var underlineStyle: NSUnderlineStyle = [] { didSet { update() } }
    public var letterSpace: CGFloat = 0.0 { didSet { update() } }
    public var lineHeight: CGFloat = 0.0 { didSet { update() } }

    override public var font: UIFont! { get { return typography.font } set { } }
    override public var text: String? { didSet { update() } }
    override public var textAlignment: NSTextAlignment { didSet { update() } }

    override public var textColor: UIColor! { get { return color ?? typography.defaultColor } set { color = newValue }}
    private var color: UIColor? { didSet { update() }}

    public override init(frame: CGRect) {
        super.init(frame: frame)
        color = nil
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        color = nil
        setup()
    }

    public func apply(typography: BrandingManager.Typography) {
        self.typography = typography
    }

    public func configureDesign() {
        update()
    }

    private func update() {

        guard let text = text else { attributedText = nil; return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineBreakMode = .byTruncatingTail

        var attr = [NSAttributedString.Key: Any]()
        attr[.font] = typography.font
        attr[.foregroundColor] = color ?? typography.defaultColor
        attr[.paragraphStyle] = paragraphStyle
        attr[.underlineStyle] = underlineStyle.rawValue
        attr[.kern] = letterSpace

        attributedText = NSAttributedString(string: text, attributes: attr)
    }

    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        update()
    }
}
