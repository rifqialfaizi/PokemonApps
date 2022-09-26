//
//  MyPokemonViewModel.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 25/09/22.
//

import Foundation
import UIKit
import CoreData

class MyPokemonViewModel {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var pokemons = Bindable<[PokemonEntity]>()
    
    func fetchPokemon() {
        do {
            let pokemons = try context.fetch(PokemonEntity.fetchRequest())
            self.pokemons.value = pokemons
        }
        catch{
            print("error in fetch")
        }
    }
    
    func getPokemon(index: Int) -> PokemonEntity? {
        guard
            let pokemons = pokemons.value,
            index < pokemons.count
        else { return nil }
        return pokemons[index]
    }
    
    func removePokemon(index: Int) -> Bool {
        guard
            let pokemon = getPokemon(index: index)
        else { return false }
        
        context.delete(pokemon)
        
        do {
            try context.save()
        }
        catch { return false }
        return true
    }
    
}
