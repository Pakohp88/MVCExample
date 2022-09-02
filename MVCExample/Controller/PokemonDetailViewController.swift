//
//  PokemonDetailViewController.swift
//  MVCExample
//
//  Created by Francisco Hernandez on 27/08/22.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet var viewImage1: UIImageView!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    var recivedPokemon : Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewImage1.image = UIImage.init(named: recivedPokemon!.image)
        label1.text = recivedPokemon!.name
        label2.text = "Ability: " + recivedPokemon!.ability
        label3.text = "Move: " + recivedPokemon!.move
        label4.text = "Weight " + recivedPokemon!.weight
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
