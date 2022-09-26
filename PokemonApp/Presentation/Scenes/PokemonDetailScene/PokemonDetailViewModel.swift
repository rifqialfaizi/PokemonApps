//
//  HomeViewModel.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 23/09/22.
//

import UIKit
import CoreData

class PokemonDetailViewModel {
    
    let pokemon: PokemonDetails
    var pokemons:[PokemonEntity]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init(pokemon: PokemonDetails) {
        self.pokemon = pokemon
    }
    
    func saveData(nickName: String) {
        let entity = PokemonEntity(context: context)
        entity.nickname = nickName
        entity.name = pokemon.name
        entity.image = pokemon.sprites.other.officialArtwork.frontDefault
        
        do { try self.context.save() }
        catch { print(error) }
    }
    

    

    
}
