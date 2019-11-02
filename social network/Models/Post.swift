//
//  Post.swift
//  social network
//
//  Created by Julia van Meurs on 2/11/19.
//  Copyright © 2019 Roger Goh. All rights reserved.
//

import Foundation

struct Post{
    let content: String!
    let addedByUser: String!
    
    init(content: String, addedByUser:String){
        self.content = content
        self.addedByUser = addedByUser
    }
}
