//
//  ViewController.swift
//  SocialAppWithFirebase
//
//  Created by Mairaj khoso on 9/12/18.
//  Copyright © 2018 Mairaj khoso. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButton(_ sender: Any) {
        let email = emailField.text
        let password = passwordField.text
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            if error != nil
            {
                print("error : \(String(describing: error?.localizedDescription))")
            }
            else
            {
                self.performSegue(withIdentifier: "logged", sender: self)
            }
            
            
            }
        
        
    }
    
}

