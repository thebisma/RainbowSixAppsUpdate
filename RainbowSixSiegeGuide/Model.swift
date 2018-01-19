//
//  Model.swift
//  RainbowSixSiegeGuide
//
//  Created by bisma on 18/01/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import Foundation
import RealmSwift

var todoArray: [Todoes] = []
class Todoes{
    
    var todo = ""
    init(){
        
    }
    init(todo: String){
        self.todo = todo
    }
    
}
