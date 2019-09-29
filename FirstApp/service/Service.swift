//
//  Service.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 28/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation
protocol Service : class {
    
    func fetchConverter(_ base: String, completion: @escaping ((Result<CurrencyConverter, ErrorResult>) -> Void))
    
    func cancel()
}
