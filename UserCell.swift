//
//  UserCell.swift
//  breackpoint
//
//  Created by Sebastian Salamanca on 2/24/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool ){
        
        self.profileImage.image = image
        self.emailLabel.text = email
        
        if isSelected {
            self.checkImage.isHidden = false
        }else{
            self.checkImage.isHidden = true
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
