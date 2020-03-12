//
//  styleForTextFields.swift
//  TechnoParkProject
//
//  Created by Роман Ковайкин on 07.03.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit

class styleForTextFields: UITextField {

    
    override func awakeFromNib() {
        self.layer.cornerRadius = 20
        
        self.layer.borderWidth = 2
        self.layer.borderColor = CGColor(srgbRed: 160/255, green: 160/255, blue: 1, alpha: 1)
        self.borderStyle = .none
    }
}
