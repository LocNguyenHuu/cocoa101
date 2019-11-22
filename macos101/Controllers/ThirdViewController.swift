//
//  ThirdViewController.swift
//  macos101
//
//  Created by Nguyen Huu Loc on 11/22/19.
//  Copyright © 2019 Assistant. All rights reserved.
//

import Cocoa

class ThirdViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        resizeWin()
    }
    
    func resizeWin(){
        self.view.window?.setFrame(NSRect(x:0,y:0,width: (NSScreen.main?.frame.width)!,height:(NSScreen.main?.frame.height)!), display: true)
    }
}
