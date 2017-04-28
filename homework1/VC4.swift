//
//  VC4.swift
//  homework1
//
//  Created by 오소영 on 2017. 3. 29..
//  Copyright © 2017년 오소영. All rights reserved.
//

import UIKit

class VC4 : UIViewController {
    
    /*
     이미지뷰가 동적으로 변하는 과정과 다음과 같습니다
     
     step 1. 일단 가장 처음 뷰가 로드되었을 때, 이미지 뷰들의 y좌표값과 높이값을 저장해놓는 구조체가 필요해요
     
     step 2. 버튼클릭으로 이미지뷰들의 크기를 조절할 때는 뷰들을 항상 setDefault로 기본값상태로 만들어 준 이후에  가수별로 알맞게 clickedZionT(),clickedGiri(),clickedHeize 함수를 호출해주어야 합니다. 이유는 직접 해보시면 아실수 있으실거에요!
     
     step 3. 핵심은 각각 이미지뷰의 Y point (imageView.frame.origin.y)와 Height(imageView.frame.size.height)만 적절히 잘 변화시켜주면 된다는것입니다. 다른 것들은 수정할 필요가 전혀 없어요!
     
     */
    
    @IBOutlet var zionT: UIImageView!
    @IBOutlet var giriBoy: UIImageView!
    @IBOutlet var heize: UIImageView!
    @IBOutlet var resetBtn: UIButton!
    
    //구조체 초기화
    var defaultValue = defaultValueSet()
    
    //디폴트 높이 값을 담아 놓는 구조체
    struct defaultValueSet{
        var originZiontYpoint : CGFloat?
        var originZiontHeight : CGFloat?
        var originGiriYpoint : CGFloat?
        var originGiriHeight : CGFloat?
        var originHeizeYpoint : CGFloat?
        var originHeizeHeight : CGFloat?
    }
    
    @IBAction func ziont(_ sender: Any) {
        setDefaultValue()
        clickedZionT()
    }
    @IBAction func giriboy(_ sender: Any) {
        setDefaultValue()
        clickedGiri()
    }
    @IBAction func heize(_ sender: Any) {
        setDefaultValue()
        clickedHeize()
    }
    
    //자이언티를 클릭했을 때 호출되는 함수
    func clickedZionT(){
        
        //step 1. 먼저 자이언티 이미지뷰의 크기를 두배로 늘려주시구요!
        zionT.frame.size.height = zionT.frame.size.height*2.0
        //step 2. 기리보이 이미지뷰는 자이언티 이미지뷰 바닥에 붙어야겠죠?
        giriBoy.frame.origin.y = zionT.frame.origin.y + zionT.frame.size.height
        //stpe 3. 기리보이 이미지뷰는 2배로 줄여주시구요
        giriBoy.frame.size.height /= 2
        //stpe 4. 마찬가지로 헤이즈 이미지뷰도 기리보이뷰 바닥에 붙여야겠죠?
        heize.frame.origin.y = giriBoy.frame.origin.y + giriBoy.frame.size.height
        //step 5. 이번에는 헤이즈 이미지뷰를 2배로 줄여주세요!
        heize.frame.size.height = heize.frame.size.height / 2
        
    }
    
    //기리보이를 클릭했을 때 호출되는 함수
    func clickedGiri(){
        
        /*
         어떻게 해야 기리보이 뷰가 가운데에서 두배로 늘어날까요?
         뷰를 조정하는 순서도 중요하니 단게별로 잘 생각해서 코드를 작성해보세요!
         */
        
        //step 1. 자이언티 이미지뷰의 크기가 2배로 줄어들고, 기리보이 이미지뷰가 자이언티 이미지뷰의 바닥에 붙으면서, 기리보이 이미지뷰의 크기가 2배로 커져야해요!
        zionT.frame.size.height = zionT.frame.size.height / 2
        giriBoy.frame.origin.y = zionT.frame.origin.y + zionT.frame.size.height
        giriBoy.frame.size.height = giriBoy.frame.size.height*2.0
        
        //step 2.기리보이 이미지뷰가 2배로 커진다음, 헤이즈 이미지뷰는 기리보이 이미지뷰 바닥에 붙어야겠죠?, 헤이즈 이미지뷰 y 좌표를 조절해 주어야겠네요!, 다음은 헤이즈뷰 이미지를 2배로 줄여주세요~
        heize.frame.origin.y = giriBoy.frame.origin.y + giriBoy.frame.size.height
        heize.frame.size.height = heize.frame.size.height / 2
    }
    
    //헤이즈를 클릭했을 떄 호출되는 함수
    func clickedHeize(){
        zionT.frame.size.height = zionT.frame.size.height / 2
        giriBoy.frame.origin.y = zionT.frame.origin.y + zionT.frame.size.height
        giriBoy.frame.size.height = giriBoy.frame.size.height / 2
        heize.frame.origin.y = giriBoy.frame.origin.y + giriBoy.frame.size.height
        heize.frame.size.height = heize.frame.size.height*2.0
        
    }
    
    //구조체에 디폴트 높이 값을 담아 놓는 함수
    func getDefaultValue(){
        //일단 자이언티 이미지뷰의 디폴트 y좌표값과 높이값을 가져와보았어요
        defaultValue.originZiontYpoint = zionT.frame.origin.y
        defaultValue.originZiontHeight = zionT.frame.size.height
        
        defaultValue.originGiriYpoint = giriBoy.frame.origin.y
        defaultValue.originGiriHeight = giriBoy.frame.size.height
        
        defaultValue.originHeizeYpoint = heize.frame.origin.y
        defaultValue.originHeizeHeight = heize.frame.size.height
    }
    
    //이미지뷰들을 기존의 y좌표값과 높이값을 가지도록 변화시켜주는 함수
    func setDefaultValue(){
        
        //현재 뷰들의 y좌표와 높이값을 처음에 구조체에 저장해놓은 기본값으로 설정해줍니다
        
        zionT.frame.origin.y = defaultValue.originZiontYpoint!
        zionT.frame.size.height = defaultValue.originZiontHeight!
        giriBoy.frame.origin.y = defaultValue.originGiriYpoint!
        giriBoy.frame.size.height = defaultValue.originGiriHeight!
        heize.frame.origin.y = defaultValue.originHeizeYpoint!
        heize.frame.size.height = defaultValue.originHeizeHeight!
        
    }
    
    override func viewDidLoad() {
        //뷰가 로드 되자마자
        //getDefaultValue 함수를 호출해서 이미지뷰 3개의 좌표와 높이 기본값들을 저장해놓습니다
        //그래야 나중에 reset버튼을 눌렀을때 뷰들이 제자리를 찾아갈 수 있겠져?
        getDefaultValue()
        
        
        //setDefalut 버튼에 addTarget 함수를 이용해 3개의 이미지뷰를 초기상태로 돌리는 함수 이벤트를 추가해놓습니다
        //addTarget(적용할대상,action:#selector(이벤트발생시호출할함수),for:이벤트종류)
        //1차세미나에서 설명드리지 못한 부분이니 일단 사용해주세요! 정규세미나 또는 보충세미나에서 자세히 설명드리겠습니다
        resetBtn.addTarget(self, action: #selector
            (setDefaultValue), for: .touchUpInside)
        
    }
}
