//
//  ViewController.swift
//  AuthenticationTest
//
//  Created by 麻生 拓弥 on 2017/09/19.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startAuthentication(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        var description: String!

        // Touch ID・Face IDが利用できるデバイスか確認する
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            switch context.biometryType {
            case .faceID:
                description = "アカウント情報を閲覧するためにFace IDを認証として用います。"
                break
            case .touchID:
                description = "アカウント情報を閲覧するためにTouch IDを認証として用います。"
                break
            case .none:
                description = "アカウント情報を閲覧するためにログインしてください。"
                break
            }
            // 利用できる場合は指紋・顔認証を要求する
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description, reply: {success, evaluateError in
                if (success) {
                    // 認証成功時の処理を書く
                    DispatchQueue.main.async {
                        self.statusLabel.text = "認証成功"
                    }
                } else {
                    // 認証失敗時の処理を書く
                    DispatchQueue.main.async {
                        self.statusLabel.text = "認証失敗"
                    }
                }
            })
        } else {
            // Touch ID・Face IDが利用できない場合
            let errorDescription = error?.userInfo["NSLocalizedDescription"] ?? ""
            self.statusLabel.text = errorDescription as? String
            print(errorDescription)
            description = "アカウント情報を閲覧するためにログインしてください。"

            let alertController = UIAlertController(title: "Authentication Required", message: description, preferredStyle: .alert)
            weak var usernameTextField: UITextField!
            alertController.addTextField(configurationHandler: { textField in
                textField.placeholder = "User ID"
                usernameTextField = textField
            })
            weak var passwordTextField: UITextField!
            alertController.addTextField(configurationHandler: { textField in
                textField.placeholder = "Password"
                textField.isSecureTextEntry = true
                passwordTextField = textField
            })
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alertController.addAction(UIAlertAction(title: "Log In", style: .destructive, handler: { action in
                // 入力されたユーザIDとパスワードを認証させる処理を書く
                print(usernameTextField.text! + "\n" + passwordTextField.text!)
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

