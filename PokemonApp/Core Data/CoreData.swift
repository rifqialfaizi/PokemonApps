//
//  CoreData.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 25/09/22.
//

import UIKit
import CoreData


class CoreData {
    
    static let sharedInstance = CoreData()
    private init () {}
    
    private let continer: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    private let fetchRequest = NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    
    func savePokemon(pokemon:[Pokemon]) {
        
        self.continer?.performBackgroundTask { [weak self] (context) in
            self?.deleteObjectsFromCoreData(context: context)
            self?.saveDataToCoreData(pokemon: pokemon, context: context)
        }
    }
    
    private func deleteObjectsFromCoreData(context: NSManagedObjectContext) {
        do {
            let objects = try context.fetch(fetchRequest)
            _ = objects.map({context.delete($0)})
            try context.save()
        } catch {
            print("Deleting Error: \(error)")
        }
    }
    
    private func saveDataToCoreData(pokemon:[Pokemon], context: NSManagedObjectContext) {
        
        context.perform {
            for pokemon in pokemon {
                let pokemonEntity = PokemonEntity(context: context)
                pokemonEntity.name = pokemon.name
            }
            
            do {
                try context.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
    }
}

