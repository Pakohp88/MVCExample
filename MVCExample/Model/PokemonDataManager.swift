//
//  PokemonDataManager.swift
//  MVCExample
//
//  Created by Francisco Hernandez on 27/08/22.
//

import Foundation

class PokemonDataManager{
    
    private func loadData() -> [[String:String]]{
        let decoder = PropertyListDecoder()
        if let path = Bundle.main.path(forResource: "pokemonList", ofType: "plist"),
           let pokemonData = FileManager.default.contents(atPath: path),
           let pokemons = try? decoder.decode([[String:String]].self, from: pokemonData){
            return pokemons;
        }
        return [[:]]
    }
    
    func fetch(){
        for pokemonInfo in loadData(){
            print(pokemonInfo)
        }
    }
}
