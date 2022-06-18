//
//  CreateToDo+Textfield.swift
//  toDoApp
//
//  Created by Akın Aksoy on 18.06.2022.
//

import Foundation
import UIKit
// MARK: - Textfield Extension
extension CreateToDoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextfield.endEditing(true)
        descriptionTextfield.endEditing(true)
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if titleTextfield.isEditing {
            guard let oldTextString = titleTextfield.text else {
                return true
            }
            let oldText = oldTextString as NSString
            let newString = oldText.replacingCharacters(in: range, with: string)
            checkTitleTextfieldTextCount(title : newString)
        }
        if descriptionTextfield.isEditing {
            guard let oldTextString = descriptionTextfield.text else {
                return true
            }
            let oldText = oldTextString as NSString
            let newString = oldText.replacingCharacters(in: range, with: string)
            checkDescriptionTextfieldTextCount(description: newString)
        }
        return true
    }
    func checkTitleTextfieldTextCount(title : String) {
        var titleText = title
        if titleText.count > 60 {
            titleWarningLabel.removeFromSuperview()
            updateWarningLabelforTitleTextfield()
            titleWarningLabel.text = "Title must be less than 60 character"
            titleText.removeLast()
            titleTextfield.text = titleText
            saveButton.setDisabled()
        } else if titleText.count < 5 {
            titleWarningLabel.removeFromSuperview()
            updateWarningLabelforTitleTextfield()
            titleWarningLabel.text = "Title must be more than 5 character"
            saveButton.setDisabled()
        } else {
            if checkTextfieldsEmpty() == [false, false] {
                saveButton.setEnabled()
            }
            titleWarningLabel.removeFromSuperview()
        }
    }
    func checkDescriptionTextfieldTextCount(description : String) {
        var descriptionText = description
        if descriptionText.count > 120 {
            updateWarningLabelforDescriptionTextfield()
            descriptionWarningLabel.text = "Description must be less than 120 character"
            descriptionText.removeLast()
            descriptionTextfield.text = descriptionText
            saveButton.setDisabled()
        } else if descriptionText.count < 5 {
            descriptionWarningLabel.removeFromSuperview()
            updateWarningLabelforDescriptionTextfield()
            descriptionWarningLabel.text = "Description must be more than 5 character"
            saveButton.setDisabled()
        } else {
            if checkTextfieldsEmpty() == [false, false] {
                saveButton.setEnabled()
            }
            descriptionWarningLabel.removeFromSuperview()
        }
    }
}
