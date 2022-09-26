//
//  HomeViewController+CollectionView.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 23/09/22.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemons.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier, for: indexPath) as?
                HomeCollectionViewCell,
            let pokemon = viewModel.getPokemon(at: indexPath.row)
        else {
            return UICollectionViewCell()
        }
        cell.updateView(pokemon: pokemon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("✅ Will Display for indexPath \(indexPath)")
        if indexPath.row == viewModel.pokemons.value!.count - 1 {
            viewModel.loadData(shouldResetData: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPokemonDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PokemonDetailViewController {
            guard
                let indexPath = homeCollectionView?.indexPathsForSelectedItems?.first,
                let pokemon = viewModel.getPokemon(at: indexPath.row)
            else { return }
            let viewModel = PokemonDetailViewModel(pokemon: pokemon)
            vc.viewModel = viewModel
        }
        
        if let vc = segue.destination as? MyPokemonViewController {
            let viewModel = MyPokemonViewModel()
            vc.viewModel = viewModel
        }
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let width: CGFloat = (homeCollectionView.frame.size.width - space) * 0.5
        let height: CGFloat = (homeCollectionView.frame.size.height - space) * 0.3
        return CGSize(width: width, height: height)
    }

}



