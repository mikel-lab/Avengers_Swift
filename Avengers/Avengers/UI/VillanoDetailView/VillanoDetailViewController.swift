//
//  VillanoDetailViewController.swift
//  Avengers
//
//  Created by Mikel Cobian on 30/1/22.
//

import UIKit

class VillanoViewController: UIViewController {
    
    @IBOutlet var villanoImage: UIImageView?
    @IBOutlet var villanoName: UILabel?
    @IBOutlet var villanoDescription: UILabel?
    @IBOutlet var villanoSkills: UILabel?
    
    
    var villano: Villano?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        villanoImage?.image = UIImage(named: villano?.image ?? "")
        villanoName?.text = villano?.name
        villanoDescription?.text = villano?.description
        villanoSkills?.text = villano?.poderes

    }
    
    
    
    
}
