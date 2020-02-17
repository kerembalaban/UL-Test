//
//  UserVC.swift
//  UL-Test
//
//  Created by Kerem Balaban on 16.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import UIKit
import JGProgressHUD

class UserVC: BaseTableVC {
    var users:[User] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchUserList()
    }
    
    func fetchUserList(){
        showHUD(message: "Fetching users")
        BackendService.sharedInstance.fetchUserList { (userList,error) in
            self.hideHUD()
            if error == nil{
                self.users = userList
                self.tableView.reloadData()
            }else{
                self.showErrorString(error: error!.localizedDescription)
            }
        }
    }
    
    func showUserDetail(user:User){
         guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "userDetailVC") as? UserDetailVC else {
              return
        }
        destinationVC.selectedUser = user
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func showUsersOnMap(){
        guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "mapVC") as? MapVC else {
              return
        }
        destinationVC.users = self.users
        navigationController?.pushViewController(destinationVC, animated: true)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = "\(user.address.street) \(user.address.suite) \(user.address.city), \(user.address.zipcode)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        showUserDetail(user: user)
    }
}
