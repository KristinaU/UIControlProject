//
//  StepperControlPresenter.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

class StepperControlPresenter: ControlPresenting {
  
    private var stepperValue = 1.0
  
  func controlName() -> String {
    return "UIStepper"
  }
  
  func controlValue() -> String {
    return "\(self.stepperValue)"
  }
  
  func controlFactory() -> ControlFactory {
    return StepperControlFactory(stepperValue: self.stepperValue, delegate: self)
  }
}

extension StepperControlPresenter: StepperControlFactoryDelegate {
  func updateValue(with value: Double) {
    self.stepperValue = value
  }
}
