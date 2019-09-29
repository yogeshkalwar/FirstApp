//
//  DynamicValue.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 28/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation
class DynamicValue<T> {
    typealias CompletionHandler = ((T) -> Void)
    var mValue : T {
        didSet {
            self.notify()
        }
    }
    private var mObservers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.mValue = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        mObservers[observer.description] = completionHandler
    }
    
    public func addObserverAndNotify(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        mObservers.forEach({ $0.value(mValue)})
    }
    
    deinit {
        mObservers.removeAll()
    }
}
