
import Foundation
import UIKit
import SnapKit

class ProfileViewController : UIViewController {

    var profileImage:UIImage!
    var profileImageView:UIImageView!
    var nameLabel:UILabel!
    var horizontalConstraints:HorizontalConstraintRules = HorizontalConstraintRules()
    var verticalConstraints:VerticalConstraintRules = VerticalConstraintRules()

    override func viewDidLoad() {

        view.backgroundColor = UIColor.whiteColor()

        profileImageView = createProfileImageView()
        nameLabel = createLabel("")

        view.addSubview(profileImageView)
        view.addSubview(nameLabel)

        let components = [profileImageView, nameLabel]

        let verticalRules = [
                VerticalConstraintRules().withHeight(100).withMarginTop(30).withSnapTop(view.snp_top),
                VerticalConstraintRules().withSnapTop(profileImageView.snp_bottom)
        ]
        let horizontalRules = [
                HorizontalConstraintRules().withCenterX(true).withWidth(100),
                HorizontalConstraintRules().withCenterX(true)
        ]

        SnapKitHelpers.setHorizontalConstraints(view, components: components, rules: horizontalRules)
        SnapKitHelpers.setVerticalConstraints(view, components: components, rules: verticalRules)
    }
    
    override func viewDidAppear(animated: Bool) {
        if API.currentUser != nil {
            refreshProfile()
        }

    }

    func refreshProfile(){
        nameLabel.text = "Welcome \(API.currentUser!.name)"
        API.getImageForUser(API.currentUser!).onSuccess{image in
            self.profileImageView.image = image
        }

    }

    func createProfileImageView() -> UIImageView {
        let profileImage = UIImage(named: "profile.png")
        let profileImageView = UIImageView(image: profileImage)

        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
        profileImageView.layer.cornerRadius = 100/2
        profileImageView.clipsToBounds = true

        return profileImageView
    }
}