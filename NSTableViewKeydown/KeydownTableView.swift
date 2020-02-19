//
//  KeydownTableView.swift
//  NSTableViewKeydown
//
//  Created by tsuyoshi on 2020/02/19.
//

import Cocoa

protocol KeydownTableViewDelegate: NSObject {
    
    func deleteKeydown(tableView: NSTableView, row: Int)
    
}

class KeydownTableView: NSTableView {

    var keydownTableViewDelegate: KeydownTableViewDelegate?
    
    override func keyDown(with event: NSEvent) {
        guard let keydownTableViewDelegate = self.keydownTableViewDelegate else {
            super.keyDown(with: event)
            return
        }
        
        if event.keyCode == 51 {
            // delete key
            // NSDeleteCharacter?
            print("delete key down")
            keydownTableViewDelegate.deleteKeydown(tableView: self, row: self.selectedRow)
            return
        }
        
        super.keyDown(with: event)
    }
    
}
