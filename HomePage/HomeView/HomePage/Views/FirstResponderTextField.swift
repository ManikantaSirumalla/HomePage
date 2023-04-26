//
//  FirstResponderTesxtField.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 31/03/23.
//

import Foundation
import SwiftUI

struct FirstResponderTextField: UIViewRepresentable {
    
    @Binding var text: String
    let placeHolder: String
    
    final class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        var becameFirstResponder = false
        var textField: UITextField?
        
        init(text: Binding<String>){
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
        func textFieldShouldClear(_ textField: UITextField) -> Bool {
                 text = ""
                 return true
             }
        
        func resignFirstResponder() {
            textField?.resignFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if !context.coordinator.becameFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.becameFirstResponder = true
        }
    }
    
    func makeUIView(context: Context) -> some UIView {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeHolder
        textField.textColor = .white
        textField.keyboardType = .asciiCapable
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardAppearance = .dark
        textField.returnKeyType = .search
        return textField
        
    }
}
