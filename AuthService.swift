//
//  AuthService.swift
//  breackpoint
//
//  Created by Sebastian Salamanca on 2/11/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(widthEmail email: String, andPassword password: String, userCreatingComplete: @escaping(_ status:Bool, _ error: Error?) -> ()){
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreatingComplete(false, error)
                return
            }
            
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            userCreatingComplete(true, nil)
        }
    }
    
    func loginUser(widthEmail email: String, andPassword password: String, loginComplete: @escaping(_ status:Bool, _ error: Error?) -> ()){
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                loginComplete(false, error)
                return
            }
            
            loginComplete(true, nil)
        }
    }
}
