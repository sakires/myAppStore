//
//  ViewController.swift
//  MyAppStore
//
//  Created by local192 on 03/02/2020.
//  Copyright © 2020 Université La Rochelle. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var textStoreName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonActionSavestore(_ sender: Any) {
        let newStore = StoreType(context:context)
        do {
            newStore.store_name = textStoreName.text
            ad.saveContext()
            textStoreName.text  = ""
        }catch{
            print("Problem Save new store")
        }
    }
    

}

