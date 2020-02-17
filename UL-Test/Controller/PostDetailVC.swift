//
//  PostDetailVC.swift
//  UL-Test
//
//  Created by Kerem Balaban on 17.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import UIKit
import JGProgressHUD

class PostDetailVC: BaseTableVC {
    
    var selectedPost:Post!
    var comments:[Comment] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comments"
        self.fetchComments()
    }
    
    func fetchComments(){
        showHUD(message: "Fetching comments")
        BackendService.sharedInstance.fetchCommentsBySelectedPost(id:selectedPost!.id, completion: { (commentList,error) in
            self.hideHUD()
            if error == nil{
                self.comments = commentList
                self.tableView.reloadData()
            }else{
                self.showErrorString(error: error!.localizedDescription)
            }
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : comments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
            cell.textLabel?.text = selectedPost.title
            cell.detailTextLabel?.text = selectedPost.body
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        
        let comment = comments[indexPath.row]
        
        // This is not ideal solution for displaying data on Table view cell, but it's easy to use
        (cell.viewWithTag(1) as? UILabel)?.text = comment.email
        (cell.viewWithTag(2) as? UILabel)?.text = comment.name
        (cell.viewWithTag(3) as? UILabel)?.text = comment.body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "" : "Comments"
    }
}
