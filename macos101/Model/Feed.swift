//
//  Feed.swift
//  macos101
//
//  Created by Nguyen Huu Loc on 11/22/19.
//  Copyright © 2019 Assistant. All rights reserved.
//

import Cocoa

class Feed: NSObject {
    let name: String
    var children = [FeedItem]()
    
    class func feedList(_ fileName: String) -> [Feed] {
      //1
      var feeds = [Feed]()
      
      //2
      if let feedList = NSArray(contentsOfFile: fileName) as? [NSDictionary] {
        //3
        for feedItems in feedList {
          //4
          let feed = Feed(name: feedItems.object(forKey: "name") as! String)
          //5
          let items = feedItems.object(forKey: "items") as! [NSDictionary]
          //6
          for dict in items {
            //7
            let item = FeedItem(dictionary: dict)
            feed.children.append(item)
          }
          //8
          feeds.append(feed)
        }
      }
      
      //9
      return feeds
    }
    
    init(name: String) {
      self.name = name
    }
}
