//
//  UIExtensions.swift
//  UL-Test
//
//  Created by Kerem Balaban on 16.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import Foundation
import UIKit
import JGProgressHUD

extension UILabel {
    func makeCircular() {
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    func addBorder() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 2
    }
}

extension UIView {
    func setCornerRadius(radius:CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func withBorder() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 2
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

extension UIViewController {
    func showErrorMessage(error: Error) {
        let alertController: UIAlertController = UIAlertController(title:"Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showErrorString(error: String) {
        let alertController: UIAlertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
