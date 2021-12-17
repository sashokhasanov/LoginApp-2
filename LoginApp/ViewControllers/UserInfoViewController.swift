//
//  UserInfoViewController.swift
//  LoginApp
//
//  Created by Сашок on 17.12.2021.
//

import UIKit

class UserInfoViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    // MARK: - Properties
    var userInfo: PersonInfo!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    
    // MARK: - Private methods
    private func setUpData() {
        nameLabel.text = "My name is \(userInfo.name)"
        ageLabel.text = "I'm \(userInfo.age) years old"
        cityLabel.text = "I live in \(userInfo.city)"
    }

}
