//
//  UIImageExt.swift
//  New_Challenge
//
//  Created by Saad Saissi Hassani on 4/6/2023.
//

import UIKit


extension UIImageView {
    
    func imageStyle(isCircle : Bool = false,isWithBorder : Bool = false,borderColor : UIColor,cornerRadius : CGFloat, borderWidth: CGFloat) {
        
        self.layer.cornerRadius = isCircle ? self.frame.height / 2 : cornerRadius
        
        if isWithBorder {
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
