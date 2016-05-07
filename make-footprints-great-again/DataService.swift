//
//  DataService.swift
//  make-footprints-great-again
//
//  Created by Rohit B Iyer on 5/6/16.
//  Copyright © 2016 Rohit Bhaskar. All rights reserved.
//

import Foundation
import Firebase

class DataService{
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "https://mk-fp-grt-again.firebaseio.com")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
}

