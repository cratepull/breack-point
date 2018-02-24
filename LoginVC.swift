//
//  LoginVC.swift
//  breackpoint
//
//  Created by Sebastian Salamanca on 2/11/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: insertTextField!
    @IBOutlet weak var passwordField: insertTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passwordField.delegate = self
        
    }

    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil{
            AuthService.instance.loginUser(widthEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, logInError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }else{
                    print(logInError?.localizedDescription)
                }
                
                
                AuthService.instance.registerUser(widthEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreatingComplete: { (success, registerError) in
                    
                    if success {
                        AuthService.instance.loginUser(widthEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("successfully registered user!")
                        })
                    }else{
                        print(registerError?.localizedDescription)
                    }
                })
            })
        }
    }
    
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC:UITextFieldDelegate{

}
