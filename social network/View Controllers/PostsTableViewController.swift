//
//  PostsTableViewController.swift
//  social network
//
//  Created by Julia van Meurs on 2/11/19.
//  Copyright © 2019 Roger Goh. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {

    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPost(_ sender: Any) {
        let postAlert = UIAlertController(title: "New Post", message: "Enter your Post", preferredStyle: .alert)
        postAlert.addTextField(configurationHandler: {(textField:UITextField) in
            textField.placeholder = "Your Post"
        })
        postAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: {(action:UIAlertAction) in
            if let postContent = postAlert.textFields?.first?.text{
                let post = Post(content: postContent, addedByUser: "Anonymous")
                self.posts.append(post)
                self.tableView.reloadData()
            }
        }))
        self.present(postAlert, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let post = posts[indexPath.row]
        
        cell.textLabel?.text = post.content
        cell.detailTextLabel?.text = post.addedByUser

        return cell
    }
}
