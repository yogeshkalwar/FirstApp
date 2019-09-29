//
//  CurrencyConverter.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation

struct CurrencyConverter {
    
    let mBase : String
    let mDate : String
    
    let mRates : [CurrencyRate]
}

extension CurrencyConverter : Parceable {
    
    static func parseObject(dictionary: [String : AnyObject]) -> Result<CurrencyConverter, ErrorResult> {
        if let base = dictionary[CurrencyMeta.BASE.rawValue] as? String,
            let date = dictionary[CurrencyMeta.DATE.rawValue] as? String,
            let rates = dictionary[CurrencyMeta.RATES.rawValue] as? [String : Double] {
            let finalRates : [CurrencyRate] = rates.compactMap({ CurrencyRate(mCurrencyIso: $0.key, mRate: $0.value)})
            let conversion = CurrencyConverter(mBase: base, mDate: date, mRates: finalRates)
            return Result.success(conversion)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rates"))
        }
    }
}
