//
//  HeroeTableViewCell.swift
//  Avengers
//
//  Created by Mikel Cobian on 7/12/21.
//

import UIKit

class HeroeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView?
    @IBOutlet weak var imageCell: UIImageView?
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCell?.layer.cornerRadius = 4.0
        viewCell?.layer.shadowColor = UIColor.black.cgColor
        viewCell?.layer.shadowOffset = CGSize.zero
        viewCell?.layer.shadowOpacity = 0.6
        viewCell?.layer.shadowRadius = 4.0
        
        imageCell?.layer.cornerRadius = 4.0
        imageCell?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageCell?.image = nil
        title?.text = nil
        descriptionLabel?.text = nil
    }
    
    func configureViews(image: String? = nil, title: String? = nil, description: String? = nil){
        
        self.imageCell?.image = UIImage(named: image ?? "")
        self.title?.text = title
        self.descriptionLabel?.text = description
 
    }
    
}
