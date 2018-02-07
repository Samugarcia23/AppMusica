//
//  LocationModelD.swift
//  Proyecto_SQL
//
//  Created by usuario1 on 31/1/18.
//  Copyright © 2018 usuario1. All rights reserved.
//

import Foundation

class LocationModelD: NSObject {
    
    //properties

    var disco: String?
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(disco: String) {

        self.disco = disco
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "discografica: \(disco)"

        
    }
    
    
}

