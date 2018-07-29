//
//  ViewController.swift
//  TableGroup
//
//  Created by NoDack on 29/07/2018.
//  Copyright © 2018 zuzero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: Properties
    
    /// 문자열 데이터를 저장할 배열
    var data: Array<String> = []
    
    /// 한글 자음들을 저장할 배열생성
    var indexes: Array<String> = []
    
    /// data 를 자음 별로 분류해서 저장할 딕셔너리의 배열을 생성
    var sectionData: Array<Dictionary<String, Any>> = []
    
    
    // MARK: Methods
    
    /// 문자열을 받아서 문자열을 리턴하는 메소드
    func subtract(data: String) -> String {
        // 한글만 있는 경우라면 '나' 보다 작으면 'ㄱ' 입니다.
        var result = data.compare("나")
        
        if ComparisonResult.orderedAscending == result {
            return "ㄱ"
        }
        
        result = data.compare("다")
        
        if ComparisonResult.orderedAscending == result {
            return "ㄴ"
        }
        
        result = data.compare("라")
        
        if ComparisonResult.orderedAscending == result {
            return "ㄷ"
        }
        
        
        result = data.compare("마")
        
        if ComparisonResult.orderedAscending == result {
            return "ㄹ"
        }
        
        result = data.compare("바")
        
        if ComparisonResult.orderedAscending == result {
            return "ㅁ"
        }
        
        result = data.compare("사")
        
        if ComparisonResult.orderedAscending == result {
            return "ㅂ"
        }
        
        result = data.compare("아")
        
        if ComparisonResult.orderedAscending == result {
            return "ㅅ"
        }
        
        result = data.compare("자")
        
        if ComparisonResult.orderedAscending == result {
            return "ㅇ"
        }
        
        result = data.compare("차")
        
        if ComparisonResult.orderedAscending == result {
            return "ㅈ"
        }
        
        result = data.compare("카")
        
        if ComparisonResult.orderedAscending == result {
            return "ㅊ"
        }
        
        result = data.compare("타")
        
        if ComparisonResult.orderedAscending == result {
            return "ㅋ"
        }
        result = data.compare("파")
        
        if ComparisonResult.orderedAscending == result {
            return "ㅌ"
        }
        result = data.compare("하")
        
        if ComparisonResult.orderedAscending == result {
            return "ㅍ"
        }
        return "ㅎ"
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.data = ["스위프트", "오브젝씨", "에스큐엘", "자바", "자바스크립트", "씨", "씨샵", "씨플플", "안드로이드"]
        
        self.indexes = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
        
        // data의 모든 요소들의 첫글자 자음을 찾아와서 동일한 첫글자 자음을 갖는 데이터끼리 배열로 만들기
        var temp: [[String]] = Array(repeating: Array(), count: 14)
        
        var i = 0
        for idx in self.indexes {
            // 인덱스 배열에서 글자 가져오기
            let firstName = idx
            
            for dataIdx in self.data {
                // data 배열에서 데이터 가져오기
                let str = dataIdx
                // 데이터와 자음 비교
                if firstName == subtract(data: str) {
                    temp[i].append(str)
                }
                
            }
            i = i + 1
        }
        
        // print(temp)
        
        // 2차워 배열의 결과값을 딕셔너리 배열로 변환해보자
        for i in 0..<self.indexes.count {
            // 이차원 배열을 순회하면서 데이터가 있는 경우
            if temp[i].count > 0 {
                // 딕셔너리를 생성해서 값 셋팅
                var dic: Dictionary<String, Any> = [:]
                dic["section_name"] = self.indexes[i]
                dic["data"] = temp[i]
                sectionData.append(dic)
            }
        }
        
        print(sectionData)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 섹션 개수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    
    // 섹션의 헤더 타이틀을 설정 - numberOfSection(in:) 과 함께 구현 됩니다.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // section 의 인덱스
        let dic = self.sectionData[section]
        // Any 타입에 대한 형변환
        let sectionName = (dic["section_name"] as! NSString) as String
        
        return sectionName
    }
    
    // 섹션별 행의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let dic = self.sectionData[section]
        
        let ar = (dic["data"] as! NSArray) as Array
        
        return ar.count
    }
    
    // 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        var dic = self.sectionData[indexPath.section]
        
        let dataArr = (dic["data"] as! NSArray) as Array
        
        cell?.textLabel?.text = (dataArr[indexPath.row] as! NSString) as String
        
        return cell!
        
    }
}







