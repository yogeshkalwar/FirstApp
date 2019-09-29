//
//  CurrencyViewModel.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation

struct CurrencyViewModel : ViewModel {
    
    weak var mDataSource: DataSource<CurrencyRate>?
    weak var mService: Service?
    
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    init(service: Service = ServiceProvider.gApiShared, dataSource: DataSource<CurrencyRate>?) {
        mDataSource = dataSource
        mService = service
    }
    
    func fetchCurrencies() {
        guard let service = mService else {
            onErrorHandling?(ErrorResult.custom(string:"Missing service"))
            return
        }
        service.fetchConverter(Currency.GBP.rawValue){ result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter):
                    self.mDataSource?.mData.mValue = converter.mRates
                    break;
                case .failure(let error):
                    self.onErrorHandling?(error)
                }
            }
        }
    }
}
