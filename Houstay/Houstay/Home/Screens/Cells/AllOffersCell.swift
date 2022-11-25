//
//  AllOffersCell.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 5.09.22.
//

import UIKit

protocol AllOffersCellDelegate: AnyObject {
    func favoriteAppartementAction()
}

class AllOffersCell: UICollectionViewCell {
    static var reuseIdentifier = String(describing: AllOffersCell.self)
    
    private var isButtonSelected: Bool = false
    
    private let appartementImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 12.0
        return imageView
    }()
    
    private let favoriteAppartementButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.didTapLike(), for: .normal)
        return button
    }()
    
    private let addressLabel: UILabel = {
       let label = UILabel()
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.lnk50()
        label.text = ""
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoMedium(size: 16)
        label.textColor = R.color.lnk100()
        label.text = ""
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.lnk100()
        label.text = ""
        return label
    }()
    
    internal var getIsButtonSelected: Bool { isButtonSelected }
    internal var getFavoriteAppartementButton: UIButton { favoriteAppartementButton }
    
    internal weak var allOffersCellDelegate: AllOffersCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {

        self.addSubview(appartementImageView)
        appartementImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        appartementImageView.addSubview(favoriteAppartementButton)
        favoriteAppartementButton.snp.makeConstraints {
            $0.top.equalTo(12)
            $0.trailing.equalTo(-12)
            $0.height.width.equalTo(30)
        }
        
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(appartementImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        self.addSubview(cityLabel)
        cityLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        self.addSubview(addressLabel)
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
        favoriteAppartementButton.addTarget(self, action: #selector(favoriteAppartementTap), for: .touchUpInside)
        
    }
    
    @objc
    private func favoriteAppartementTap() {
        self.allOffersCellDelegate?.favoriteAppartementAction()
        switch isButtonSelected {
        case true:
            self.favoriteAppartementButton.setImage(R.image.tapLike(), for: .normal)
        case false:
            self.favoriteAppartementButton.setImage(R.image.didTapLike(), for: .normal)
        }
    }
    
    internal func configure( _ model: HomeItemsProtocol) {
        self.addressLabel.text = model.address
        self.cityLabel.text = model.city
        self.priceLabel.text = model.price
        self.appartementImageView.image = UIImage(named: model.image)
        self.isButtonSelected = model.favorite
    }
}
