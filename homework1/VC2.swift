//
//  VC2.swift
//  homework1
//
//  Created by 오소영 on 2017. 3. 28..
//  Copyright © 2017년 오소영. All rights reserved.
//

import UIKit

class VC2 : UIViewController {
    /*
     과제 개요: 우리가 흔히 알고있는 좋아요 버튼 구현입니다.
     일단 좋아요가 눌려있는 상태인지, 아닌지 판별해주는 check 프로퍼티가 필요하겠죠?
     이 check 프로퍼티를 이용해 적절히 if 문으로 분기해주신후에 좋아요가 눌려있을때와 눌려있지 않을 때를 구분해 코드를 작성해주세요!
     여러분이 해주실건 clickEvent 함수 내부에 있는 분기문을 채워주시는 거에요!
     딱 두군데만 채워주시면돼요! if check 블록과 else 블록!
     
     
     */
    
    @IBOutlet var likeTxt: UILabel!
    @IBOutlet var cntTxt: UILabel!
    @IBOutlet var likeBtn: UIButton!
    
    //named:"Asset폴더에 있는 사진파일 이름"
    //이미지를 변수로 선언하려면 아래와 같은 구문이 필요합니다
    let heart : UIImage = UIImage(named:"heart")!
    let no_heart : UIImage = UIImage(named:"no-heart")!
    
    //좋아요 개수를 담는 변수
    var cnt : Int = 0
    //버튼이 클릭되어 있는지 확인해주는 변수(if문 분기를 위해 사용합니다)
    var check : Bool = false
    
    override func viewDidLoad() {
        
        //뷰가 처음 로드 되었을때는 좋아요가 눌려있지 않은 상태이고, 이때는 좋아요 텍스트를 숨겨줘야해요
        //좋아요 버튼을 클릭했을 때만 나타나게!
        likeTxt.isHidden = true
        
        //뷰가 로드 되자마자 버튼에 이벤트함수를 바로 달아주어야겠죠?
        //실습 프로젝트에서 3번째 예제에서 설명드렸던 부분입니다.
        //자세한 설명은 보충세미나 또는 정규세미나때 드릴테니 일단은 이함수를 있는 그대로 사용해주세요
        //clickEvent 함수 내부만 작성해주시면 됩니다
        likeBtn.addTarget(self, action: #selector(clickEvent(_:)), for: .touchUpInside)
        
    }
    
    
    // @IBAction이 아니라 @IBOutlet에 이벤트를 다는 방법을 설명해드렸죠?
    // @IBOutlet에 동적으로 붙일 clickEvent 함수를 정의해놓았습니다
    
    func clickEvent(_ sender:UIButton){
        
        //좋아요버튼이 눌려있는 상태에서 클릭했을 때
        //즉 좋아요 -> 기본 상태로 갈때의 상황이겠죠?
        
        if check{
            
            //좋아요가 눌려있는 상태에서 다시 좋아요 버튼을 눌렀으니 좋아요 개수가 줄어들어야겠죠?
            //이미지도 속이 비어있는 하트로 바뀌어야할테고
            //상태가 달라졌으니 check 값도 변경해주어야 하구요
            //만약 좋아요 개수가 0보다 작으면 좋아요 개수를 0으로 조정해주세요
            //라벨에는 문자열 템플릿을 이용해 cnt값을 출력해주시면 됩니다
            
            likeBtn.setImage(no_heart, for: UIControlState.normal)
            cnt -= 1
            cntTxt.text = "\(cnt)"
            likeTxt.isHidden = true
            check = false
        }
            
            //좋아요버튼이 눌려있지 않은 상태에서 클릭했을 때
            //기본 -> 좋아요 상태로 갈때의 상황이겠죠?
        else{
            
            //좋아요가 눌려있지 않은 상태에서 클릭을 했으니 "좋아요!" 라는 문자열이 나타나야겠죠?
            //이미지도 색깔이 칠해진 하트로 바꿔주셔야하구요
            //좋아요를 눌렀으니 check 변수값도 수정이 필요하겠죠?
            //물론 cnt값도 += 연산자를 이용해 1만큼 증가시켜주어야 바꿔주셔야하구요
            //마찬가지로 좋아요 개수가 0보다 작아지는 예외를 막아주셔야야하구요
            //라벨에 계산된 cnt 값을 출력해주세요
            
            likeBtn.setImage(heart, for: UIControlState.normal)
            cnt += 1
            cntTxt.text = "\(cnt)"
            likeTxt.isHidden = false
            check = true
        }
    }

}
