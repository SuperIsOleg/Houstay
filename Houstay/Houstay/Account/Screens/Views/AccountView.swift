//
//  AccountView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

protocol AccountViewDelegate {
    func exitAction()
}

class AccountView: BasicView {
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.white500()
        return view
    }()
    
    private let accoutImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = R.color.lnk30()
        return imageView
    }()
    
    private let photoImage: UIImageView = {
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

    private let exitButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = R.color.blue5()
        button.setTitle(R.string.localizable.accountExit(), for: .normal)
        button.titleLabel?.font = R.font.robotoMedium(size: 16)
        button.setTitleColor(R.color.blue100(), for: .normal)
        return button
    }()

    private lazy var accountCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout())
    
    internal var accountViewDelegate: AccountViewDelegate?
    internal var header: UIView { headerView }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        
        contentView.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }

        headerView.addSubview(accoutImage)
        accoutImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(16)
            $0.height.width.equalTo(56)
        }
        accoutImage.layer.cornerRadius = 28
        
        accoutImage.addSubview(photoImage)
        photoImage.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
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
        
        contentView.addSubview(accountCollectionView)
        accountCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }

        contentView.addSubview(exitButton)
        exitButton.snp.makeConstraints {
            $0.top.equalTo(accountCollectionView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().offset(-50)
        }

        exitButton.addTarget(self, action: #selector(exitTap), for: .touchUpInside)
    }
    
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    
    internal func setNameUserAndEmailLabel(userName: String, email: String) {
        self.userNameLabel.text = userName
        self.emailLabel.text = email
    }
    
    internal func getAccountCollectionView() -> UICollectionView {
        return accountCollectionView
    }

    @objc func exitTap() {
        accountViewDelegate?.exitAction()
    }
}
