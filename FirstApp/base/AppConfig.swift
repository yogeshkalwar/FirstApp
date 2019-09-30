//
//  AppConfig.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation

struct AppConfig {
    enum ApiSource  {
        case LOCAL
        case NETWORK
    }
    
    static let mApiSource = ApiSource.LOCAL
}
