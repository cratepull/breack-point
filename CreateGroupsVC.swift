//
//  CreateGroupsVC.swift
//  breackpoint
//
//  Created by Sebastian Salamanca on 2/24/18.
//  Copyright © 2018 Sebastian Salamanca. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupsVC: UIViewController {

    @IBOutlet weak var titleTextField: insertTextField!
    @IBOutlet weak var descriptionTextField: insertTextField!
    @IBOutlet weak var emailTextField: insertTextField!
    @IBOutlet weak var addPeopleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    var emailArray = [String]()
    var chosenArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.doneBtn.isHidden = true
    }
    
    @objc func textFieldDidChanged(){
        if emailTextField.text == ""{
            emailArray = []
            tableView.reloadData()
        }else{
            DataService.instance.getEmail(forSearchQuery: emailTextField.text!, handler: { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()

            })
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        if titleTextField.text != "" && descriptionTextField.text != ""{
            DataService.instance.getIds(forUsernames: chosenArray, handler: { (idsArray) in
                var userIds = idsArray
                userIds.append((Auth.auth().currentUser?.uid)!)
                
                DataService.instance.createGroup(withTitle: self.titleTextField.text!, andDescription: self.descriptionTextField.text!, forUserIds: userIds, handler: { (groupCreated) in
                    if groupCreated {
                        self.dismiss(animated: true, completion: nil)
                    }else{
                        print("Group counl't be created!.")
                    }
                })
            })
        }
    }
}


extension CreateGroupsVC: UITableViewDataSource, UITableViewDelegate{


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell
            else {return UITableViewCell()}
        
        let profileImage = UIImage(named: "defaultProfileImage")
        
        cell.configureCell(profileImage: profileImage!, email: self.emailArray[indexPath.row], isSelected: false)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        
        if !chosenArray.contains(cell.emailLabel.text!) {
            chosenArray.append(cell.emailLabel.text!)
            addPeopleLbl.text = chosenArray.joined(separator: ", ")
            self.doneBtn.isHidden = false
            
        }else{
            chosenArray = chosenArray.filter({ $0 != cell.emailLabel.text! })
            
            if chosenArray.count >= 1 {
                addPeopleLbl.text = chosenArray.joined(separator: ", ")
                self.doneBtn.isHidden = true
            }else{
                addPeopleLbl.text = "Add people to your group."
            }
        }
    }
}

extension CreateGroupsVC: UITextFieldDelegate{
    

}






