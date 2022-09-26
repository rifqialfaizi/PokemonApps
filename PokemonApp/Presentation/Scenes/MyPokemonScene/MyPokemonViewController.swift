//
//  MyPokemonViewController.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 26/09/22.
//

import UIKit

class MyPokemonViewController: UIViewController {

    @IBOutlet weak var myPokemonTableView: UITableView!
    
    var viewModel: MyPokemonViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        bindViewModel()
    }
    
    private func setupTableView() {
        myPokemonTableView.dataSource = self
        myPokemonTableView.delegate = self
        myPokemonTableView.register(
        UINib(
            nibName: "MyPokemonTableViewCell",
            bundle: nil
        ), forCellReuseIdentifier: MyPokemonTableViewCell.reuseIdentifier)
    }
    
    private func bindViewModel() {
        DispatchQueue.main.async {
            self.myPokemonTableView.reloadData()
        }
        
        viewModel.fetchPokemon()
    }

}
