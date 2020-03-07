//
//  ButtonStyle.swift
//  TechnoParkProject
//
//  Created by Роман Ковайкин on 06.03.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit

class EnterButtonStyle: UIButton {

    var color = UIColor.black
       let touchDownAlpha:CGFloat = 0.3
       
       
       func setup(){
           backgroundColor = .clear
           layer.backgroundColor = color.cgColor
           
           layer.cornerRadius = 20.0
           clipsToBounds = true
       }
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
           if let backgroundColor = backgroundColor{
               color = backgroundColor
           }
           
           setup()
       }

}
