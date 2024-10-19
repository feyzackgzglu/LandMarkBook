//
//  DetailsVC.swift
//  LandMarkBook
//
//  Created by Feyza on 19.10.2024.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landMarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedLandmarkImage
        landMarkLabel.text = selectedLandmarkName
    }

}
