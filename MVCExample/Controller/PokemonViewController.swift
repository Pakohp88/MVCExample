//
//  PokemonViewController.swift
//  MVCExample
//
//  Created by Francisco Hernandez on 27/08/22.
//

import UIKit

class PokemonViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private var pokemons : [Pokemon] = []
    let manager = PokemonDataManager()
    @IBOutlet var PokemonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.fetch()
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.pokemonCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath) as! PokeCell
        let pokemon = manager.pokemonAtIndex(index: indexPath.row)
        cell.imageView.image = UIImage.init(named: pokemon.image)
        cell.label.text = pokemon.name
        return cell;
    }
}
