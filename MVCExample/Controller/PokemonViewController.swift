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
    var selectedPokemon : Pokemon?
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPokemon = manager.pokemonAtIndex(index: indexPath.row)
        self.performSegue(withIdentifier: "PokemonDetailSeague", sender: self.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
        return header
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PokemonDetailViewController
        destination.recivedPokemon = selectedPokemon
    }
}
