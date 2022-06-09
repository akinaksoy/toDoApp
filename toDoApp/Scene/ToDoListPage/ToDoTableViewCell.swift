//
//  ToDoTableViewCell.swift
//  toDoApp
//
//  Created by Akın Aksoy on 5.06.2022.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    static let identifier = "ToDoTableViewCell"
    
    private let checkBoxIcon : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "square")
        image.tintColor = UIColor().setPink1
        return image
    }()
    private let titleLabel = Label.init().headerLabel
    private let timeLabel = Label.init().headerLabel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor().setPurple1
        contentView.addSubview(checkBoxIcon)
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeLabel)
        DesignCell()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    public func DesignCell(){
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
        }
        self.timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.right.equalToSuperview().offset(-2)
        }
    }
    public func configure(icon : String,name:String,time:String){
        checkBoxIcon.image = UIImage(systemName: icon)
        titleLabel.text = name
        timeLabel.text = time
    }
}
