//
//  Currency.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation

enum Currency : String {
    case EUR
    case GBP
    case USD
}

enum CurrencyLocale : String {
    case EUR = "fr_FR"
    case GBP = "en_UK"
    case USD = "en_US"
}

struct CurrencyRate {
    let mCurrencyIso : String
    let mRate : Double
}

enum CurrencyMeta : String {
    case BASE = "base"
    case DATE = "date"
    case RATES = "rates"
}
