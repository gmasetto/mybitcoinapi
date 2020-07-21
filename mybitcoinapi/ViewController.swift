//
//  ViewController.swift
//  mybitcoinapi
//
//  Created by Gilberto Masetto on 13/03/20.
//  Copyright © 2020 Gilberto Masetto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitCoinValue: UILabel!
    
   
    @IBOutlet weak var buttonUpdatedPriceBitCoin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionGetPriceBitCoin(_ sender: Any) {
        getPriceBitCoin()
    }
    
    private func getPriceBitCoin() {
        if let url = URL(string: "https://blockchain.info/ticker") {
            let task = URLSession.shared.dataTask(with: url) { (results, requisicao, error) in

                if error == nil {
                    if let bitCointObject = results {
                        do {
                            if let resultJson = try JSONSerialization.jsonObject(with: bitCointObject, options: []) as? [String: Any] {
                                if let bitCoinBrl = resultJson["BRL"]  as? [String: Any] {
                                    if let price = bitCoinBrl["buy"] as? Double {
                                        self.bitCoinValue.text = price as? String
                                    }
                                }
                            }
                        } catch {
                            print("Error")
                        }
                    }
                } else {
                    print(error)
                }
            }
            task.resume()
         }
    }
    
}

