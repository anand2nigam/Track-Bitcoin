//
//  ViewController.swift
//  Track Bitcoin
//
//  Created by Anand Nigam on 21/07/18.
//  Copyright © 2018 Anand Nigam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
        let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    // Connections with the UI
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    
    @IBOutlet weak var bitcoinCurrencyPicker: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

