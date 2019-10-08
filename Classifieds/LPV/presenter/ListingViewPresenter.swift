//
//  ListingViewPresenter.swift
//  Classifieds
//
//  Created by Rizwan Saleem on 10/7/19.
//  Copyright © 2019 Rizwan Saleem. All rights reserved.
//

import Foundation

class ListingPresenter: ListingViewToListingPresenterProtocol {
    
    var view: ListingPresenterToListingViewProtocol?
    var router: ListingPresenterToListingRouterProtocol?
    var interector: ListingPresenterToListingInteractorProtocol?
    
    func fetchData() {
        // Ask to fetch data
        interector?.fetchRemoteData()
    }
}

extension ListingPresenter: ListingInteractorToListingPresenterProtocol {
    func success(listing: Listing) {
        // Back to view controller to diaplay data
        view?.showListing(listing: listing)
    }
    
    func failure(error: String) {
        // Back to view controller to diaplay error
        view?.showError(error: error)
    }
}
