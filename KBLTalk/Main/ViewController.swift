//
//  ViewController.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 12/04/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfPw: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViews()
    }

    func bindViews(){
        btnLogin.rx.tap
            .subscribe(onNext: {
                self.doLogin()
            }).disposed(by: disposeBag)
        btnRegister.rx.tap
            .subscribe(onNext: {
                self.doRegister()
            }).disposed(by: disposeBag)
    }
    
    
    func doLogin() {
        MainNetworkModel.doLogin(caller: NetworkRequestBuilder<NetworkResults>.init()
            .buildParameter(params:
                ["id":tfId.text!,
                 "pw":tfPw.text!])
            .buildFail{ errorString in
                print(errorString)
            }.buildSuccess { resultData in
                print(resultData)
                if resultData.result.resultCode == "001" {
                    self.performSegue(withIdentifier: "login", sender: self)
                }else {
                    let alert = UIAlertController(title: "로그인 에러", message:
                        resultData.result.resultMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
        })
    }
    
    func doRegister() {
        MainNetworkModel.doRegister(caller: NetworkRequestBuilder<NetworkResults>.init()
            .buildParameter(params:
                ["id":tfId.text!,
                 "pw":tfPw.text!,
                 "profilePath":"noData"])
            .buildFail{ errorString in
                print(errorString)
            }.buildSuccess { resultData in
                print(resultData)
                if resultData.result.resultCode == "001" {
                    self.tfId.text = ""
                    self.tfPw.text = ""
                    let alert = UIAlertController(title: "회원가입 성공", message:
                        resultData.result.resultMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }else {
                    let alert = UIAlertController(title: "회원가입 에러", message:
                        resultData.result.resultMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
        })
    }
}

