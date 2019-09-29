//
//  CurrencyDataSource.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import Foundation
import UIKit

class CurrencyDataSource : DataSource<CurrencyRate>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mData.mValue.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        let currencyRate = mData.mValue[indexPath.row]
        cell.mCurrencyRate = currencyRate
        return cell;
    }
}
