//
//  DescriptionView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 28.11.22.
//

import UIKit

protocol DescriptionDelegate: AnyObject {
    func contactTapAction()
}

class DescriptionView: BasicView {
    
    private let imagesCollectionView: ImagesCollectionView = {
        let collectionView = ImagesCollectionView()
        return collectionView
    }()
    
    private let datePublicationLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.lnk50()
        label.text = R.string.localizable.descriptionPublicationDate()
        return label
    }()
    
    private var cityLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoMedium(size: 20)
        label.textColor = R.color.lnk100()
        label.text = ""
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoRegular(size: 16)
        label.textColor = R.color.blue100()
        label.text = ""
        return label
    }()
    
    private let mapPinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.mapPin()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoRegular(size: 16)
        label.textColor = R.color.white100()
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    private let additionsCollectionView: AdditionsCollectionView = {
        let collectionView = AdditionsCollectionView()
        collectionView.layer.cornerRadius = 12.0
        return collectionView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoMedium(size: 20)
        label.textColor = R.color.lnk100()
        label.text = R.string.localizable.descriptionDescription()
        return label
    }()
    
    private let descriptionTextView: UITextView = {
       let textView = UITextView()
        textView.textColor = R.color.white100()
        textView.textAlignment = .justified
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.font = R.font.robotoRegular(size: 16)
        return textView
    }()
    
    private let userView: UIView = {
       let view = UIView()
        return view
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.lnk5()
        return view
    }()
    
    private let lineView2: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.lnk5()
        return view
    }()
    
    private let accountImage: UIImageView = {
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
        label.numberOfLines = 2
        return label
    }()
    
    private let contactButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = R.color.white500()
        button.layer.borderColor = R.color.blue100()?.cgColor
        button.layer.borderWidth = 1.0
        button.setTitle(R.string.localizable.descriptionContact(), for: .normal)
        button.titleLabel?.font = R.font.robotoMedium(size: 16)
        button.setTitleColor(R.color.blue100(), for: .normal)
        return button
    }()
    
    internal var getImagesCollectionView: ImagesCollectionView { imagesCollectionView }
    internal var getAdditionsCollectionView: AdditionsCollectionView { additionsCollectionView }
    internal weak var descriptionDelegate: DescriptionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()
        
        contentView.addSubview(imagesCollectionView)
        imagesCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        contentView.addSubview(datePublicationLabel)
        datePublicationLabel.snp.makeConstraints {
            $0.top.equalTo(imagesCollectionView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
        }
        
        contentView.addSubview(cityLabel)
        cityLabel.snp.makeConstraints {
            $0.top.equalTo(datePublicationLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(mapPinImage)
        mapPinImage.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
        }
        
        contentView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(mapPinImage)
            $0.leading.equalTo(mapPinImage.snp.trailing).offset(13)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(additionsCollectionView)
        additionsCollectionView.snp.makeConstraints {
            $0.top.equalTo(addressLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(80)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(additionsCollectionView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(userView)
        userView.snp.makeConstraints {
            $0.top.equalTo(descriptionTextView.snp.bottom).offset(16) 
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        userView.addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        userView.addSubview(lineView2)
        lineView2.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        userView.addSubview(accountImage)
        accountImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.width.equalTo(56)
        }
        accountImage.layer.cornerRadius = 28
        
        userView.addSubview(contactButton)
        contactButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(32)
            $0.width.equalTo(117)
        }
        
        userView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(accountImage).offset(5)
            $0.leading.equalTo(accountImage.snp.trailing).offset(12)
        }
        
        contactButton.addTarget(self, action: #selector(contactTap), for: .touchUpInside)
    }
    
    internal func configureView(model: HomeItemsProtocol) {
        self.cityLabel.text = model.city
        self.priceLabel.text = String(model.price)
        self.addressLabel.text = model.address
        self.datePublicationLabel.text?.append(model.publicationDate.convertToString() ?? "")
        self.descriptionTextView.text = model.descriptions
        self.userNameLabel.text = model.userName
    }
    
    @objc
    private func contactTap() {
        descriptionDelegate?.contactTapAction()
    }
    
}
