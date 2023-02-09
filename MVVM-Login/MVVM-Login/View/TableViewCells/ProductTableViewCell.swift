//
//  ProductTableViewCell.swift
//  MVVM-Login
//
//  Created by Dhanush S on 07/02/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var offerPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
