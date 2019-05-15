//
//  AddFriendViewController.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 15/04/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddFriendViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lUserName: UITextField!
    @IBOutlet weak var PiSex: NPicker!
    @IBOutlet weak var PiDate: UIDatePicker!
    
    let disposeBag = DisposeBag()
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        bindViews()
    }
    
    //MARK: - init viewInfos
    func setViews() {
        PiSex.setArrays(["MAN","WOMAN"])
        
    }
    
    func bindViews() {
        btnBack.rx.tap
            .subscribe(onNext: {
                self.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
    
    //MARK: - register
    @IBAction func doRegister(_ sender: Any) {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .short
        dateformatter.timeStyle = .none
        
        guard let userName = lUserName.text, userName.count > 0 else {
            print("사용자 이름을 입력해주세요")
            return
        }
        
        let alert = UIAlertController(title: "가입자 정보 확인", message:
            "가입자명: \(userName)\n성별: \(PiSex.mSelectedValues)\n생년월일: \(dateformatter.string(from: PiDate.date))", preferredStyle: .alert)
        print(alert.view.frame)
        print(alert.preferredContentSize)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: {
            (UIAlertAction) in
            ChatRoomNetworkModel.addFriends(caller: NetworkRequestBuilder<NetworkResults>.init()
                        .buildParameter(params:
                            ["id": userName,
                             "profilePath":"noData"])
                        .buildFail { errorString in
                            print(errorString)
                        }.buildSuccess { resultData in
                            print(resultData)
                            self.dismiss(animated: true, completion: nil)
                    })
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - Delegates
    //keyboard hide when clicked returnButton
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //onTouche screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
