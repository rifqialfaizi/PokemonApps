//
//  HomeViewModel.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 23/09/22.
//

import Foundation
import CoreData
import UIKit
import Alamofire

class HomeViewModel {
    
    private var isLoading = false
    private var allPokemon = [PokemonDetails]()
    var pokemons = Bindable<[PokemonDetails]>()
    
    func loadData(shouldResetData: Bool) {
        if shouldResetData {
            if allPokemon.isEmpty {
                print("Pokemon is Empty")
            } else {
                allPokemon = []
                pokemons.value = []
            }
        }
        fetchPokemon()
    }
    
    func getPokemon(at index: Int) -> PokemonDetails? {
        guard let pokemon = pokemons.value?[index] else {
            return nil
        }
        return pokemon
    }
    
    private func fetchPokemon() {
        print("🐣 Fetching Pokemon")
        NetworkService.shared.fetchPokemon(offset: allPokemon.count) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let pokemonResult):
                self.populatePokemons(pokemons: pokemonResult.results)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func populatePokemons(pokemons: [Pokemon]) {
        let group = DispatchGroup()
        for pokemon in pokemons {
            group.enter()
            self.fetchPokemonDetails(pokemon: pokemon) { pokemon in
                if let data = pokemon { self.allPokemon.append(data) }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.pokemons.value = self.allPokemon
        }
    }
    
    private func fetchPokemonDetails(pokemon: Pokemon, completion: @escaping (PokemonDetails?) -> ()){
        print("Fetching on url: \(pokemon.url)")
        NetworkService.shared.fetchPokemonDetails(url: pokemon.url) { result in
            switch result {
            case .success(let details):
                print("Fetching succeed: \(pokemon.url)")
                completion(details)
            case .failure(let error):
                print("Fetching failure: \(pokemon.url)")
                print(error)
                completion(nil)
            }
        }
    }
    
}
