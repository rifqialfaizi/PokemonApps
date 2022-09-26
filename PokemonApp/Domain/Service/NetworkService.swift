//
//  NetworkService.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 23/09/22.
//

import Foundation
import Alamofire
import MapKit

class NetworkService {
    
    static let shared = NetworkService()
    
    private let BASE_URL = "https://pokeapi.co/api/v2/"
    
    private var defaultParameters = ["":""]
    
    func fetchPokemon(offset: Int, completion: @escaping ((Result<PokemonResponse, Error>) -> ())) {
        defaultParameters["limit"] = "20"
        defaultParameters["offset"] = "\(offset)"
        let url = "\(BASE_URL)pokemon"
        AF.request(url, method: .get, parameters: defaultParameters).responseDecodable(of: PokemonResponse.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
                print("fetch success")
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchPokemonDetails(url: String, completion: @escaping ((Result<PokemonDetails, Error>) -> ())) {
        AF.request(url, method: .get).responseDecodable(of: PokemonDetails.self) { response in
            switch response.result {
            case .success(let value):
                completion( .success(value))
                print("Fetch Pokemon Detail Success")
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}

