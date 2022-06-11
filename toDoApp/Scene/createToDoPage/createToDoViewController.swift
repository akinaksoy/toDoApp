//
//  createToDoViewController.swift
//  toDoApp
//
//  Created by Akın Aksoy on 6.06.2022.
//

import UIKit
import SnapKit
class createToDoViewController: UIViewController {
    //MARK: UIProperties
    var selectedToDoIndex = -1
    let titleArea = UIView()
    let titleHeaderLabel = Label.init().descriptionLabel
    let titleTextfield = TextField.init().textfield
    let titleWarningLabel = Label.init().warningLabel
    let selectDateTimeArea = UIView()
    let dateHeaderLabel = Label.init().descriptionLabel
    let datePicker = Datepicker.init().datePicker
    let descriptionArea = UIView()
    let descriptionTextfield = TextField.init().textfield
    let descriptionHeaderLabel = Label.init().descriptionLabel
    let descriptionWarningLabel = Label.init().warningLabel
    var saveButton = Button.init().saveButton
    
    @objc func clickedOnSaveButton(){
        guard let titleText = titleTextfield.text else { return }
        guard let descriptionText = descriptionTextfield.text else {return}
        let dateValue = datePicker.date
        let textFieldStatuses = checkTextfieldsEmpty()
        if textFieldStatuses == [false,false]{
            if selectedToDoIndex == -1 {
                createToDoViewModel.shared.saveDataToStorage(title: titleText, description: descriptionText, date: dateValue )
                navigationController?.popViewController(animated: true)
            }else{
                createToDoViewModel.shared.editDataForStorage(index: selectedToDoIndex, title: titleText, description: descriptionText, date: dateValue)
                navigationController?.popViewController(animated: true)
            }
        }else{
            // 0. index is title textfield / 1. index is description textfield
            if textFieldStatuses[0] == true {
                updateWarningLabelforTitleTextfield()
                titleWarningLabel.text = "Please Enter a title"
            }
            if textFieldStatuses[1] == true {
                updateWarningLabelforDescriptionTextfield()
                descriptionWarningLabel.text = "Please Enter a description"
            }
        }
        
     }
    //MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextfield.delegate = self
        descriptionTextfield.delegate = self
        configureNavigationBar()
        title = "Create new ToDo Item"
        if selectedToDoIndex >= 0 {
            title = "Edit ToDo Item"
            configurePageForEdit(toDoItem: createToDoViewModel.shared.getDataForEdit(index: selectedToDoIndex))
        }
        makeDesign()
    }
    //MARK: Common Functions
    func configureNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor().setGold]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor().setGold]
        appearance.backgroundColor = UIColor().setPurple2
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    func checkTextfieldsEmpty() -> [Bool]{
        var textfieldsIsEmptyList : Array = [Bool]()
        if let titleText = titleTextfield.text, titleText.count > 0 {
            textfieldsIsEmptyList.append(false)
        }else {
            textfieldsIsEmptyList.append(true)
        }
        if let descriptionText = descriptionTextfield.text, descriptionText.count > 0 {
            textfieldsIsEmptyList.append(false)
        }else {
            textfieldsIsEmptyList.append(true)
        }
        return textfieldsIsEmptyList
    }
    //MARK: ViewConfigure Functions
    func makeDesign() {
        titleHeaderLabel.text = "Title"
        dateHeaderLabel.text = "Select Date"
        descriptionHeaderLabel.text = "Description"
        saveButton.setDisabled()
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
    
    func updateWarningLabelforTitleTextfield(){
        view.addSubview(titleWarningLabel)
        titleWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextfield.snp_bottomMargin).offset(7)
            make.right.equalTo(titleTextfield.snp_rightMargin).offset(-2)
        }
    }
    func updateWarningLabelforDescriptionTextfield(){
        view.addSubview(descriptionWarningLabel)
        descriptionWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextfield.snp_bottomMargin).offset(7)
            make.right.equalTo(descriptionTextfield.snp_rightMargin).offset(-2)
        }    }
    func configurePageForEdit(toDoItem : ToDo) {
        titleTextfield.text = toDoItem.title
        datePicker.date = toDoItem.date
        descriptionTextfield.text = toDoItem.description
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
//MARK: -- Textfield Extension
extension createToDoViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextfield.endEditing(true)
        descriptionTextfield.endEditing(true)
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if titleTextfield.isEditing {
            checkTitleTextfieldTextCount()
        }
        if descriptionTextfield.isEditing {
            checkDescriptionTextfieldTextCount()
        }
        return true
    }
    func checkTitleTextfieldTextCount(){
        guard var titleText = titleTextfield.text else {return}
        if titleText.count > 120{
            titleWarningLabel.removeFromSuperview()
            updateWarningLabelforTitleTextfield()
            titleWarningLabel.text = "Title must be less than 120 character"
            titleText.removeLast()
            titleTextfield.text = titleText
            saveButton.setDisabled()
        }
        else {
            if checkTextfieldsEmpty() == [false,false]{
                saveButton.setEnabled()
            }
            titleWarningLabel.removeFromSuperview()
        }
    }
    func checkDescriptionTextfieldTextCount(){
        guard var descriptionText = descriptionTextfield.text else {return}
        if descriptionText.count > 80{
            updateWarningLabelforDescriptionTextfield()
            descriptionWarningLabel.text = "Description must be less than 80 character"
            descriptionText.removeLast()
            descriptionTextfield.text = descriptionText
            saveButton.setDisabled()
        }
        else {
            if checkTextfieldsEmpty() == [false,false]{
                saveButton.setEnabled()
            }
            descriptionWarningLabel.removeFromSuperview()
        }
    }
}
