//
//  CoinManagerDelegate.swift
//  ByteCoin
//
//  Created by David Todua on 14.07.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

protocol CoinManagerDelegate {
    func updateCurrency(currency:Double)
    func updateCurrencyLabel(name:String)
}

