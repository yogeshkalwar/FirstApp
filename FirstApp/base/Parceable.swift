//
//  Parceable.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation
protocol Parceable {
    static func parseObject(dictionary: [String: AnyObject]) -> Result<Self, ErrorResult>
}
