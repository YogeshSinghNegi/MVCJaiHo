//
//  Person.swift
//  MVCJaiHo
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//

import Foundation

//=============================================================//
//MARK: Person Class
//=============================================================//

class Person {
    
    let userName:String!
    let password:String!
    
//=============================================================//
//MARK: initializer which populates store properties of Model
//=============================================================//
    
    init(dict:[String:Any]) {
        
        let form = dict["form"] as! [String : Any]
        self.userName = form["UserName"] as? String
        self.password = form["Password"] as? String
    }
    
}
