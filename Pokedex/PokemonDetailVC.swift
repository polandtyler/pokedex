//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by A664291 on 5/3/17.
//  Copyright © 2017 Tyler Poland. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var pokemonTitleLbl: UILabel!
    @IBOutlet weak var descriptionTextLbl: UILabel!
    @IBOutlet weak var pokedexID: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoimg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTitleLbl.text = pokemon.name.capitalized
        pokedexID.text = String(pokemon.pokedexID)
        
        let image = UIImage(named: "\(pokemon.pokedexID)")
        mainImg.image = image
        
        pokemon.downloadPokemonDetail{
            // Whatever we write here will only be called after the network call is complete.
            self.updateUI()
        }
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionTextLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
        
        
        
    }
}
