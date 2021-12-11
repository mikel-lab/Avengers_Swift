//
//  DetailViewController.swift
//  Avengers
//
//  Created by Mikel Cobian on 9/12/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var characterImage: UIImageView?
    @IBOutlet weak var characterName: UILabel?
    @IBOutlet weak var characterDescription: UILabel?
    @IBOutlet weak var characterSkills: UILabel?
    
    var heroe: Heroe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        characterImage?.image = UIImage(named: heroe?.image ?? "")
        characterName?.text = heroe?.name
        characterDescription?.text = heroe?.description
        characterSkills?.text = heroe?.poderes

    }
}
