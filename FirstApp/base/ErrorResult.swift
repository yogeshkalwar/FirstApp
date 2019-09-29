//
//  ErrorResult.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation

enum ErrorResult : Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
