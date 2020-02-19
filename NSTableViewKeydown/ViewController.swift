//
//  ViewController.swift
//  NSTableViewKeydown
//
//  Created by tsuyoshi on 2020/02/19.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource, KeydownTableViewDelegate {

    var list = ["hoge", "fuga", "piyo"]
    
    @IBOutlet weak var tableView: KeydownTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.keydownTableViewDelegate = self
    }

    override var representedObject: Any? {
        didSet {
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let col = tableColumn else {
            return NSView()
        }
        
        guard let cell = tableView.makeView(withIdentifier: col.identifier, owner: self) as? NSTableCellView else {
            return NSView()
        }
        
        switch col.identifier.rawValue {
        case "Cell1":
            cell.textField?.stringValue = list[row]
        default:
            return NSView()
        }
        
        return cell
    }

    func deleteKeydown(tableView: NSTableView, row: Int) {
        print("deleteKeyDown(tableView:row:)")
    }
    
}

