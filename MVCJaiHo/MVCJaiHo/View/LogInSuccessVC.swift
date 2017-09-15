//
//  LogInSuccessVC.swift
//  MVCJaiHo
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//

import UIKit

//=============================================================//
//MARK: ViewController Class
//=============================================================//

class LogInSuccessVC: UIViewController {
    
//=============================================================//
//MARK: Stored Property of LogInSuccessVC
//=============================================================//
    
    // Model's Object
    var obPerson:Person!
    
//=============================================================//
//MARK: @IBOutlets of LogInSuccessVC
//=============================================================//
    
    @IBOutlet weak var userNameShow: UILabel!
    @IBOutlet weak var passwordShow: UILabel!
    
//=============================================================//
//MARK: viewDidLoad() method of LogInSuccessVC
//=============================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "LogIn Succes"
        
        // Showing data that Model contains
        self.userNameShow.text = obPerson.userName
        self.passwordShow.text = obPerson.password
        
    }

}
