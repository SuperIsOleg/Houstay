//
//  AccountView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

protocol AccountViewDelegate: AnyObject {
    func changePhotoAction()
}

class AccountView: UIView {
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.white500()
        return view
    }()
    
    private let accoutImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = R.color.lnk30()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let cameraImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.photo()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
       let label = UILabel()
        label.text = "No name"
        label.font = R.font.robotoMedium(size: 20)
        label.textColor = R.color.lnk100()
        return label
    }()
    
    private let emailLabel: UILabel = {
       let label = UILabel()
        label.text = "No email"
        label.font = R.font.robotoRegular(size: 12)
        label.textColor = R.color.lnk50()
        return label
    }()

    private lazy var accountTableView = UITableView()
    
   
    internal var header: UIView { headerView }
    internal var getAccountTableView: UITableView { accountTableView }
    internal var getAccountImage: UIImageView { accoutImage }
    internal weak var accountViewDelegate: AccountViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        
        self.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }

        headerView.addSubview(accoutImage)
        accoutImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(16)
            $0.height.width.equalTo(56)
        }
        accoutImage.layer.cornerRadius = 28
        
        self.addSubview(cameraImage)
        cameraImage.snp.makeConstraints {
            $0.bottom.equalTo(accoutImage.snp.bottom)
            $0.trailing.equalTo(accoutImage.snp.trailing)
        }
        cameraImage.layer.zPosition = 3
        
        headerView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(accoutImage).offset(5)
            $0.leading.equalTo(accoutImage.snp.trailing).offset(12)
           
        }
        
        headerView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(7)
            $0.leading.equalTo(userNameLabel)
        }
        
        self.addSubview(accountTableView)
        accountTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        let gesture = UITapGestureRecognizer(target: self,
                                          action: #selector(changePhoto(tapGestureRecognizer: )))
        accoutImage.isUserInteractionEnabled = true
        accoutImage.addGestureRecognizer(gesture)
        

    }
    
    internal func setNameUserAndEmailLabel(userName: String, email: String) {
        self.userNameLabel.text = userName
        self.emailLabel.text = email
    }
    
    @objc
    private func changePhoto(tapGestureRecognizer: UITapGestureRecognizer) {
        accountViewDelegate?.changePhotoAction()
    }

}
