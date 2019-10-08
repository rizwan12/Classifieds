//
//  ListingViewInteractor.swift
//  Classifieds
//
//  Created by Rizwan Saleem on 10/7/19.
//  Copyright © 2019 Rizwan Saleem. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class ListingInteractor: ListingPresenterToListingInteractorProtocol {
    var presenter: ListingInteractorToListingPresenterProtocol?
    let URL = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
    
    func fetchRemoteData() {
        Alamofire.request(URL).validate().responseJSON { response in
            
            if response.result.isSuccess {
                if let listing = Mapper<Listing>().map(JSONObject: response.result.value) {
                    self.presenter?.success(listing: listing)
                } else {
                    // Return proper error message
                    self.presenter?.failure(error: "Error occured")
                }
            } else {
                self.presenter?.failure(error: "No Response")
            }
        }
    }
}
