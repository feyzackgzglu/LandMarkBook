//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Feyza on 17.10.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landMarkNames.append("Colosseum")
        landMarkNames.append("Great Wall")
        landMarkNames.append("Kremlin")
        landMarkNames.append("Stonhenge")
        landMarkNames.append("Taj Mahal")
        
        landMarkImages.append(UIImage(named: "colosseum.jpg")!)
        landMarkImages.append(UIImage(named: "greatwall.jpg")!)
        landMarkImages.append(UIImage(named: "kremlin.jpg")!)
        landMarkImages.append(UIImage(named: "stonhenge.jpg")!)
        landMarkImages.append(UIImage(named: "tajmahal.jpg")!)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  landMarkNames.count // Her bölümde 5 satır olacak
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // cell.textLabel?.text = "test" eski version ileride kaldırılacak !!
        var content = cell.defaultContentConfiguration()
        content.text = landMarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell                          // hücrelerde ne verisi olucak?
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landMarkNames[indexPath.row]
        chosenLandmarkImage = landMarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landMarkNames.remove(at: indexPath.row)
            self.landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
