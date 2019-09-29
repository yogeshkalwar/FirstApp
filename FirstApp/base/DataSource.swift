//
//  DataSource.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 28/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation
class DataSource<T> : NSObject {
    var mData: DynamicValue<[T]> = DynamicValue([])
}
