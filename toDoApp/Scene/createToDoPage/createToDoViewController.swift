//
//  createToDoViewController.swift
//  toDoApp
//
//  Created by Akın Aksoy on 6.06.2022.
//

import UIKit
import SnapKit
class createToDoViewController: UIViewController {

    let titleArea = UIView()
    let titleDescriptionLabel = Label.init().descriptionLabel
    let titleTextfield = TextField.init().textfield
    let selectDateTimeArea = UIView()
    let dateDescriptionLabel = Label.init().descriptionLabel
    let datePicker = Datepicker.init().datePicker
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeDesign()
    }
    
    func makeDesign() {
        titleDescriptionLabel.text = "Title"
        dateDescriptionLabel.text = "Select Date"
        view.backgroundColor = UIColor().setPurple2
        view.addSubview(titleArea)
        view.addSubview(titleTextfield)
        view.addSubview(titleDescriptionLabel)
        view.addSubview(selectDateTimeArea)
        view.addSubview(datePicker)
        view.addSubview(dateDescriptionLabel)
        makeConstraints()
    }
    
    func makeConstraints(){
        
        titleArea.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.10)
            make.width.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview()
        }
        titleTextfield.snp.makeConstraints { make in
            make.width.equalTo(titleArea).multipliedBy(0.92)
            make.height.equalTo(titleArea).dividedBy(2)
            make.centerX.equalTo(titleArea)
            make.centerY.equalTo(titleArea)
        }
        titleDescriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleTextfield.snp_topMargin).offset(-8)
            make.left.equalTo(titleTextfield.snp_leftMargin).offset(8)
        }
        selectDateTimeArea.snp.makeConstraints { make in
            make.top.equalTo(titleArea.snp_bottomMargin)
            make.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.10)
            make.width.equalToSuperview().multipliedBy(0.92)
        }
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(selectDateTimeArea)
            make.left.equalTo(titleTextfield)
            make.width.equalTo(selectDateTimeArea).dividedBy(2).offset(5)
            make.height.equalTo(selectDateTimeArea).dividedBy(2)
        }
        dateDescriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(datePicker.snp_topMargin).offset(-8)
            make.left.equalTo(datePicker.snp_leftMargin).offset(8)
        }
    }
}
