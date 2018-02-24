//
//  CreatePostVC.swift
//  breackpoint
//
//  Created by Sebastian Salamanca on 2/22/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        sendBtn.bindToKeyBoard()
        
    }
    
    @IBAction func cloeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        
        if textField.text != nil && textField.text != "Say something here..." {
            
            self.sendBtn.isEnabled = false
            
            DataService.instance.uploadPost(withMessage: textField.text!, forUI: Auth.auth().currentUser!.uid, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }else{
                    self.sendBtn.isEnabled = true
                    print("there was an error.")
                }
            })
        }
    }
}

extension CreatePostVC: UITextViewDelegate{

    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }

}

