//
//  SliderControlFactory.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

protocol SegmentedControlFactoryDelegate {
  func updateValue(with value: Int)
}

class SegmentedControlFactory: ControlFactory {
  
  private var segmentedIndex: Int
  private var delegate: SegmentedControlFactoryDelegate?
  
  init(segmentedIndex: Int, delegate: SegmentedControlFactoryDelegate?) {
    self.segmentedIndex = segmentedIndex
    self.delegate = delegate
  }
  
  func needsWidth() -> Bool {
    return true
  }
  
  @objc func segmentedValueChanged(_ sender: UISegmentedControl) {
    self.delegate?.updateValue(with: sender.selectedSegmentIndex)
  }
  
  func build() -> UIView {
    let segmentedControl = UISegmentedControl(items: ["One", "Two", "Three"])
    
    segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged), for: .valueChanged)
    segmentedControl.selectedSegmentIndex = Int(self.segmentedIndex)
    return segmentedControl
  }
}
