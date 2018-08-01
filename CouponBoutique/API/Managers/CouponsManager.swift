//
//  adsaccounts.swift
//  boblyoutline
//
//  Created by Mac on 18/7/18.
//  Copyright © 2018 Avalogics. All rights reserved.
//

import Foundation


import Foundation
class CouponsManager: APIManager {
    
    
    /// Home detail.
    ///
    ///
    ///     - completionHandler: Callback with Event value
    
    func getCoupons(completionHandler handler: @escaping ([Coupon]?) -> Void) {

        let getCouponsEndpoint = "\(Endpoints.SAMPLE)"

        request(endpoint: getCouponsEndpoint, completionHandler: handler, method: .get)
    }

    
    
}
