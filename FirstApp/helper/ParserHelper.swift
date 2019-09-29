//
//  ParserHelper.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation

class ParserHelper {
    
    static func parse<T: Parceable>(data: Data, completion: @escaping (Result<[T], ErrorResult>) -> Void) {
        do {
            if let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [AnyObject] {
                var finalResults : [T] = []
                for object in result {
                    if let dictionary = object as? [String : AnyObject] {
                        switch T.parseObject(dictionary: dictionary) {
                        case .failure(_):
                            continue
                        case .success(let newModel):
                            finalResults.append(newModel)
                            break
                        }
                    }
                }
                completion(.success(finalResults))
            } else {
                completion(.failure(.parser(string:"Json data is not array")))
            }
        } catch {
            completion(.failure(.parser(string: "Json data parsing error")))
        }
    }
    
    static func parse<T: Parceable>(data: Data, completion: @escaping (Result<T, ErrorResult>) -> Void) {
        do {
            if let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject] {
                switch T.parseObject(dictionary: result) {
                case .failure(let error):
                    completion(.failure(error))
                    break
                case .success(let newModel):
                    completion(.success(newModel))
                    break
                }
            } else {
                completion(.failure(.parser(string:"Json data is not object")))
            }
        } catch {
            completion(.failure(.parser(string: "Json data parsing error")))
        }
    }
}
