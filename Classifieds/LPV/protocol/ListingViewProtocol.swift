//
//  ListingViewProtocol.swift
//  Classifieds
//
//  Created by Rizwan Saleem on 10/7/19.
//  Copyright © 2019 Rizwan Saleem. All rights reserved.
//

import Foundation
import UIKit

protocol ListingViewToListingPresenterProtocol: class {
    var view: ListingPresenterToListingViewProtocol? {get set};
    var interector: ListingPresenterToListingInteractorProtocol? {get set};
    var router: ListingPresenterToListingRouterProtocol? {get set}
    func fetchData()
}

protocol ListingPresenterToListingViewProtocol: class {
    var presenter: ListingViewToListingPresenterProtocol? {get set}
    func showListing(listing: Listing)
    func showError(error: String)
}

protocol ListingInteractorToListingPresenterProtocol: class {
    func success(listing: Listing)
    func failure(error: String)
}

protocol ListingPresenterToListingInteractorProtocol: class {
    var presenter: ListingInteractorToListingPresenterProtocol? {get set}
    func fetchRemoteData()
}

protocol ListingPresenterToListingRouterProtocol: class {
    static func getListingVC() -> UIViewController;
}
