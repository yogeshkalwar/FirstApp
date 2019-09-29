//
//  RequestHandler.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation

class RequestHandler {
    
    func networkResult<T: Parceable>(completion: @escaping ((Result<[T], ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {
        return { dataResult in
            DispatchQueue.global(qos: .background).async(execute: {
                switch dataResult {
                case .success(let data):
                    ParserHelper.parse(data: data, completion: completion)
                    break
                case .failure(let error):
                    print("Network error \(error)")
                    completion(.failure(.network(string: "Network error "+error.localizedDescription)))
                    break
                }
            })
        }
    }
    
    func networkResult<T: Parceable>(completion: @escaping ((Result<T, ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {
            return { dataResult in
                DispatchQueue.global(qos: .background).async(execute: {
                    switch dataResult {
                    case .success(let data):
                        ParserHelper.parse(data: data, completion: completion)
                        break
                    case .failure(let error):
                        print("Network error \(error)")
                        completion(.failure(.network(string: "Network error "+error.localizedDescription)))
                        break
                    }
                })
            }
    }
}
