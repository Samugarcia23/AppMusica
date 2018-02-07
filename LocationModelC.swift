//
//  LocationModelC.swift
//  Proyecto_SQL
//
//  Created by usuario1 on 31/1/18.
//  Copyright © 2018 usuario1. All rights reserved.
//

import Foundation

class LocationModelC: NSObject {
    
    //properties
    
    //var artista: String?
    var cancion: String?
    //var disco: String?
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(cancion: String) {
        
        //self.artista = artista
        self.cancion = cancion
        //self.disco = disco
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "cancion: \(cancion)"
        //return "artista: \(artista), cancion: \(cancion), discografica: \(disco)"
        
    }
    
    
}

