//
//  HomeCollectionViewCell.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 23/09/22.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {

    static var reuseIdentifier = "homeCell"
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var pokemonBgView: UIView!
    
    override func prepareForReuse() {
        self.pokemonImage.image = UIImage()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.pokemonImage.layer.cornerRadius = 10
        self.pokemonBgView.layer.cornerRadius = 10
    }
    
    func updateView(pokemon: PokemonDetails?) {
        guard let pokemon = pokemon else { return }
        pokemonLabel.text = pokemon.name.capitalized
        pokemonImage.setImageWithPlaceholder(from: pokemon.sprites.other.officialArtwork.frontDefault)
    }

    
}
