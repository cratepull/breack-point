//
//  ShadowView.swift
//  breackpoint
//
//  Created by Sebastian Salamanca on 2/11/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }
}
