//
//  Bindable.swift
//  PokemonApp
//
//  Created by Rifqi Alfaizi on 23/09/22.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
    
}
