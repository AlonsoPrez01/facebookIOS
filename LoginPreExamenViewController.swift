//
//  LoginPreExamenViewController.swift
//  ProyectoDos
//
//  Created by Universidad Anahuac on 12/09/22.
//

import UIKit

class LoginPreExamenViewController: UIViewController {
    
    let colorTop = UIColor.init(_colorLiteralRed: 49/255, green: 128/265, blue: 229/255, alpha: 1).cgColor
    let colorBottom = UIColor.init(_colorLiteralRed: 86/255, green: 77/255, blue: 194/255, alpha: 1).cgColor

    @IBOutlet weak var topView: UIView!
    let gradient = CAGradientLayer()
    
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var containerLogInView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gradient.colors = [colorTop, colorBottom]
        gradient.frame = topView.bounds
        gradient.shouldRasterize = true
        topView.layer.addSublayer(gradient)
        
        containerLogInView.layer.shadowColor = UIColor.black.cgColor
        containerLogInView.layer.shadowOpacity = 0.1
        containerLogInView.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        containerLogInView.layer.shadowRadius = 2
        containerLogInView.layer.cornerRadius = 16
        
        topView.bringSubviewToFront(homeImageView)
        homeImageView.image = homeImageView.image?.withRenderingMode(.alwaysTemplate)
        homeImageView.tintColor = UIColor.white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
