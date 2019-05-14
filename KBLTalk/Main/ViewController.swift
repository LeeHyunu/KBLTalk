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
    }
    
    
    func doLogin() {
        print("\(tfId.text!) \(tfPw.text!)")
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
}

