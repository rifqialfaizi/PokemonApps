//
//  PokemonModel.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 23/09/22.
//

import Foundation

// MARK: - PokemonResponse
struct PokemonResponse: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

// MARK: - Result
struct Pokemon: Codable {
    let name: String
    let url: String
}

// MARK: - PokemonDetails
struct PokemonDetails: Codable {
    let name: String
    let sprites: Sprites
    let types: [TypeElement]
    let abilities: [Abilities]
    let height: Int
    let weight: Int
}

// MARK: - MyPokemon
struct MyPokemon: Codable {
    let name: String
    let nickname: String
    let image: String
}

// MARK: - Sprites
struct Sprites: Codable {
    let frontDefault: String
    let other: Other

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case other
    }
}

// MARK: - Abilities
struct Abilities: Codable {
    let ability: Ability
}

struct Ability: Codable {
    let name: String
}

// MARK: - Other
struct Other: Codable {
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

// MARK: - DreamWorld
struct OfficialArtwork: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: TypeType
}

// MARK: - TypeType
struct TypeType: Codable {
    let name: String
    let url: String
}
