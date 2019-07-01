//
//  ViewController.swift
//  Login
//
//  Created by Eddie Ahn on 01/07/2019.
//  Copyright © 2019 Eddie Ahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    var emailErrorHeight: NSLayoutConstraint!
    var passwordErrorHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        emailErrorHeight = emailError.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight = passwordError.heightAnchor.constraint(equalToConstant: 0)
    }
    
    @objc func textFieldEdited(textField: UITextField) {
        if textField == emailTextField{
            print("이메일 텍스트 필드 \(textField.text!)")
            
            if isValidEmail(email: textField.text) == true {
                //에러표시 나오면 안됨.
                emailErrorHeight.isActive = true
            } else {
                emailErrorHeight.isActive = false
        
            }
        } else if textField == passwordTextField{
            print("비밀번호 텍스트 필드 \(textField.text!)")
            if isValidPassword(pw: textField.text) == true {
                passwordErrorHeight.isActive = true
            } else {
                passwordErrorHeight.isActive = false
            }
        }
        
    }
    
    //정규식 - regular expression
    func isValidEmail(email: String?) -> Bool {
        guard email != nil else { return false }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    
    func isValidPassword(pw: String?) -> Bool {
        if let hasPassword = pw {
            if hasPassword.count < 8 {
                return false
        }
    }
        return true
    }
}
