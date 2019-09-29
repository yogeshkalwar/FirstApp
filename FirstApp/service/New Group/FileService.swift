//
//  FileService.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation

final class FileService : Service {
    static let RESOURCE_TYPE : String = "json"
    
    func fetchConverter(_ base: String, completion: @escaping ((Result<CurrencyConverter, ErrorResult>) -> Void)) {
        guard let data = FileManager.readJson(forResource: "response", forClass: FileService.self) else {
            completion(Result.failure(ErrorResult.custom(string: "No file or data found")))
            return
        }
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func cancel() {
        //Do nothing
    }
}

extension FileManager {
    
    static func readJson(forResource filename: String, forClass : AnyClass) -> Data? {
        
        let bundle = Bundle(for: forClass)
        if let path = bundle.path(forResource: filename, ofType: FileService.RESOURCE_TYPE) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data;
            } catch {
                //TODO : handle error
            }
        }
        return nil
    }
}
