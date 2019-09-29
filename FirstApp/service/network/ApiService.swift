//
//  Service.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 28/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation
final class ApiService : RequestHandler, Service {
    
    let endPoint = "http://data.fixer.io/api/latest?access_key=e1e5faf187d358d023c89d66b57e1a90"
    var mTask : URLSessionTask?
    
    func fetchConverter(_ base: String, completion: @escaping ((Result<CurrencyConverter, ErrorResult>) -> Void)) {
        cancel()
        let apiRequest = RequestBuilder().url(url: endPoint)
            .method(method: .GET)
            .sessionConfig(config: .default)
            .cachePolicy(cachePolicy: .returnCacheDataElseLoad)
            .build()
        mTask = apiRequest!.process(completion: self.networkResult(completion: completion))
        mTask!.resume()
    }
    
    func cancel() {
        if  let task = mTask {
            task.cancel()
        }
        mTask = nil
    }
}
