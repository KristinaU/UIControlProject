//
//  StepperControlPresenter.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

class SegmentedControlPresenter: ControlPresenting {
  
    private var segmentedIndex = 0
    
  func controlName() -> String {
    return "UISegmentedControl"
  }
  
  func controlValue() -> String {
    return "\(self.segmentedIndex + 1)"
  }
  
  func controlFactory() -> ControlFactory {
    return SegmentedControlFactory(segmentedIndex: self.segmentedIndex, delegate: self)
  }
}

extension SegmentedControlPresenter: SegmentedControlFactoryDelegate {
    func updateValue(with value: Int) {
        self.segmentedIndex = value    }
    
    
}
