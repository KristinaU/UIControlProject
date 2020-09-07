//
//  TextFieldControlFactory.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

protocol TextFieldControlFactoryDelegate {
  func updateText(with text: String)
}

class TextFieldControlFactory: ControlFactory {
  
  private let textFieldText: String
  private var delegate: TextFieldControlFactoryDelegate?
  
  init(textFieldText: String, delegate: TextFieldControlFactoryDelegate?) {
    self.textFieldText = textFieldText
    self.delegate = delegate
  }
  
  func needsWidth() -> Bool {
    return false
  }
  
  @objc func textFieldTextChanged(_ sender: UITextField) {
    
        self.delegate!.updateText(with: String(sender.text!))

  }
    
  func build() -> UIView {
    let textFieldControl = UITextField()
    textFieldControl.addTarget(self, action: #selector(self.textFieldTextChanged), for: .editingChanged)
    textFieldControl.text = self.textFieldText
    return textFieldControl
  }
}
