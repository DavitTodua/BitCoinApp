//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "4A6A2F16-BC39-438B-9B7A-CF87EC23C314"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate:CoinManagerDelegate?

    func getCoinPrice(coin:String) {
        let currURL = URL(string: String(baseURL+"/"+coin+"?apikey="+apiKey))!
        
        print(currURL)
        let session = URLSession(configuration: .default)
        let sessionTask = session.dataTask(with: currURL) {(data,response,error) in
        
            if(error != nil) {
                print(error.debugDescription)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(whatINeed.self
                                                     , from: data!)
                updateDelegate(name: decodedData.asset_id_quote, rate: decodedData.rate)
            } catch {
                print("cought")
            }
        }
        sessionTask.resume()
    }
    
    func updateDelegate(name:String, rate:Double) {
        DispatchQueue.main.async {
            delegate?.updateCurrencyLabel(name: name)
            delegate?.updateCurrency(currency: rate)
        }
    }
}
