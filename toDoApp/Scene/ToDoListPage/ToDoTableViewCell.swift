//
//  ToDoTableViewCell.swift
//  toDoApp
//
//  Created by Akın Aksoy on 5.06.2022.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    // MARK: UIProperties
    static let identifier = "ToDoTableViewCell"

    private let checkBoxIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "square")
        image.tintColor = UIColor().setPink1
        return image
    }()
    private let titleLabel = Label.init().headerLabel
    private let timeLabel = Label.init().headerLabel
    private let descriptionLabel = Label.init().descriptionLabel
    // MARK: Init Functions
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        contentView.backgroundColor = UIColor().setPurple1
        contentView.addSubview(checkBoxIcon)
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(descriptionLabel)
        designCell()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    // MARK: Override Functions
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    // MARK: ViewConfigure Functions
    public func designCell() {
        timeLabel.textColor = UIColor().setGold
        self.checkBoxIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        self.titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(checkBoxIcon.snp_rightMargin).offset(10)
            make.right.equalToSuperview().offset(-5)
        }
        self.timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.right.equalToSuperview().offset(-5)
        }
        self.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(checkBoxIcon.snp_leftMargin)
            make.right.equalToSuperview().offset(-5)
        }
    }
    public func configure(icon: String, name: String, time: String, description: String) {
        checkBoxIcon.image = UIImage(systemName: icon)
        titleLabel.text = name
        timeLabel.text = time
        descriptionLabel.text = description
    }
}
