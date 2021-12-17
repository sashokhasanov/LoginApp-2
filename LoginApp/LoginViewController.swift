//
//  ViewController.swift
//  LoginApp
//
//  Created by Сашок on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let login = "Happy"
    private let password = "123"
    
// MARK: - Override methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "loginSegue") {
            let welocmeController = segue.destination as! WelcomeViewController
            welocmeController.login = login
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
// MARK: - IBAction
    @IBAction func loginButtonPressed() {
        processLogin()
    }
    
    @IBAction func unwindLoginSegue(_ segue: UIStoryboardSegue) {
        loginTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotLoginpressed() {
        showAlert(title: "Hint 🦄", message: "username is \"\(login)\"")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(title: "Hint 🦄", message: "password is \"\(password)\"")
    }
    
// MARK: - Private methods
    private func processLogin() {
        if (checkLoginAndPassword()) {
            performSegue(withIdentifier: "loginSegue", sender: self)
        } else {
            showAlert(title: "Ooops 😥", message: "invalid login or password")
        }
    }
    
    private func checkLoginAndPassword() -> Bool {
        let inputLogin = loginTextField.text ?? ""
        let inputPassword = passwordTextField.text ?? ""
        
        return login == inputLogin && password == inputPassword
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}

// MARK: - Text field delegate
extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField === loginTextField) {
            passwordTextField.resignFirstResponder()
        } else {
            processLogin()
        }
        
        return true
    }
}

// MARK: - Resizing safe area on keyboard show/hide
extension LoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(adjustForKeyboard),
                                       name: UIResponder.keyboardWillHideNotification,
                                       object: nil)
        
        notificationCenter.addObserver(self,
                                       selector: #selector(adjustForKeyboard),
                                       name: UIResponder.keyboardWillChangeFrameNotification,
                                       object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let keyboardAnimationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber
        else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            additionalSafeAreaInsets = .zero
        } else {
            additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        UIView.animate(withDuration: keyboardAnimationDuration.doubleValue) { self.view.layoutIfNeeded() }
    }
}
