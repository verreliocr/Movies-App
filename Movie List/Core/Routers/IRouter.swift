//
//  IRouter.swift
//  Contacts App
//
//  Created by Verrelio C. Rizky on 13/02/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

protocol IRouter: class {
    func setNavigationController(_ nav: UINavigationController)
    func setRoot(to module: FeatureModule, window: UIWindow?, using params: [String: Any])
    func popToRoot()
    func replace(with module: FeatureModule, using params: [String: Any])
    func present(module: FeatureModule, asNavigation: Bool, using params: [String: Any])
    func push(module: FeatureModule, using params: [String: Any])
    func directPresent(_ viewController: UIViewController)
}
