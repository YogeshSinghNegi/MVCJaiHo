//
//  ViewController.swift
//  MVCJaiHo
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//

import UIKit
import SVProgressHUD

//=============================================================//
//MARK: ViewController Class
//=============================================================//

class ViewController: UIViewController {
    
//=============================================================//
//MARK: Stored Property of ViewController
//=============================================================//
    
    // Will Hold Model Data after API Hit is success
    var obPerson:Person!
    
//=============================================================//
//MARK: @IBOutlets of ViewController
//=============================================================//
    
    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
//=============================================================//
//MARK: viewDidLoad() method of ViewController
//=============================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stopLoader()
        self.navigationItem.title = "Welcome"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Empting the TextFileds
        self.passwordTextfield.text = ""
        self.userNameTextfield.text = ""
    }
    
//=============================================================//
//MARK: @IBAction for submit button of ViewController
//=============================================================//
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        
        // Starts my Loader
        self.startLoader()
        
        // calls the getData method of my class
        self.getData()
        
        // Giving some delay because data from url takes some time
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
        
            // Moving from current VC to LogInSuccessVC
            guard let obLogInSuccessVC = self.storyboard?.instantiateViewController(withIdentifier: "LogInSuccessVC_ID") as? LogInSuccessVC else { fatalError("LogInSuccessVC not initialized") }
            obLogInSuccessVC.obPerson = self.obPerson
            self.navigationController?.pushViewController(obLogInSuccessVC, animated: true)
            
            self.stopLoader()
        
        }
    }
    
//=============================================================//
//MARK: getData() method
//=============================================================//

    func getData() {
        
        // Instantiating APIController to call its method
        let obAPI = APIController()
        
        // dataDictionary holds the data entered by the user
        let dataDictionary = ["userName":self.userNameTextfield.text!,"password": self.passwordTextfield.text!]
        
        // Calling logInWith() method with escaping closure
        obAPI.logInWith(dataDictionary: dataDictionary, completion: {(obPerson:Person) -> () in
            self.obPerson = obPerson
        })
    }
    
//=============================================================//
//MARK: Start and Stop myLoader methods
//=============================================================//
    
    func startLoader() {
        // Calling third party loader to show with the status
        SVProgressHUD.show(withStatus: "Please Wait...")
    }
    
    func stopLoader() {
        // Dismissing third party loader
        SVProgressHUD.dismiss()
    }

}

