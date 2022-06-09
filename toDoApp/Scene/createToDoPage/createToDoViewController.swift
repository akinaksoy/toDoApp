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
    let titleHeaderLabel = Label.init().descriptionLabel
    let titleTextfield = TextField.init().textfield
    let selectDateTimeArea = UIView()
    let dateHeaderLabel = Label.init().descriptionLabel
    let datePicker = Datepicker.init().datePicker
    let descriptionArea = UIView()
    let descriptionTextfield = TextField.init().textfield
    let descriptionHeaderLabel = Label.init().descriptionLabel
    let saveButton = Button.init().saveButton
    
    @objc func clickedOnSaveButton(){
        guard let titleText = titleTextfield.text else { return }
        guard let descriptionText = descriptionTextfield.text else {return}
        let dateValue = datePicker.date
        createToDoViewModel.shared.saveDataToStorage(title: titleText, description: descriptionText, date: dateValue )
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        makeDesign()
    }
    
    func makeDesign() {
        titleHeaderLabel.text = "Title"
        dateHeaderLabel.text = "Select Date"
        descriptionHeaderLabel.text = "Description"
        saveButton.addTarget(self, action: #selector(clickedOnSaveButton), for: .touchUpInside)
        view.backgroundColor = UIColor().setPurple2
        view.addSubview(titleArea)
        view.addSubview(titleTextfield)
        view.addSubview(titleHeaderLabel)
        view.addSubview(selectDateTimeArea)
        view.addSubview(datePicker)
        view.addSubview(dateHeaderLabel)
        view.addSubview(descriptionArea)
        view.addSubview(descriptionTextfield)
        view.addSubview(descriptionHeaderLabel)
        view.addSubview(saveButton)
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
        titleHeaderLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleTextfield.snp_topMargin).offset(-8)
            make.left.equalTo(titleTextfield.snp_leftMargin).offset(8)
        }
        selectDateTimeArea.snp.makeConstraints { make in
            make.top.equalTo(titleArea.snp_bottomMargin).offset(16)
            make.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.10)
            make.width.equalToSuperview().multipliedBy(0.92)
        }
        datePicker.snp.makeConstraints { make in
            make.centerY.equalTo(selectDateTimeArea)
            make.left.equalTo(titleTextfield)
            make.width.equalTo(selectDateTimeArea).dividedBy(2).offset(5)
            make.height.equalTo(selectDateTimeArea).dividedBy(2)
        }
        dateHeaderLabel.snp.makeConstraints { make in
            make.bottom.equalTo(datePicker.snp_topMargin).offset(-8)
            make.left.equalTo(datePicker.snp_leftMargin).offset(8)
        }
        descriptionArea.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.10)
            make.width.equalToSuperview()
            make.top.equalTo(selectDateTimeArea.snp_bottomMargin).offset(16)
            make.left.equalToSuperview()
        }
        descriptionTextfield.snp.makeConstraints { make in
            make.width.equalTo(descriptionArea).multipliedBy(0.92)
            make.height.equalTo(descriptionArea).dividedBy(2)
            make.centerX.equalTo(descriptionArea)
            make.centerY.equalTo(descriptionArea)
        }
        descriptionHeaderLabel.snp.makeConstraints { make in
            make.bottom.equalTo(descriptionTextfield.snp_topMargin).offset(-8)
            make.left.equalTo(descriptionTextfield.snp_leftMargin).offset(8)
        }
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
}
