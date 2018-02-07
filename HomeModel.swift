//
//  HomeModel.swift
//  Proyecto_SQL
//
//  Created by usuario1 on 25/1/18.
//  Copyright © 2018 usuario1. All rights reserved.
//

import Foundation


protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
    func itemsDownloadedC(items: NSArray)
    func itemsDownloadedD(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    let urlPath = "http://iesayala.ddns.net/sirdanielrm/proyectoSelect.php"
    let urlPathC = "http://iesayala.ddns.net/sirdanielrm/proyectoSelectC.php"
    let urlPathD = "http://iesayala.ddns.net/sirdanielrm/proyectoSelectD.php"
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func downloadItemsC() {

        let urlC: URL = URL(string: urlPathC)!
        let defaultSessionC = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let taskC = defaultSessionC.dataTask(with: urlC) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSONC(data!)
            }
            
        }


        taskC.resume()

    }
    
    func downloadItemsD() {
        
        
        let urlD: URL = URL(string: urlPathD)!
        let defaultSessionD = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let taskD = defaultSessionD.dataTask(with: urlD) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSOND(data!)
            }
            
        }

        taskD.resume()
    }
    
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        let locationsC = NSMutableArray()
        let locationsD = NSMutableArray()
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = LocationModel()

            
            //the following insures none of the JsonElement values are nil through optional binding
            if let artista = jsonElement["nombreA"] as? String
            {
                location.artista = artista
               // print(artista)
            }
            
            
            
            locations.add(location)


            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)

            
        })
    }
    
    func parseJSONC(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()

        let locationsC = NSMutableArray()

        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            

            let locationC = LocationModelC()

            if let cancion = jsonElement["nombreC"] as? String{
                locationC.cancion = cancion
                //print(cancion)
            }
            
            
            

            locationsC.add(locationC)
            
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            

            self.delegate.itemsDownloadedC(items: locationsC)

            
        })
    }
    
    func parseJSOND(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()

        let locationsD = NSMutableArray()
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            

            let locationD = LocationModelD()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let disco = jsonElement["nombreD"] as? String{
                locationD.disco = disco
                //print(disco)
            }
            
            locationsD.add(locationD)
            
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloadedD(items: locationsD)
            
        })
    }
}


