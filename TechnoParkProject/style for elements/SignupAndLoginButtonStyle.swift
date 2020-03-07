//
//  SignupAndLoginButtonStyle.swift
//  TechnoParkProject
//
//  Created by Роман Ковайкин on 07.03.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit

class SignupAndLoginButtonStyle: UIButton {

    override func awakeFromNib() {
        self.backgroundColor = UIColor(displayP3Red: 152/255, green: 225/255, blue: 1, alpha: 1)
        self.layer.cornerRadius = 40
    }
}
