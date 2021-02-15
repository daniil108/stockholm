//
//  Router+Extension.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

extension Router {
    
    func showOKAlertView(_ title: String?, message: String?) {
        showCustomAlertView(title, message: message, actionText: R.string.localizable.actionOk())
    }
    
    func showCustomAlertView(_ title: String?, message: String?, style: UIAlertController.Style = .alert, actionText: String, handler: ValueClosure<UIAlertAction>? = nil) {
        guard let viewController = topMostViewController else { return }
        let alertView = UIAlertController(title: title, message: message, preferredStyle: style)
        alertView.addAction(UIAlertAction(title: actionText, style: .default, handler: handler))
        viewController.present(alertView, animated: true, completion: nil)
    }
    
}
