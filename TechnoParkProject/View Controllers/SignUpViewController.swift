//
//  SignUpViewController.swift
//  TechnoParkProject
//
//  Created by Роман Ковайкин on 06.03.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    //MARK: Variables
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var mobilePhoneTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if traitCollection.userInterfaceStyle == .light{
            logoImageView.image = UIImage(named: "logoForWhiteTheme")
        }else{
            logoImageView.image = UIImage(named: "logoForDarkTheme")
        }
    }
    

    //MARK: Methods
    func createUser(withEmail email: String, password:String, name:String, number:String){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error{
                return
            }
            
            guard let uid = result?.user.uid else {return}
            
            let values = ["Name": name, "Email": email, "Number":number]
            Database.database().reference().child("users").child(uid).updateChildValues(values) { (error, ref) in
               if let error = error{
                    print("Failed to update datavalues ", error.localizedDescription)
                    return
                }
            }
        }
    }
    
    @IBAction func signUpButtonPushed(_ sender: Any) {
        guard let name = self.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let email = self.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let password = self.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let confirmPassword = self.confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let number = self.mobilePhoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        var empty = 0
        if name.count == 0{
            self.nameTextField.layer.borderWidth = 2
            self.nameTextField.layer.borderColor = CGColor(srgbRed: 255/255, green: 0, blue: 0, alpha: 1)
            empty += 1
        }
        if email.count == 0{
            self.emailTextField.layer.borderWidth = 2
            self.emailTextField.layer.borderColor = CGColor(srgbRed: 255/255, green: 0, blue: 0, alpha: 1)
            empty += 1
        }
        if password.count == 0{
            self.passwordTextField.layer.borderWidth = 2
            self.passwordTextField.layer.borderColor = CGColor(srgbRed: 1, green: 0, blue: 0, alpha: 1)
            empty += 1
        }
        if confirmPassword.count == 0{
            self.confirmPasswordTextField.layer.borderWidth = 2
            self.confirmPasswordTextField.layer.borderColor = CGColor(srgbRed: 1, green: 0, blue: 0, alpha: 1)
            empty += 1
        }
        if number.count == 0{
            self.mobilePhoneTextField.layer.borderWidth = 2
            self.mobilePhoneTextField.layer.borderColor = CGColor(srgbRed: 1, green: 0, blue: 0, alpha: 1)
            empty += 1
        }
        
        if password != confirmPassword && empty != 0{
            self.confirmPasswordTextField.layer.borderWidth = 1
            self.confirmPasswordTextField.layer.borderColor = CGColor(srgbRed: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }else{
            createUser(withEmail: email, password: password, name: name, number: number)
        }
    }
}
