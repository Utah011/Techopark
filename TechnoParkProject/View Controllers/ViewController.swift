//
//  ViewController.swift
//  TechnoParkProject
//
//  Created by Роман Ковайкин on 02.03.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func authenUserConfigureView(){
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                 let nav = UINavigationController(rootViewController: LogInViewController())
                nav.navigationBar.barStyle = .black
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
}

