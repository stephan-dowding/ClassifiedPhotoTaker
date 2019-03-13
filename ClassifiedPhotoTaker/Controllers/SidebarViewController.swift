//
//  SidebarViewController.swift
//  ClassifiedPhotoTaker
//
//  Created by Stephan Dowding on 16/01/2019.
//  Copyright © 2019 Stephan Dowding. All rights reserved.
//

import Cocoa

class SidebarViewController: NSViewController {
    
    var folders: [Folder] = []
    
    @IBOutlet var tableView: NSTableView!
    @IBOutlet var foldersArrayController: NSArrayController!

    override func viewDidLoad() {
        super.viewDidLoad()

        let panel = NSOpenPanel()
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = false

        let result = panel.runModal()
        if result != NSApplication.ModalResponse.OK {
            NSApplication.shared.terminate(self)
        }

        let fm = FileManager.default
        let contents = try! fm.contentsOfDirectory(at: panel.urls[0], includingPropertiesForKeys: [.isDirectoryKey], options: [.skipsHiddenFiles])
            .filter{$0.hasDirectoryPath}

        folders.append(contentsOf: contents.map{Folder(name: fm.displayName(atPath: $0.path), url: $0)})

        for folder in folders {
            foldersArrayController.addObject(folder)
        }
        
        Selected.folder = folders[0]

        tableView.delegate = self
    }
}

extension SidebarViewController: NSTableViewDelegate {
    public func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        Selected.folder = folders[row]
        return true
    }
}
