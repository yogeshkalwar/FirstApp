//
//  CurrencyCell.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    @IBOutlet weak var mCurrencyLabel: UILabel!
    @IBOutlet weak var mRateLabel: UILabel!
    
    var mCurrencyRate : CurrencyRate? {
        didSet {
            guard let currencyRate = mCurrencyRate else {
                return
            }
            mRateLabel?.text = "\(currencyRate.mRate)"
            mCurrencyLabel?.text = currencyRate.mCurrencyIso
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
