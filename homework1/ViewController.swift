//
//  ViewController.swift
//  homework1
//
//  Created by 오소영 on 2017. 3. 27..
//  Copyright © 2017년 오소영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var idTxt: UITextField!
    @IBOutlet var pwTxt: UITextField!
    
    //사용자 아이디와 비밀번호는 임의로 정의해주세요
    let userID = "sopt"
    let userPW = "1234"
    
    var id : String?
    var pw : String?
    
    @IBAction func loginBtn(_ sender: Any) {
        
        //옵셔널 비강제 해제
        guard let id = idTxt.text, let pw = pwTxt.text else{
            return
        }
        //ex. id를 입력받는 UITextField가 비어있는 경우의 처리 방법입니다.
        if id.isEmpty {
            simpleAlert(title: "입력 오류", message: "ID를 입력해주세요.")
            return
        }
        else if pw.isEmpty {
            simpleAlert(title: "입력 오류", message: "PW를 입력해주세요.")
            return
        }
        else if id != userID {
            simpleAlert(title: "등록 오류", message: "ID가 등록되지 않았습니다.")
            return
        }
        else if pw != userPW {
            simpleAlert(title: "로그인 오류", message: "PW가 틀렸습니다.")
            return
        }
        else {
            simpleAlert(title: "로그인 성공", message: "\(userID)님 환영합니다!")
        }
    }
    
    //ID와 PW를 비교하는 메소드입니다. Bool 값을 반환하므로 조건문에서 분기를 해서 사용하세요!
    //loginBtn에서 if문을 분기할때 활용하면 되겠죠?
    func isValid() -> Bool {
        print("id&pw 검색 이벤트를 넣어줍니다.")
        return true
    }
    
    ////단순한 Alert 창을 띄우는 메소드입니다. 매번 Alert를 띄울 때마다 아래의 코드들을 적으면 가독성이 떨어지고 비효율적이니 메소드로 만들어 관리합니다.
    func simpleAlert(title:String, message msg:String){
        //UIalertController 는 알림창 객체입니다.
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        //알림창에는 확인,취소 등과 같은 선택버튼이 있겠죠? UIAlertAction는 선택사항버튼(옵션)들을 가지고 있는 객체입니다
        let okAction = UIAlertAction(title:"확인",style:.default)
        //취소선택 버튼은 다음과 같이 만들수 있습니다
        let cancelAction = UIAlertAction(title:"취소",style:.cancel)
        
        
        //알림창 객체에, okAction 객체를 추가해줍니다. okAction은 "확인" 이라는 선택 버튼을 가지고 있는 객체입니다
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        // alert알림창에 addAction을 통해서 선택사항 버튼들을 추가해주었으니 알림창을 화면에 띄워주어야겠죠?
        //알림창의 화면에 띄워주는 함수가 바로 present 함수입니다.
        //present 함수는 알림창을 띄울 때 뿐만 아니라 화면을 전환할 때도 사용합니다. 즉 새로운 뷰 컨트롤러를 화면에 띄우는 원리입니다
        
        
        //animated:true
        //위의 매개변수는 present 함수를 통해 화면에 알림창을 띄우면서 애니메이션 효과를 허용할지, 허용하지 않을지에 대한 Bool 형 매개변수입니다.
        //이런 함수를 보면 스위프트에서 굳이 외부매개변수를 사용하는 이유를 알 것 같지 않나요
        //다른 개발자들이 보기에 내가 전달하는 인자값이(매개변수)가 이 함수에게 어떤 의미를 가지고, 어떻게 동작시키게 하는지 직관적으로 알 수 있게 해주는 것 같아요
        present(alert,animated: true)
        
        
    }

}

