//
//  JobViewController.swift
//  LoginApp
//
//  Created by Сашок on 17.12.2021.
//

import UIKit

class JobViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var noJobLabel: UILabel!
    @IBOutlet weak var noHigherEducationLabel: UILabel!
    
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var periodOfEducationLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var agesOfExperienceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var jobStackView: UIStackView!
    @IBOutlet weak var higherEducationStackView: UIStackView!
    
    // MARK: - Properties
    var job: Job?
    var higherEducation: HigherEducation?
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    
    // MARK: - Private methods
    private func setUpData() {
        setEducationData()
        setJobData()
    }

    private func setEducationData() {
        guard let higherEducation = higherEducation else {
            higherEducationStackView.isHidden = true
            noHigherEducationLabel.isHidden = false
            return
        }
        
        higherEducationStackView.isHidden = false
        noHigherEducationLabel.isHidden = true
        
        universityLabel.text = higherEducation.university
        periodOfEducationLabel.text = "\(higherEducation.beginYear) - \(higherEducation.endYear)"
        degreeLabel.text = higherEducation.degree
    }
    
    private func setJobData() {
        guard let job = job else {
            higherEducationStackView.isHidden = true
            noJobLabel.isHidden = true
            return
        }
        
        higherEducationStackView.isHidden = false
        noJobLabel.isHidden = true
        
        jobLabel.text = "\(job.position) at \(job.company)"
        agesOfExperienceLabel.text = "Ages of experience: \(job.yearsOfExperience)"
        descriptionLabel.text = job.description
    }
}
