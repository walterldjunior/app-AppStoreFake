//
//  CustomTabBarViewController.swift
//  app-AppStoreFake
//
//  Created by Walter Luis Deonísio Junior on 01/09/20.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setComponents()
    }
    
    fileprivate func setComponents() {
        viewControllers = [
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navVC.tabBarController?.tabBar.tintColor = .blue
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = UIImage(named: imageName)
        return navVC
    }
}
