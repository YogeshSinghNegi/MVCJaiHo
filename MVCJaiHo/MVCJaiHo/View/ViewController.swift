//
//  ViewController.swift
//  MVCJaiHo
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//

import UIKit

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
    
    @IBOutlet weak var myLoader: UIActivityIndicatorView!
    
//=============================================================//
//MARK: viewDidLoad() method of ViewController
//=============================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.stopLoader()
        // Do any additional setup after loading the view, typically from a nib.
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
        
        // calling logInWith() method with escaping closure
        obAPI.logInWith(userName: self.userNameTextfield.text!,password: self.passwordTextfield.text!, completion: {(obPerson:Person) -> () in
            self.obPerson = obPerson
        })
    }
    
//=============================================================//
//MARK: Start and Stop myLoader methods
//=============================================================//
    
    func startLoader() {
        self.myLoader.startAnimating()
        self.myLoader.isHidden = false
    }
    
    func stopLoader() {
        self.myLoader.stopAnimating()
        self.myLoader.isHidden = true
    }

}

