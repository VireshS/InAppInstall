//
//  ViewController.swift
//  AppStore
//
//  Created by Singh, Viresh on 07/03/18.
//  Copyright © 2018 Viresh. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func onInstall(_ sender: Any) {
        let storeViewController = SKStoreProductViewController()
        storeViewController.delegate = self
        
        storeViewController.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier:NSNumber(value: 284882215)]) { (result, error) in
            if(error != nil)
            {
                print("Error occurred while loading the product: \(error.debugDescription)")
            }
            else
            {
                print("Displaying Product...")
                self.present(storeViewController, animated: true, completion: {
                    print("Product Displayed...")
                })
            }
        }
    }
}
extension ViewController:SKStoreProductViewControllerDelegate
{
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}

