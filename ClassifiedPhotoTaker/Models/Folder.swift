//
//  Folder.swift
//  ClassifiedPhotoTaker
//
//  Created by Stephan Dowding on 16/01/2019.
//  Copyright © 2019 Stephan Dowding. All rights reserved.
//

import Foundation

class Folder: NSObject {
    @objc let name: String
    
    init(name: String){
        self.name = name
    }
}
