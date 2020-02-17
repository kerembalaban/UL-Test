//
//  UserDetailVC.swift
//  UL-Test
//
//  Created by Kerem Balaban on 16.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import UIKit
import MapKit
import JGProgressHUD
import UL_BackendService

class UserDetailVC: BaseVC,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var circularUserName:UILabel!
    @IBOutlet weak var username:UILabel!
    @IBOutlet weak var addressInfo:UILabel!
    @IBOutlet weak var email:UILabel!
    @IBOutlet weak var phone:UILabel!
    @IBOutlet weak var website:UILabel!
    
    var selectedUser:User!
    var posts: [Post] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Info"
        fillUserInfo()
        fetchUserPosts()
        prepareSelectedUserAnnotation()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Album", style: .plain, target: self, action: #selector(showAlbum))
    }
        
    func prepareSelectedUserAnnotation() {
        super.prepareMapAnnotation(user: selectedUser)
    }
        
    func fillUserInfo(){
        let splittedName = selectedUser.name.split(separator: " ")
        self.circularUserName.makeCircular()
        self.circularUserName.addBorder()
        
        splittedName.forEach { (string) in
            self.circularUserName.text = self.circularUserName.text! + string.prefix(1)
        }
        
        self.username.text = "\(selectedUser.name) (\(selectedUser.username))"
        self.addressInfo.text = "\(selectedUser.address.street) \(selectedUser.address.suite) \(selectedUser.address.city), \(selectedUser.address.zipcode)"
        self.email.text = selectedUser.email
        self.phone.text = selectedUser.phone
        //self.website.text = selectedUser.website
    }
    
    func fetchUserPosts(){
        super.showHUD(message: "Fetching posts")
        BackendService.sharedInstance.fetchPostBySelectedUser(id:selectedUser!.id, completion: { (postList,error) in
            super.hideHUD()
            if error == nil{
                self.posts = postList
                self.tableView.reloadData()
            }else{
                self.showErrorString(error: error!.localizedDescription)
            }
        })
    }
    
    @objc func showAlbum(){
        super.showHUD(message: "Fetching albums")
        BackendService.sharedInstance.fetchAlbumsBySelectedUser(id:selectedUser!.id, completion: { (albumList,error) in
            super.hideHUD()
            if error == nil{
                self.showAlbums(albums: albumList)
            }else{
                self.showErrorString(error: error!.localizedDescription)
            }
        })
    }
    
    func showAlbums(albums:[Album]){
        guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "albumVC") as? AlbumVC else {
              return
        }
        destinationVC.albums = albums
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func showPostDetail(post:Post){
         guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "postDetailVC") as? PostDetailVC else {
              return
        }
        destinationVC.selectedPost = post
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let post = posts[indexPath.row]
        
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        showPostDetail(post: post)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Posts"
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
