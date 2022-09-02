//
//  Metrics.swift
//  CoreDataHomework
//
//  Created by Виктор on 30/08/2022.
//

import UIKit

extension ProfileAddingView {
    enum Metrics {
        static let cellHeight: CGFloat = 45

        static let textsSize: CGFloat = 14
        
        static let viewsWidthRatio: CGFloat = 0.91
        
        static let buttonTextFieldsHeight: CGFloat = 42
        static let textFieldsOffset: CGFloat = 17
        static let textFieldInsetEdges: UIEdgeInsets = UIEdgeInsets(top: 10,
                                                                    left: 12,
                                                                    bottom: 10,
                                                                    right: 15)
        static let textFieldsLayerButtonCornerRadius: CGFloat = 8
        
        static let workViewHeight: CGFloat = 120
        
        static let tableViewOffset: CGFloat = 35
        
        static let tableViewMaxHeight: CGFloat = 495
    }
    
    enum Strings {
        static let textFieldsPlaceholder = "Print your name here"
        
        static let buttonTitle = "Press"
        
        static let title = "Users"
    }
    
    enum Color {
        static let textFieldAndViewColor = UIColor(red: 242/255,
                                                   green: 242/255,
                                                   blue: 247/255,
                                                   alpha: 100)
    }
}
