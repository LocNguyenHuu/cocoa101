//
//  SecondViewController.swift
//  macos101
//
//  Created by Nguyen Huu Loc on 11/22/19.
//  Copyright © 2019 Assistant. All rights reserved.
//

import Cocoa

class SecondViewController: NSViewController {

    override func viewDidAppear() {
        super.viewDidAppear()
        resizeWin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func backToPreview(_ sender: Any) {
        self.view.window?.performClose(self)
    }
    
    func resizeWin(){
        self.view.window?.setFrame(NSRect(x:0,y:0,width: (NSScreen.main?.frame.width)!,height:(NSScreen.main?.frame.height)!), display: true)
    }
}
