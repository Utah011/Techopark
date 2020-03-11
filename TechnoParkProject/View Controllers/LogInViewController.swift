//
//  LogInViewController.swift
//  TechnoParkProject
//
//  Created by Роман Ковайкин on 06.03.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    //MARK: Variables
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if traitCollection.userInterfaceStyle == .light{
            logoImageView.image = UIImage(named: "logoForWhiteTheme")
        }else{
            logoImageView.image = UIImage(named: "logoForDarkTheme")
        }
    }
    
    func loginUser(email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error{
                return
            }
        }
    }
    
    //MARK: Methods
    @IBAction func logInButtonPushed(_ sender: Any) {
        guard let email = self.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let password = self.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        
        loginUser(email: email, password: password)
    }
    

}
