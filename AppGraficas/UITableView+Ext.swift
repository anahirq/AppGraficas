//
//  UITableView+Ext.swift
//  AppGraficas
//
//  Created by Anahi Rojas on 04/10/21.
//

import UIKit

extension UITableView {
    
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
