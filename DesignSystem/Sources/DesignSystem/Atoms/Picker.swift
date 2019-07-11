//
//  Picker.swift
//  DesignSystem
//
//  Created by acantallops on 2019/07/11.
//  Copyright © 2019 mercari. All rights reserved.
//

import UIKit
public final class Picker: UIPickerView, ThemeableViewProtocol {
    public var configureDesignClosure: ((UIView) -> Void)? { didSet { updateDesign() } }

    public static var typography: BrandingManager.Typography { return .medium }
    public static var textColor: UIColor { return .text() }
    public private(set) var data: PickerDataSource!

    public init() {
        super.init(frame: .zero)
        data = PickerDataSource(picker: self)
        delegate = data
        dataSource = data
        setup()
    }

    @available (*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configureDesign() {
        backgroundColor = .background(.secondary)
        reloadAllComponents()
    }
}

public final class PickerDataSource: NSObject, UIPickerViewDelegate {

    public var options: [[CustomStringConvertible]] = [] { didSet { picker?.reloadAllComponents() } }
    public var allowEmpty: Bool = true { didSet { picker?.reloadAllComponents() } }
    public var onSelect: ((UIPickerView, Int, Int) -> Void)?

    weak var picker: Picker?

    init(picker: Picker) {
        self.picker = picker
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard allowEmpty else {
            return options[component][row].description
        }
        if row == 0 { return nil }
        return options[component][row - 1].description
    }

    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        guard let string = self.pickerView(pickerView, titleForRow: row, forComponent: component) else { return nil }
        return NSAttributedString(string: string, typography: Picker.typography, color: Picker.textColor)
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        onSelect?(pickerView, row, component)
    }
}

extension PickerDataSource: UIPickerViewDataSource {

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return options.count
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options[component].count + (allowEmpty ? 1 : 0)
    }

}
