//
//  AuthVC.swift
//  breackpoint
//
//  Created by Sebastian Salamanca on 2/11/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        
        let logInVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        
        present(logInVC!, animated:true, completion: nil)
        
    }
    
    
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
    
    
    }

    @IBOutlet weak var facebookSignInBtnWasPressed: UIButton!
}
