//
//  HomeViewController.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 23/09/22.
//

import UIKit
import Alamofire

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var pokeballButton: UIButton!
    

    var myPokemon:[PokemonEntity]?
    var viewModel: PokemonDetailViewModel!
    
    override func viewDidAppear(_ animated: Bool) {
        updateView()
    }
    
    func updateView() {
        image.setImage(from: viewModel.pokemon.sprites.other.officialArtwork.frontDefault)
        nameLabel.text = viewModel.pokemon.name.capitalized
        heightLabel.text = "\(viewModel.pokemon.height) Inch"
        weightLabel.text = "\(viewModel.pokemon.weight) Kg"
        abilitiesLabel.text = viewModel.pokemon.abilities.map({$0.ability.name}).joined(separator: ", ")
    }
    
    @IBAction func pokeballTapped(_ sender: Any) {
        let result = arc4random_uniform(2)
        
        if result == 1 {
            let alert = UIAlertController(title: "Yeay you got this Pokémon", message: "insert nickname", preferredStyle: .alert)
            alert.addTextField()
            
            let done = UIAlertAction(title: "Done", style: .default) { (action) in
                let textfield = alert.textFields!.first
                self.viewModel.saveData(nickName: textfield?.text ?? "No nickname")
            }
            
            alert.addAction(done)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in }))
            self.present(alert, animated: true, completion: nil)

        } else {
            let alert = UIAlertController(title: "Sorry, you can't catch the Pokémon", message: "you can try again later", preferredStyle: .alert)
            
            let okay = UIAlertAction(title: "Okay", style: .cancel) { _ in }
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
