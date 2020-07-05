//
//  AppNotification.swift
//  AppToolkit
//
//  Created by Ilya Kuznetsov on 12/20/19.
//  Copyright © 2019 Ilya Kuznetsov. All rights reserved.
//

import Foundation

@objcMembers
@objc(ATNotification)
public class AppNotification: NSObject {
    
    public var created: Set<AnyHashable>?
    public var updated: Set<AnyHashable>?
    public var deleted: Set<AnyHashable>?
    public var sender: AnyObject?
    public var object: AnyObject?
    public var userInfo: [AnyHashable:Any]?
    
    public class func make(updated: Set<AnyHashable>) -> Self {
        return self.init(updates: updated)
    }
    
    public required convenience init(updates: Set<AnyHashable>) {
        self.init()
        self.updated = updates
    }
    
    public override init() {
        super.init()
    }
}
