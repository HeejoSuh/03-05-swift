
//------------------------------------------------//
//  MagicSquare.swift
//
//  This program creates the magic square of numbers
//
//
//  Created by Heejo Suh in May 2018
//  Copyright @ 2018 MTHS. All rights reserved.
//
//			swiftc MagicSquare.swift

//------------------------------------------------

public class MagicSquare {
	
    //--------------------------
	func isMagic(squares: [Int]) -> Bool {
	//literally check every row & column if the total equals 15

    	if ((squares.count == 9) && 
    		//horizontally
    		(squares[0] + squares[1] + squares[2] == 15) && 
    		(squares[3] + squares[4] + squares[5] == 15) && 
    		(squares[6] + squares[7] + squares[8] == 15) && 
    		//vertically
    		(squares[0] + squares[3] + squares[6] == 15) && 
    		(squares[1] + squares[4] + squares[7] == 15) && 
    		(squares[2] + squares[5] + squares[8] == 15) && 
    		//Crossing
    		(squares[2] + squares[4] + squares[6] == 15) &&
    		(squares[0] + squares[4] + squares[8] == 15)
    		) {
	    		return true
    	} else {
    		//nope
    		return false
    	}
	}
	
    //--------------------------
	func showSquare(squares: [Int]) {
		//Shows the magic square
	
		for index in 0..<squares.count {
		    if (index==0 || index==3 || index==6) {
		    	//new line
		    	print("\n------------")
		    }
	    print(squares[index], terminator: " | ")
	    }
		print(" ");
	}
	
    //--------------------------
	func swap(squares: [Int], pos1: Int, pos2: Int) -> [Int] {
	//Swap inputs
	
		let init1: Int = squares[pos1]
		var copy = squares
		copy[pos1] = copy[pos2]
		copy[pos2] = init1
		
		return copy
	}
	
    //--------------------------
	func modify(squares: [Int], start: Int, end: Int) {
		//Modifies the square using recursion
	
		var copy = squares
	
		if start == end && isMagic(squares: copy) {
    		//if have checked for magic square and modified every number
			showSquare(squares: copy)
		} else {
	
			if start <= end {
				for index in start...end {
    			//swap number
				copy = swap(squares: copy, pos1: start, pos2: index)
    			//check again
    			//recursion with next number
				modify(squares: copy, start: start + 1, end: end)
    			//swap number again
				copy = swap(squares: copy, pos1: start, pos2: index)
				}
			}
		}
	}
    //--------------------------
}

//=============================

//run program
var intArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]

let getSquare = MagicSquare()
getSquare.modify(squares: intArray, start: 0, end: 8)//start index is 0, end index is 8 (not 9)


