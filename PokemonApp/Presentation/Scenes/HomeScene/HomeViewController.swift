//
//  HomeViewController.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 23/09/22.
//

import UIKit
import Alamofire


class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var viewModel: HomeViewModel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel = HomeViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindViewModel()
    }
    
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        setupCollectionView()
         setupMyPokemonButton()
    }
    
    private func setupMyPokemonButton() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "pokeball"), for: .normal)
        button.addTarget(self, action: #selector(myPokemonButtonPressed), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 42).isActive = true
        button.heightAnchor.constraint(equalToConstant: 52).isActive = true
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
        
    }

    @objc func myPokemonButtonPressed() {
        navigateToMyPokemonScene()
    }
    
    func navigateToMyPokemonScene() {
        performSegue(withIdentifier: "showMyPokemon", sender: self)
    }
    
    private func setupCollectionView() {
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        homeCollectionView.register(
            UINib(
                nibName: "HomeCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        homeCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func bindViewModel() {
        viewModel.pokemons.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.homeCollectionView.reloadData()
            }
        }
        
        viewModel.loadData(shouldResetData: true)
    }
    
}
