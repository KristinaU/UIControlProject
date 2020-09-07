//
//  StepperControlPresenter.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

class TextFieldControlPresenter: ControlPresenting {

    
  
    private var textFieldText = "Hello!"
    
  func controlName() -> String {
    return "UITextField"
  }
  
  func controlValue() -> String {
      return self.textFieldText
  }
  func controlFactory() -> ControlFactory {
    return TextFieldControlFactory(textFieldText: self.textFieldText, delegate: self)
  }
}

extension TextFieldControlPresenter: TextFieldControlFactoryDelegate {
  func updateText(with text: String) {
    self.textFieldText = text
  }
}
