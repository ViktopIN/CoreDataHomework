//
//  AppDelegate extension.swift
//  CoreDataHomework
//
//  Created by Виктор on 26/08/2022.
//

import UIKit

extension AppDelegate {
    func setupNavigationBar() {
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.shadowColor = .clear
            
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            UINavigationBar.appearance().barTintColor = .white
        }
    }
}
