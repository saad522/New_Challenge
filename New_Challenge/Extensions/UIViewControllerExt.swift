//
//  UIViewControllerExt.swift
//  New_Challenge
//
//  Created by Saad Saissi Hassani on 4/6/2023.
//

import UIKit

extension UIViewController {
    func showAlert(withTitle title: String, withMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
