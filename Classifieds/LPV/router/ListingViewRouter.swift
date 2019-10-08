//
//  ListingViewRouter.swift
//  Classifieds
//
//  Created by Rizwan Saleem on 10/7/19.
//  Copyright © 2019 Rizwan Saleem. All rights reserved.
//

import Foundation
import UIKit

class ListingRouter: ListingPresenterToListingRouterProtocol {
    static func getListingVC() -> UIViewController {
        guard let viewController = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(identifier: "ListingViewController") as? ListingViewController else {
            print("Cannot create view controller")
            return UIViewController()
        }
        
        let presenter: ListingViewToListingPresenterProtocol & ListingInteractorToListingPresenterProtocol = ListingPresenter()
        let interactor: ListingPresenterToListingInteractorProtocol = ListingInteractor()
        let router = ListingRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        
        presenter.interector = interactor
        interactor.presenter = presenter
        
        presenter.router = router
        
        return viewController
    }
    
    
}
