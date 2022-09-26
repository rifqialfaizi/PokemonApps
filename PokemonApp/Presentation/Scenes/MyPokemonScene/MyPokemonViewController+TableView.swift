//
//  MyPokemonViewController+TableView.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 26/09/22.
//

import Foundation
import UIKit

extension MyPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemons.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: MyPokemonTableViewCell.reuseIdentifier,
                for: indexPath) as? MyPokemonTableViewCell,
            let pokemon = viewModel.getPokemon(index: indexPath.row)
        else { return UITableViewCell() }
        
        cell.updateView(pokemon: pokemon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Remove Pokemon") { _,_,_ in
            if self.viewModel.removePokemon(index: indexPath.row) {
                self.viewModel.pokemons.value?.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    
    
    
    
}
