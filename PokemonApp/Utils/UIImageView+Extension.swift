//
//  UIImageView+Extension.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 23/09/25.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setImageWithPlaceholder(from url: String, contentMode mode: ContentMode = .scaleAspectFit) {
        let url = URL(string: url)
        kf.setImage(with: url, placeholder: UIImage(named: "pokeball"))
    }
    
    func setImage(from url: String, contentMode mode: ContentMode = .scaleAspectFit) {
        let url = URL(string: url)
        kf.setImage(with: url)
    }
    
}
