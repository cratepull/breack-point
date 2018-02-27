//
//  GroupCell.swift
//  breackpoint
//
//  Created by Sebastian Salamanca on 2/26/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var groupDescriptionLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    
    func configureCell(title:String, description:String, memberCount:Int){
        self.groupTitleLabel.text = title
        self.groupDescriptionLabel.text = description
        self.memberCountLabel.text = "\(memberCount) members"
    }
    
    
}
