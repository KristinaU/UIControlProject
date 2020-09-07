//
//  StepperControlFactory.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

protocol StepperControlFactoryDelegate {
  func updateValue(with value: Double)
}

class StepperControlFactory: ControlFactory {
  
  private let stepperValue: Double
  private var delegate: StepperControlFactoryDelegate?
  
  init(stepperValue: Double, delegate: StepperControlFactoryDelegate?) {
    self.stepperValue = stepperValue
    self.delegate = delegate
  }
  
  func needsWidth() -> Bool {
    return false
  }
  
  @objc func stepperValueChanged(_ sender: UIStepper) {
    self.delegate?.updateValue(with: Double(sender.value))
  }
  
  func build() -> UIView {
    let stepperControl = UIStepper()
    stepperControl.addTarget(self, action: #selector(self.stepperValueChanged), for: .valueChanged)
    stepperControl.value = Double(self.stepperValue)
    return stepperControl
  }
}
