//
//  MessagesView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

class MessagesView: UIView {
    
    private let noMessagesViewImages: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.noMessages()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let noMessagesLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.messagesNoMessages()
        label.font = R.font.robotoRegular(size: 16)
        label.textColor = R.color.lnk50()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()
        
        self.addSubview(noMessagesViewImages)
        noMessagesViewImages.snp.makeConstraints {
            $0.top.equalToSuperview().offset(160)
            $0.centerX.equalToSuperview()
        }
        
        self.addSubview(noMessagesLabel)
        noMessagesLabel.snp.makeConstraints {
            $0.top.equalTo(noMessagesViewImages.snp.bottom).offset(25)
            $0.centerX.equalTo(noMessagesViewImages)
        }

    }
   
}
