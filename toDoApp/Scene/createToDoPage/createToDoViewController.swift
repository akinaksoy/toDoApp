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
    override func viewDidLoad() {
        super.viewDidLoad()
        makeDesign()
    }
    
    func makeDesign() {
        titleDescriptionLabel.text = "Title"
        view.backgroundColor = UIColor().setPurple2
        view.addSubview(titleArea)
        view.addSubview(titleTextfield)
        view.addSubview(titleDescriptionLabel)
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
            make.width.equalTo(titleArea).multipliedBy(0.90)
            make.height.equalTo(titleArea).dividedBy(2)
            make.centerX.equalTo(titleArea)
            make.centerY.equalTo(titleArea)
        }
        titleDescriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleTextfield.snp_topMargin).offset(-7)
            make.left.equalTo(titleTextfield.snp_leftMargin).offset(5)
        }
    }
}
