//
//  ServiceProvider.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation
final class ServiceProvider {
    
    private static let gFileService = FileService()
    private static let gApiService = ApiService()
    
    static var gApiShared : Service {
        get {
            if (AppConfig.mApiSource == AppConfig.ApiSource.LOCAL) {
                return gFileService
            } else {
                return gApiService
            }
        }
    }
}
