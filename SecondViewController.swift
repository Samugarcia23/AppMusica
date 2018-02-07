//
//  SecondViewController.swift
//  Proyecto_SQL
//
//  Created by usuario1 on 25/1/18.
//  Copyright © 2018 usuario1. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, HomeModelProtocol, UIPickerViewDataSource , UIPickerViewDelegate{
    var feedItems: NSArray = NSArray()
    var feedItemsC: NSArray = NSArray()
    var feedItemsD: NSArray = NSArray()
    
    //var feedItemsC: [String] = ["elemento1", "elemento2","elemento3"]
    
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var picker2: UIPickerView!
    @IBOutlet weak var picker3: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    var selectedLocation : LocationModel = LocationModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        homeModel.downloadItemsC()
        homeModel.downloadItemsD()
        
        self.picker1.dataSource = self
        self.picker1.delegate = self
        self.picker1.tag = 1
        
        self.picker2.dataSource = self
        self.picker2.delegate = self
        self.picker2.tag = 2
        
        self.picker3.dataSource = self
        self.picker3.delegate = self
        self.picker3.tag = 3
        label.becomeFirstResponder()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        homeModel.downloadItemsC()
        homeModel.downloadItemsD()
        self.picker1.dataSource = self
        self.picker1.delegate = self
        self.picker1.tag = 1
        
        self.picker2.dataSource = self
        self.picker2.delegate = self
        self.picker2.tag = 2
        
        self.picker3.dataSource = self
        self.picker3.delegate = self
        self.picker3.tag = 3
        label.becomeFirstResponder()
    }
    func itemsDownloaded(items: NSArray) {
        feedItems = items
        
        self.picker1.reloadAllComponents()

        
    }
    func itemsDownloadedC(items: NSArray) {
        feedItemsC = items
        

        self.picker2.reloadAllComponents()
        
    }
    func itemsDownloadedD(items: NSArray) {
        feedItemsD = items
        
        self.picker3.reloadAllComponents()

        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return feedItems.count
        }
        if pickerView.tag == 2 {
            return feedItemsC.count
        }
            return feedItemsD.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            let a = feedItems[row] as! LocationModel
            print("a")
            return a.artista
        }
        
        if pickerView.tag == 2 {
            let a = feedItemsC[row] as! LocationModelC
            print("b")
            return a.cancion
        }
        
        if pickerView.tag == 3 {
            let a = feedItemsD[row] as! LocationModelD
            print("c")
            return a.disco
        }
        return "hola"

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

