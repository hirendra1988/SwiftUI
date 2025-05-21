//
//  PresentableView.swift
//  IntegrationWithUIKIT
//
//  Created by Hirendra Sharma on 07/07/24.
//

import UIKit
import SwiftUI
import MapKit

struct CustomLabelFromSwift: UIViewRepresentable {
    typealias UIViewType = CustomLabel
    var labelDetail: String = ""
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return true
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            print(textField.text)
        }
    }
    
    func makeUIView(context: Context) -> CustomLabel {
        let label = CustomLabel(frame: CGRect(x: 0, y: 200, width: 150, height: 100))
        label.text = "Swift Custom Label"
        return label
    }
    
    func updateUIView(_ uiView: CustomLabel, context: Context) {
        uiView.text = labelDetail
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

struct CustomTextFieldFromSwift: UIViewRepresentable {
    typealias UIViewType = CustomTextField
    @Binding var text: String
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return true
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            print(textField.text as Any)
            return true
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
    
    func makeUIView(context: Context) -> CustomTextField {
        let txtField = CustomTextField(frame: CGRect(x: 0, y: 200, width: 150, height: 100))
        txtField.text = "Swift Custom Label"
        txtField.delegate = context.coordinator
        return txtField
    }
    
    func updateUIView(_ uiView: CustomTextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
}
