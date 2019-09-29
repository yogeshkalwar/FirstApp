//
//  Result.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation

enum Result<T, E : Error> {
    case success(T)
    case failure(E)
}
