//
//  ViewController.swift
//  Classifieds
//
//  Created by Rizwan Saleem on 10/7/19.
//  Copyright © 2019 Rizwan Saleem. All rights reserved.
//

import UIKit
import ObjectMapper

class ListingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,  ListingPresenterToListingViewProtocol {
    
    let TABLEVIEW_CELL_HEIGHT: CGFloat = 310.0
    
    var presenter: ListingViewToListingPresenterProtocol?
    var adListing: Listing?

    var alert: UIAlertController?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var adsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        adListing = Listing()
        
        showActivityIndicator()
        presenter?.fetchData()
    }
    
// MARK: Delegate methods
    func showListing(listing: Listing) {
        hideActivityIndicator()
        self.adListing = listing
        adsTableView.reloadData()
    }
    
    func showError(error: String) {
        hideActivityIndicator()
        showErrorInDialog(error: error)
    }
    
//MARK: Tableview delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TABLEVIEW_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let count = adListing?.result?.count {
            return count
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listingViewCell", for: indexPath) as? ListingViewCell
        cell?.setValues(item: (adListing?.result?[indexPath.row])!)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var viewController: UIViewController = UIViewController();
        viewController = (self.storyboard?.instantiateViewController(withIdentifier: "detailViewController"))!
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
// MARK: UI Helper methods
    func showActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    func showErrorInDialog(error: String) {
        alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        alert?.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")
              
              default:
                print("default")
                
                  
            }}))
        self.present(alert!, animated: true, completion: nil)
    }
}

