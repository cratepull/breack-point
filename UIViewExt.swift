//
//  UIViewExt.swift
//  breackpoint
//
//  Created by Sebastian Salamanca on 2/23/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyBoard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillChange(_:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
    }
    
    @objc func keyBoardWillChange(_ notification: NSNotification){
        
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! UInt
        let beginigFrame = ( notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue ).cgRectValue
        let endFrame = ( notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue ).cgRectValue
        let deltaY = endFrame.origin.y - beginigFrame.origin.y
        
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0.0,
            options: UIViewKeyframeAnimationOptions(rawValue:curve),
            
            animations: { 
                self.frame.origin.y += deltaY
            },
            
            completion: nil)
    }
}
