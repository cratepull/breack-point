//
//  CreateGroupsVC.swift
//  breackpoint
//
//  Created by Sebastian Salamanca on 2/24/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    @IBOutlet weak var titleTextField: insertTextField!
    @IBOutlet weak var descriptionTextField: insertTextField!
    @IBOutlet weak var emailTextField: insertTextField!
    @IBOutlet weak var addPeopleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        
    }

}


extension CreateGroupsVC: UITableViewDataSource, UITableViewDelegate{


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell
            else {return UITableViewCell()}
        
        let profileImage = UIImage(named: "defaultProfileImage")
        
        cell.configureCell(profileImage: profileImage!, email: "sebas@aol.com", isSelected: true)
        
        return cell
    }

}






