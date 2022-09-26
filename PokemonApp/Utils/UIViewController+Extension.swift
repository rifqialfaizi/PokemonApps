//
//  UIViewController+Extension.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 25/09/22.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in }))
        self.present(alertController, animated: true, completion: nil)
    }
    
}

