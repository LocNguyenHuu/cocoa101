//
//  ViewController.swift
//  macos101
//
//  Created by Nguyen Huu Loc on 11/21/19.
//  Copyright © 2019 Assistant. All rights reserved.
//

import Cocoa
import SwiftCSV

class ViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var filename_field: NSTextField!
    var people: [Person] = []
    var verticalLineColor: NSColor?
    var horizontalLineColor: NSColor?
    
    var headBKColor: NSColor?
    var headBKGradient: NSGradient?
    var headSeparatorLineColor: NSColor?
    
    var headTitleColor: NSColor?
    var headTitleFont: NSFont?
    var headTitleAlignment: NSTextAlignment?
    var headTitleLineBreakMode: NSLineBreakMode?
    
    var cellTextColor: NSColor?
    var cellFont: NSFont? = NSFont.systemFont(ofSize: 11)
    var cellAlignment: NSTextAlignment = .left
    
    var cellFirstColor: NSColor?
    var cellFirstGradient: NSGradient?
    
    var cellSecondColor: NSColor?
    var cellSecondGradient: NSGradient?
    
    var cellHighlightColor: NSColor?
    var cellHighlightGradient: NSGradient?
    // our variable
    var data: [[String: String]] = [[:]]
    var columnNames:[String] = ["Table","View","Welcome"] {
        didSet {
            tableViewColumnConfig()
        }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        for tableColumn in self.tableView.tableColumns {

            let content = tableColumn.title
            let headerCell = TableHeaderCell()
            headerCell.isEditable = true
            headerCell.usesSingleLineMode = true
            headerCell.isScrollable = false
            headerCell.lineBreakMode = .byTruncatingTail
            tableColumn.headerCell = headerCell
            tableColumn.title = content
        }
//        for tableColumn in self.tableView.tableColumns {
//        }
    }
    override func viewDidAppear() {
        super.viewDidAppear()
        resizeWin()
        tableViewColumnConfig()
//        tableView.reloadData()
//        view.window?.zoom(self) //bespread the screen
//        view.window?.toggleFullScreen(self)  //fullscreen
    }
    
    func resizeWin(){
        self.view.window?.setFrame(NSRect(x:0,y:0,width: (NSScreen.main?.frame.width)!,height:(NSScreen.main?.frame.height)!), display: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person1 = Person.init(firstName: "Loc", lastName: "Nguyen", mobileNumber: "11122233344")
        let person2 = Person.init(firstName: "Nhu", lastName: "Nguyen", mobileNumber: "222333")
        people.append(person1)
        people.append(person2)
        
        // adding people
        data = [
            [
                "firstName" : "Ragnar",
                "lastName" : "Lothbrok",
                "mobileNumber" : "555-1234"
            ]
        ]
        
        // reload tableview
//        tableView.reloadData()
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func selectFile(_ sender: Any) {
        let dialog = NSOpenPanel();

        dialog.title                   = "Choose a .csv file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["csv"];

        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                let path = result!.path
                filename_field.stringValue = path
                loadCSVData(pathToCSV: path)
            }
        } else {
            // User clicked on "Cancel"
            return
        }
//        tableView.reloadData()
    }
    
    func loadCSVData(pathToCSV: String) {
        print("Loading csv data...")
        do {
            // From a file (with errors)
            let csvFile: CSV = try CSV(url: URL(fileURLWithPath: pathToCSV))
//            print(csvFile.header)
            columnNames = csvFile.header
        
            print(csvFile.namedRows)
//            print(csvFile.namedColumns)
        } catch {
            
        }
    }
    
    func tableViewColumnConfig() {
        let tableColumns = tableView.tableColumns
        for tableColumn in tableColumns {
            tableView.removeTableColumn(tableColumn)
        }
        tableView.gridStyleMask = [.solidHorizontalGridLineMask , .solidVerticalGridLineMask]
        var i: Int = 0
        
        for columnName in columnNames {
            let column = NSTableColumn()
            let colIdentifier = NSUserInterfaceItemIdentifier(rawValue: columnName)
            column.identifier = colIdentifier
//            column.width      = 60
//            column.minWidth   = 40
//            column.maxWidth   = 1000
            column.isEditable = true
            
            let cell = headerCell(for: columnName)
//            let header1: NSTableHeaderCell = NSTableHeaderCell(textCell: "Alibaba")
            column.headerCell  = cell
            tableView.addTableColumn(column)
            i += 1
        }
    }
    
    func headerCell(for title: String) -> NSTableHeaderCell {

        let cell = NSTableHeaderCell(textCell: title)
        return cell
    }
}

extension ViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
//        return (data.count)
        print("~~~~~~~~~>", columnNames.count)
        return 20
    }
    
    func tableView(_ tableView: NSTableView, shouldEdit tableColumn: NSTableColumn?, row: Int) -> Bool {
        return false
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//        let person = data[row]
//
//        guard let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
//        cell.textField?.stringValue = person[tableColumn!.identifier.rawValue]!
//
//        return cell
        
        let cell = headerCell(for:(tableColumn?.title)!)
         
         tableColumn?.headerCell = cell
         
         let text = "Cell" + "\(row)"
        
         let key = (tableColumn?.identifier)!
         
         var view = tableView.makeView(withIdentifier: key, owner: self)
         
         var  textField: NSTextField?
         if view == nil {
             textField = NSTextField()
             textField?.drawsBackground = false
             textField?.isBezeled = false
             textField?.alignment = .center
             textField?.textColor = NSColor.textColor
             textField?.font = NSFont.systemFont(ofSize: 11)
             textField?.identifier = identifier
             view = textField
         }
         else{
             textField = view as? NSTextField
         }
         
//         if let cellTextColor = cellTextColor {
//             textField?.textColor = cellTextColor
//         }
//         if let cellFont = cellFont {
//             textField?.font = cellFont
//         }
//         textField?.alignment = cellAlignment
         
         textField?.isEditable = true
//         textField?.stringValue = text
        textField?.stringValue = "alibaba"
         return view
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 25
    }
    
}

class TableHeaderCell: NSTableHeaderCell, NSTextViewDelegate {

    func edit(fieldEditor: NSText, frame: NSRect, headerView: NSView) {

        let endOfText = (self.stringValue as NSString).length
        self.isHighlighted = true
        self.select(withFrame: frame,
                           in: headerView,
                       editor: fieldEditor,
                     delegate: self,
                        start: endOfText,
                       length: 0)

        fieldEditor.backgroundColor = .white
        fieldEditor.drawsBackground = true
    }

    func textDidEndEditing(_ notification: Notification) {

        guard let editor = notification.object as? NSText else { return }

        self.title = editor.string
        print("Header did change to \(self.title)")
        self.isHighlighted = false

        // The following will fire a regular `NSTextDidEndEditingNotification`:
        self.endEditing(editor)
    }
}
