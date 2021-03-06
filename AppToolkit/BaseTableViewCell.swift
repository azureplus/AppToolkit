//
//  BaseTableViewCell.swift
//  AppToolkit
//
//  Created by Ilya Kuznetsov on 12/20/19.
//  Copyright © 2019 Ilya Kuznetsov. All rights reserved.
//

import UIKit

@objc public protocol TCellObjectHolding: NSObjectProtocol {
    
    var object: AnyHashable? { get set }
}

@objc public extension UITableViewCell {
    
    var separatorHidden: Bool {
        set {
            for view in findSeparatorViews() {
                view.isHidden = newValue
            }
        }
        get {
            return findSeparatorViews().first?.isHidden ?? true
        }
    }
    
    private func findSeparatorViews() -> [UIView] {
        var views: [UIView] = []
        
        for view in subviews {
            if String(describing: type(of: view)).contains("SeparatorView") {
                views.append(view)
            }
        }
        return views
    }
}

@objc(ATBaseTableViewCell)
open class BaseTableViewCell: UITableViewCell, TCellObjectHolding {
    
    open var object: AnyHashable?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor(white: 0.5, alpha: 0.1)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.separatorHidden = separatorHidden
    }
}
