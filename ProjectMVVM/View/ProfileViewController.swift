//
//  ProfileViewController.swift
//  ProjectMVVM
//
//  Created by MAC45 on 12/05/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileViewModel: ProfileViewModel = ProfileViewModel()
    
    var pfp: Profile? = nil
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblEmail: UILabel!    
    @IBOutlet weak var lblCelu: UILabel!
    @IBOutlet weak var lblCumple: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblStreet: UILabel!
    @IBOutlet weak var lblHour: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpData()
        }        // Do any additional setup after loading the view.
    }
    
    func setUpData() async {
        await profileViewModel.getDataFromAPI()
        pfp = profileViewModel.pfp
        setUpDataProfile()
    }
    
    func setUpDataProfile(){
    
        lblName.text = "\((pfp?.title.capitalized)!) \((pfp?.firstName)!) \((pfp?.lastName)!)"
        imageView.image = HelperImage.setImageFromUrl(url: (pfp?.picture)!)
        lblEmail.text = pfp?.email
        lblCelu.text = pfp?.phone
        lblGender.text = pfp?.gender
        lblCumple.text = pfp?.dateOfBirth
        
    }
}
