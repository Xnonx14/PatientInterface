//
//  SentencePage.swift
//  PatientInterface
//
//  Created by Kevin Chang on 5/25/17.
//  Copyright © 2017 KayGames. All rights reserved.
//

import Foundation

class SentencePage{
    static func update2(arr:Array<String>)->String{
        var str = "I advised patient to have "
        for i in 0..<arr.count{
            str = str + arr[i]
            
            if(i == arr.count - 1){
                break
            }else{
                str = str + ", "
            }
        }
        str = str + "."
        return str
    }
    
    static func update1(arr:Array<Int>,follow:Bool)-> String{
        if(arr.count == 3){ //the number of sentences to be constructed by the specific page
            let index1 = arr[0];
            let index2 = arr[1];
            let index3 = arr[2];
            
            var p1 = "";
            switch(index1){
            case 1:
                p1 = "Chest discomfort with exertion -"
                break;
            case 2:
                p1 = "Chest discomfort, non-exertional -"
                break;
            case 3:
                p1 = "Shortness of Breath -"
                break;
            case 4:
                p1 = "Palpitations -"
                break;
            case 5:
                p1 = "Syncope -"
                break;
            case 6:
                p1 = "Dizziness -"
                break;
            case 7:
                p1 = "HTN -"
                break;
            case 8:
                p1 = "Abnormal ECG -"
                break;
            case 9:
                p1 = "Cardiac clearance -"
                break;
            case 10:
                p1 = "Murmur -"
                break;
            case 11:
                p1 = "Atrial Fibrillation -"
                break;
            default:
                p1 = ""
            }
            
            var p2 = "";
            switch(index2){
            case 1:
                p2 = "Chest discomfort with exertion -"
                break;
            case 2:
                p2 = "Chest discomfort, non-exertional -"
                break;
            case 3:
                p2 = "Shortness of Breath -"
                break;
            case 4:
                p2 = "Palpitations -"
                break;
            case 5:
                p2 = "Syncope -"
                break;
            case 6:
                p2 = "Dizziness -"
                break;
            case 7:
                p2 = "HTN -"
                break;
            case 8:
                p2 = "Abnormal ECG -"
                break;
            case 9:
                p2 = "Cardiac clearance -"
                break;
            case 10:
                p2 = "Murmur -"
                break;
            case 11:
                p2 = "Atrial Fibrillation -"
                break;
            default:
                p2 = ""
            }
            
            var p3 = "";
            switch(index3){
            case 1:
                p3 = "Chest discomfort with exertion -"
                break;
            case 2:
                p3 = "Chest discomfort, non-exertional -"
                break;
            case 3:
                p3 = "Shortness of Breath -"
                break;
            case 4:
                p3 = "Palpitations -"
                break;
            case 5:
                p3 = "Syncope -"
                break;
            case 6:
                p3 = "Dizziness -"
                break;
            case 7:
                p3 = "HTN -"
                break;
            case 8:
                p3 = "Abnormal ECG -"
                break;
            case 9:
                p3 = "Cardiac clearance -"
                break;
            case 10:
                p3 = "Murmur -"
                break;
            case 11:
                p3 = "Atrial Fibrillation -"
                break;
            default:
                p3 = ""
            }
            
            var a1 = Array<String>()
            if(p1 != ""){
                a1.append(p1)
            }
            if(p2 != ""){
                a1.append(p2)
            }
            if(p3 != ""){
                a1.append(p3)
            }
            var combined = "\n\n"
            for i in 0 ..< a1.count{
                let temp = "(" + (i+1).description + ") " + a1[i] + "\n\n"
                combined = combined + temp
            }
            if(follow){
                combined = combined + "(" + (a1.count + 1).description + ") " + "Followup - \n\n"
            }
            
            return combined;
        }else{
            return "";
        }
    }
}
