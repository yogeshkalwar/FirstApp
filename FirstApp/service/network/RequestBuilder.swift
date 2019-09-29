//
//  ApiFetcher.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation

struct ApiRequest {
    var mUrlRequest: URLRequest?
    var mSession: URLSession?
    
    func process(completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        let task = URLSession.shared.dataTask(with: mUrlRequest!) { (data, response, error) in
            if let error = error {
                completion(.failure(.network(string:"An error occured during request: "+error.localizedDescription)))
                return
            }
            if let data = data {
                completion(.success(data))
            }
        }
        return task;
    }
}

final class RequestBuilder {

    enum Method : String {
        case GET
        case POST
    }
    
    var mUrl: String?
    var mMethod = Method.GET
    var mUrlSessionConfig = URLSessionConfiguration.default
    var mCachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad
    
    func url(url: String) -> RequestBuilder {
        mUrl = url
        return self;
    }
    
    func method(method: Method) -> RequestBuilder {
        mMethod = method
        return self;
    }
    
    func sessionConfig(config: URLSessionConfiguration) -> RequestBuilder {
        mUrlSessionConfig = config
        return self
    }
    
    func cachePolicy(cachePolicy: NSURLRequest.CachePolicy) -> RequestBuilder {
        mCachePolicy = cachePolicy
        return self
    }
    
    func build() -> ApiRequest? {
        guard let url = URL(string: mUrl!) else {
            return nil
        }
        var apiRequest = ApiRequest(mUrlRequest: URLRequest(url: url), mSession: URLSession(configuration: mUrlSessionConfig))
        apiRequest.mUrlRequest?.httpMethod = mMethod.rawValue
        apiRequest.mUrlRequest?.cachePolicy = mCachePolicy
        return apiRequest
    }
}
