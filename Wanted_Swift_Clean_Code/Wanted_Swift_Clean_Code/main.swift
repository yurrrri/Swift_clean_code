//
//  main.swift
//  Wnated_project_iOS_clean_code
//
//  Created by 이유리 on 2023/05/01.
//

import Foundation

var student_dic:[String:[String:String]] = [:] //학생이름 : 과목 평점
var score_dic:[String:Double] = ["A+":4.5, "A":4.0, "B+":3.5, "B":3.0, "C+":2.5, "C":2.0, "D+":1.5, "D":1.0, "F":0.0]

while true {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
    let read = readLine()
    if let input = read, input.allSatisfy({ $0.isNumber }) && 1...5 ~= Int(input)! {
        switch Int(input)! {
        case 1:
            print("추가할 학생의 이름을 입력해주세요")
            if let input = readLine(), !input.isEmpty {
                if student_dic[input] != nil {
                    print("\(input)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
                } else {
                    student_dic[input] = [:]
                    print("\(input) 학생을 추가했습니다.")
                }
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
        case 2:
            print("삭제할 학생의 이름을 입력해주세요")
            
            if let input = readLine(), !input.isEmpty {
                if student_dic[input] != nil {
                    print("\(input) 학생을 삭제하였습니다.")
                    student_dic[input] = nil //학생 삭제
                } else {
                    print("\(input) 학생을 찾지 못했습니다.")
                }
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
        case 3:
            print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            print("입력예) Mickey Swift A+")
            print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
            
            if let input = readLine()?.split(separator: " ").map({ String($0) }) {
                if input.allSatisfy({ !$0.isEmpty }) {
//                    student_dic[input[0]]![input[1]]
                } else{
                    print("입력이 잘못되었습니다. 다시 확인해주세요.")
                }
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
        case 4:
            print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            print("입력예) Mickey Swift")
            
            if let input = readLine()?.split(separator: " ").map({ String($0) }) {
                if input.allSatisfy({ !$0.isEmpty }) {
                    if student_dic[input[0]] == nil {
                        print("\(input[0]) 학생을 찾지 못했습니다.")
                    } else if student_dic[input[0]]![input[1]] == nil {
                        print("\(input[1]) 과목을 찾지 못했습니다.")
                    } else {
                        student_dic[input[0]]![input[1]] = nil
                    }
                } else{
                    print("입력이 잘못되었습니다. 다시 확인해주세요.")
                }
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
        case 5:
            print("평점을 알고싶은 학생의 이름을 입력해주세요")
            
            if let input = readLine() {
                if !input.isEmpty {
                    if student_dic[input] == nil {
                        print("\(input) 학생을 찾지 못했습니다.")
                    } else {
                        var sum = 0.0
                        print(input)
                        for (k, v) in student_dic[input]! {
                            print("\(k): \(v)")
                            sum += score_dic[v]!
                        }
                        print(sum/Double(student_dic[input]!.values.count))
                    }
                } else{
                    print("입력이 잘못되었습니다. 다시 확인해주세요.")
                }
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
            
        default:
            break
        }
    } else if let input = read, input == "X"{
        print("프로그램을 종료합니다...")
        exit(0)
    }
    else {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

