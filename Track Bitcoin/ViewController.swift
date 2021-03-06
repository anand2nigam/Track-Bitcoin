//
//  ViewController.swift
//  Track Bitcoin
//
//  Created by Anand Nigam on 21/07/18.
//  Copyright © 2018 Anand Nigam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

        let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
        var finalURL = ""
    
        let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySelectedArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var currencySymbol = ""
    
    // Connections with the UI
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    
    @IBOutlet weak var bitcoinCurrencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bitcoinCurrencyPicker.delegate = self
        bitcoinCurrencyPicker.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK:- PickerView Configuration
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(currencyArray[row])
        finalURL = baseURL + currencyArray[row]
        print(finalURL)
        currencySymbol = currencySelectedArray[row]
        getBitcoinData(url: finalURL)
    }
    
    // MARK:- Networking
    
    func getBitcoinData(url: String) {
        Alamofire.request(url, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
           let bitcoinJSONData: JSON = JSON(response.result.value!)
            print(bitcoinJSONData)
                self.updateBitcoinData(json: bitcoinJSONData)
        }
            else {
                print(response.result.error!)
                self.bitcoinPriceLabel.text = "Connection Issues"
            }
        }
       
    }
    
    // MARK:- JSON Parsing
    
    func updateBitcoinData(json: JSON) {
        if  let bitcoinResult = json["ask"].double {
        print(bitcoinResult)
        bitcoinPriceLabel.text = "\(currencySymbol)\(bitcoinResult)"
        }
    }



}

