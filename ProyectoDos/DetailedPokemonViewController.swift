//
//  DetailedPokemonViewController.swift
//  ProyectoDos
//
//  Created by Universidad Anahuac on 31/08/22.
//

import UIKit

class DetailedPokemonViewController: UIViewController {
    
    var pokemons: Pokemon? = nil

    @IBOutlet weak var nombrePokemon: UILabel!
    //@IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    var imageList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //nombrePokemon.text = pokemons?.name
        imageList.append("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png")
        imageList.append("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/132.png")
        carouselCollectionView.dataSource = self
        carouselCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellImage")
        nombrePokemon.text = pokemons?.name
        loadPokemon()
    }
    
    func loadPokemon(){
        if let pokemon = pokemons {
            let task = URLSession.shared.dataTask(with: URL(string: pokemon.url)!) { data, response, error in
                //let pokemonDetail = try! JSONDecoder().decode(PokemonDetail.self, from: data!)
                //self.loadPokemonImage(urlImage: pokemonDetail.sprites.other.home.front_default)
            }
            task.resume()
        }
    }
    
    /*
    func loadPokemonImage(urlImage: String) {
        let task = URLSession.shared.dataTask(with: URL(string: urlImage)!) {data, response, error in
            if let data = data {
                let image = UIImage.init(data: data)
                DispatchQueue.main.sync {
                    self.pokemonImageView.image = image
                }
            }
        }
        task.resume()
    }*/

}

extension DetailedPokemonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellImage", for: indexPath) as?
        ImageCollectionViewCell
        if cell == nil {
            cell = ImageCollectionViewCell()
        }
        let url = imageList[indexPath.row]
        cell?.loadImage(url: url)
        return cell!
    }
    
    
}
