//
//  AppRouter.swift
//  Contacts App
//
//  Created by Verrelio C. Rizky on 13/02/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

class AppRouter: IRouter {
    private var navigationController: UINavigationController!
    
    func setNavigationController(_ nav: UINavigationController) {
        navigationController = nav
    }
    
    func setRoot(to module: FeatureModule, window: UIWindow? = nil, using params: [String : Any] = [:]) {
        let module = module.create(using: self)
        let viewController: UIViewController = module.resolve(using: params)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        module.router.setNavigationController(navigationController)
        window?.rootViewController = navigationController
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func replace(with module: FeatureModule, using params: [String : Any] = [:]) {
        if navigationController.viewControllers.count < 2 {
            setRoot(to: module, using: params)
        } else {
            let module = module.create(using: self)
            let viewController: UIViewController = module.resolve(using: params)
            var viewControllers = navigationController.viewControllers
            _ = viewControllers.popLast()
            viewControllers.append(viewController)
            navigationController.setViewControllers(viewControllers, animated: true)
        }
    }
    
    func present(module: FeatureModule, asNavigation: Bool = false, using params: [String : Any] = [:]) {
        if asNavigation {
            let appRouter = AppRouter()
            let module = module.create(using: appRouter)
            let viewController: UIViewController = module.resolve(using: params)
            let nav = UINavigationController(rootViewController: viewController)
            module.router.setNavigationController(nav)
            nav.modalPresentationStyle = .fullScreen
            navigationController.present(nav, animated: true, completion: nil)
        } else {
            let module = module.create(using: self)
            let viewController: UIViewController = module.resolve(using: params)
            viewController.modalPresentationStyle = .fullScreen
            navigationController.present(viewController, animated: true, completion: nil)
        }
    }
    
    func push(module: FeatureModule, using params: [String : Any] = [:]) {
        let module = module.create(using: self)
        let viewController: UIViewController = module.resolve(using: params)
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func directPresent(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(viewController, animated: true, completion: nil)
    }
}
