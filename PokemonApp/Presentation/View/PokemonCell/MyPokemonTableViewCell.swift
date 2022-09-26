//
//  MyPokemonTableViewCell.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 26/09/22.
//

import UIKit

class MyPokemonTableViewCell: UITableViewCell {

    static var reuseIdentifier = "myPokemonCell"
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateView(pokemon: PokemonEntity?) {
        guard
            let pokemon = pokemon,
            let name = pokemon.name,
            let nickname = pokemon.nickname,
            let image = pokemon.image
        else { return }
        
        nicknameLabel.text = nickname
        nameLabel.text = name.capitalized
        pokemonImage.setImageWithPlaceholder(from: image)
    }
    
}
