//
//  ViewController.swift
//  FirstApp
//
//  Created by Yogesh Kalwar on 24/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, View {

    @IBOutlet weak var mTableView: UITableView!
    
    let mDataSource = CurrencyDataSource()
    
    lazy var mViewModel : CurrencyViewModel = {
        let viewModel = CurrencyViewModel(dataSource: mDataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "£ Exchange rate"
        self.mTableView.dataSource = mDataSource
        self.mDataSource.mData.addObserverAndNotify(self) { [weak self] _ in
            self?.mTableView.reloadData()
        }
        self.mViewModel.onErrorHandling = { [weak self] error in
            let controller = UIAlertController(title:"An error occured", message:"Oops, something went wrong", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title:"Close", style: .cancel, handler: nil))
            self?.present(controller, animated:true, completion: nil)
        }
        self.mViewModel.fetchCurrencies()
    }
}
