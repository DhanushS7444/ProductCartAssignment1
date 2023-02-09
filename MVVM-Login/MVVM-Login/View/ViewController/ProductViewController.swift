//
//  ProductViewController.swift
//  MVVM-Login
//
//  Created by Dhanush S on 07/02/23.
//

import UIKit

//MARK: ProductViewController
class ProductViewController: UIViewController {

    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet weak var sectionName: UILabel!
    @IBOutlet weak var profileView: ProfileView!
    
    let productViewModel : ProductViewModel = ProductViewModel()
    let imageViewModel : ImageViewModel = ImageViewModel()
    var profileViewModel : ProfileViewModel = ProfileViewModel()
    var profileTableData: ProfileResponse? = nil
    var productTableData: ProductResponse? = nil
    let profileViewDelegate = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewModel.delegateProfile = self
        self.tableViewList.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        self.tableViewList.delegate = self
        self.tableViewList.dataSource = self
        self.setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBAction func ProductProfileView(_ sender: UISegmentedControl) {
        // settingUp UI by changing segments
        self.setUpUI()
    }
}

extension ProductViewController {
    // Product API call
   private func prodcutAPI() {
        productViewModel.getProductData { productApiResponse in
            if (productApiResponse != nil) {
                self.productTableData = productApiResponse
                DispatchQueue.main.async {
                    self.tableViewList.reloadData()
                }
            }
        }
    }
    
    // Profile API call
    private func profileAPI() {
        profileViewModel.getProfileData { profileApiResponse in
            if (profileApiResponse != nil) {
                self.profileTableData = profileApiResponse
                DispatchQueue.main.async {
                    self.setUpProfileUI()
                }
            }
        }
    }
    
    // initial SetUp of Dashboard View
    private func setUpUI() {
        if segmentControl.selectedSegmentIndex == 1 {
            self.sectionName.text = "Profile"
            self.tableViewList.isHidden = true
            self.profileView.isHidden = false
            self.profileAPI()
        } else if segmentControl.selectedSegmentIndex == 0 {
            self.sectionName.text = "DashBoard"
            self.tableViewList.isHidden = false
            self.profileView.isHidden = true
            self.prodcutAPI()
        }
    }
    
    // initial SetUp of profile View
    private func setUpProfileUI() {
        guard let profileData = profileTableData else { return}
        self.profileView.userName.text = profileData.firstname!
        self.profileView.rewardPoints.text = profileData.pointsEarned!
        self.profileView.balance.text = profileData.walletBalance!
        self.profileView.address.text = profileData.address!
        self.profileView.dob.text = profileData.dob!
    }
    
}

//MARK: Extesnsion for UITableViewCell 
extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else {
           return UITableViewCell()
        }
        cell.ProductName.text = productTableData?.data?.products?[indexPath.row].productName
        cell.ProductDescription.text = productTableData?.data?.products?[indexPath.row].productDescription
        cell.price.text = (productTableData?.data?.products?[indexPath.row].price)
        cell.offerPrice.text = (productTableData?.data?.products?[indexPath.row].offerPrice)
        if let data = try? Data(contentsOf: URL(string: productTableData?.data?.products?[indexPath.row].productURL ?? "")!) {
                cell.ProductImage.image = UIImage(data: data)
        }
//        imageViewModel.getImageData(imageRequest: productTableData?.data?.products?[indexPath.row].productURL) { imageData in
//            cell.ProductImage.image = UIImage(data: (imageData?.imageData)!)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productTableData?.data?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailScene = storyboard?.instantiateViewController(withIdentifier: "DetailProductViewController") as? DetailProductViewController {
            detailScene.priceoffer = productTableData?.data?.products?[indexPath.row].offerPrice
            detailScene.nameProduct = productTableData?.data?.products?[indexPath.row].productName
            detailScene.priceActual = productTableData?.data?.products?[indexPath.row].price
            detailScene.descProduct = productTableData?.data?.products?[indexPath.row].productDescription
            if let data = try? Data(contentsOf: URL(string: productTableData?.data?.products?[indexPath.row].productURL ?? "")!) {
                detailScene.image = UIImage(data: data)!
            }
            self.navigationController?.pushViewController(detailScene, animated: true)
        }
    }
}

extension ProductViewController : ProfileModelDelegate {
    func loggOutButtonTappedAction() {
        if let loginScene = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            self.navigationController?.pushViewController(loginScene, animated: true)
        }
    }
}
