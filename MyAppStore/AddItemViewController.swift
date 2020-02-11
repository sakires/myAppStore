//
//  AddItemViewController.swift
//  MyAppStore
//
//  Created by local192 on 03/02/2020.
//  Copyright © 2020 Université La Rochelle. All rights reserved.
//

import UIKit
import CoreData

class AddItemViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    

    @IBOutlet weak var textItemName: UITextField!
    @IBOutlet weak var pickerViewStores: UIPickerView!
    
    var ImagePicker: UIImagePickerController!
    @IBOutlet weak var ImageViewShowImage: UIImageView!
    
    var listOfStores = [StoreType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStores()
        
        pickerViewStores.delegate = self
        pickerViewStores.dataSource = self
        
        ImagePicker = UIImagePickerController()
        ImagePicker.delegate = self
    }
    func loadStores(){
        let fetchRequest : NSFetchRequest = StoreType.fetchRequest()
        do{
            try listOfStores = context.fetch(fetchRequest)
        }catch{
            print("problem with load store")
        }
    }
    
    @IBAction func buttonActionSelectPicture(_ sender: Any) {
        print("Select image")
        present(ImagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            ImageViewShowImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonActionSave(_ sender: Any) {
        let newItem = Item(context: context)
        newItem.item_name = textItemName.text
        newItem.date_add = NSDate() as Date
        newItem.image = ImageViewShowImage.image
        newItem.toStoreType = listOfStores[pickerViewStores.selectedRow(inComponent: 0)]
        do{
            try ad.saveContext()
            textItemName.text = ""
        }catch{
            print("Error saving item")
        }
    }
    
    @IBAction func buttonActionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfStores.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = listOfStores[row]
        return store.store_name
    }


}
