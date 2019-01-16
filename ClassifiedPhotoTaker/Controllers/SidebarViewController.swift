//
//  SidebarViewController.swift
//  ClassifiedPhotoTaker
//
//  Created by Stephan Dowding on 16/01/2019.
//  Copyright © 2019 Stephan Dowding. All rights reserved.
//

import Cocoa

class SidebarViewController: NSViewController {
    
    let folders: [Folder] = [Folder(name: "Rock"), Folder(name: "Paper"), Folder(name: "Scissors")]
    
    @IBOutlet var tableView: NSTableView!
    @IBOutlet var foldersArrayController: NSArrayController!

    override func viewDidLoad() {
        super.viewDidLoad()
        for folder in folders {
            foldersArrayController.addObject(folder)
        }
    }
    
}
