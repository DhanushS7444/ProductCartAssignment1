//
//  DetailProductViewController.swift
//  MVVM-Login
//
//  Created by Dhanush S on 08/02/23.
//

import UIKit

class DetailProductViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var offerPrice: UILabel!
    @IBOutlet weak var actualPrice: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    
    var image = UIImage()
    var nameProduct: String?
    var priceoffer : String?
    var priceActual : String?
    var descProduct: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offerPrice.text = priceoffer
        productName.text = nameProduct
        imageView.image = image
        productDesc.text = descProduct
        actualPrice.text = "[\(priceActual!)]"
    }
    
}
