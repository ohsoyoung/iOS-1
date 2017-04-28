//
//  VC3.swift
//  homework1
//
//  Created by 오소영 on 2017. 3. 28..
//  Copyright © 2017년 오소영. All rights reserved.
//

import UIKit

class VC3 : UIViewController {
    
    @IBOutlet var colorTxt: UITextField!
    @IBOutlet var redView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var blueView: UIView!
    
    //라벨 객체 생성
    var colorLabel : UILabel = UILabel()
    
    @IBAction func enterBtn(_ sender: Any) {
        //텍스트필드로 부터 입력받은 색깔의 정보를 담은 문자열 변수
        let colorText : String? = colorTxt.text
        
        //옵셔널 바인딩
        //clolorText는 nil값이 될 가능성이 있으므로 비강제해제 해줍니다
        //guard let 구문의 한계는 자신을 감싸는 코드블록, 즉 return,break,continue,throw 등의 제어문 전환 명령어를 쓸수 없는 상황이라면 사용이 불가능합니다
        //즉 함수의 바깥에서는 사용이 불가능해요
        guard let color = colorText else{
            return
        }
        
        //처음에 생성된 라벨 객체와, color를 인자로 전달
        labelToCenter(colorLabel,color)
    }
    
    //생성된 라벨의 정보를 받아 각각 색깔에 맞는 뷰의 정 가운데로 이동시켜주는 함수
    func labelToCenter(_ label:UILabel, _ color:String){
        var centerX : CGFloat = 0
        var centerY : CGFloat = 0
        var centerXY : CGPoint = CGPoint(x:0,y:0)
        
        if color == "red"{
            //입력받은 컬러 문자열을 이용해 라벨 정보 생성
            label.text = color
            label.textColor = .white
            label.font.withSize(30.0)
            //라벨에 있는 글씨크기와 숫자에 맞게 버튼 크기를 동적으로 줄여주는 메소드
            label.sizeToFit()
            
            
            // ex) 참고로 redView.frame.size.height/2, redView.frame.size.widt/2 는  redView의 정중앙 좌표입니다
            // redView 의 정중앙 좌표를 label의 좌표로 설정하면 label이 정중앙으로 오지 않게돼요
            // 이 부분을 잘 생각해보시고 centerX와 centerY 값을 설정해주세요
            
            // ex)label.frame.origin.x, label.frame.origin.y 는 라벨의 x,y 좌표이고 이는 라벨을 왼쪽 상단을 기준으로 합니다
            
             // centerX와 centerY는 라벨이 view의 정중앙에 위치하게 하는 좌표값입니다!
             centerX = redView.frame.size.width/2 - label.bounds.width/2
             centerY = redView.frame.size.height/2 - label.bounds.height/2
            
            //정의한 좌표값들을 이용해 라벨이 정중앙에 위치하게 하는 좌표 생성
            centerXY = CGPoint(x:centerX, y:centerY)
            //라벨 좌표 설정
            label.frame.origin = centerXY
            //각각의 뷰에라벨을 추가해줍니다
            redView.addSubview(label)
            label.isHidden = false
            return
        }
        else if color == "green" {
            label.text = color
            label.textColor = .white
            label.font.withSize(30.0)
            label.sizeToFit()
            
            centerX = greenView.frame.size.width/2 - label.bounds.width/2
            centerY = greenView.frame.size.height/2 - label.bounds.height/2
            centerXY = CGPoint(x:centerX, y:centerY)
            
            label.frame.origin = centerXY
            greenView.addSubview(label)
            label.isHidden = false
            return
        }
        else if color == "blue" {
            label.text = color
            label.textColor = .white
            label.font.withSize(30.0)
            label.sizeToFit()
            
            centerX = blueView.frame.size.width/2 - label.bounds.width/2
            centerY = blueView.frame.size.height/2 - label.bounds.height/2
            centerXY = CGPoint(x:centerX, y:centerY)
            
            label.frame.origin = centerXY
            blueView.addSubview(label)
            label.isHidden = false
            return
        }
        else {
            //알림창 띄워서 예외처리
            simpleAlert(title: "Error", message: "red, green, blue 중 하나를 입력해주세요")
            label.isHidden = true
            return
        }
    }
    
    //알림창 구현함수
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
