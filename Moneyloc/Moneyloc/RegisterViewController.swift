//
//  RegisterViewController.swift
//  Moneyloc
//
//  Created by Tonte Owuso on 7/7/18.
//  Copyright © 2018 Qodehub. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButtonClicked(_ sender: Any) {
       
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (authResult, error) in
            if (authResult != nil){
                navigateToPage(from:self,storyboardName: "Main", id: "mainTabBarControllerID")
            }
            else{
                self.errorLabel.text = error.debugDescription
                print(error.debugDescription)
            }
        }
        
//        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
//            if let user = user{
//                navigateToPage(from:self,storyboardName: "Main", id: "mainTabBarControllerID")
//            }
//            else{
//
//            }
//        }
        
        
        
    }

}
