//
//  ImageCollectionViewCell.swift
//  ProyectoDos
//
//  Created by Universidad Anahuac on 07/09/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadImage(url: String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!) {data, response, error in
            if let data = data {
                let image = UIImage.init(data: data)
                DispatchQueue.main.sync {
                    self.cellImage.image = image
                }
            }
        }
        task.resume()
    }

}
