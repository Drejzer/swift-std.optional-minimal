// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import cxxtarg

var test = opt_test.optTestStruct()//the other constructors only take nil or nullopt_t, so it's the same anyway
var test2:opt_test.optTestStruct
let a = opt_test.test_struct(a: 1, b: 2, c: "_3_")
let oa: opt_test.test_struct? = a as opt_test.test_struct?

print("?{\(test)\n", test.hasValue, test.value, test.pointee, separator: ", ",terminator: " }\n")


//test = oa// as opt_test.optTestStruct //neither assigning nor converting of swift Optionals work
//test=a //type mismatch
//test.value = a //value is read-only

//print(opt_test.test_func(a)) //can't pass test_struct, since it expects optTestStruct

test.pointee = a

print("?{\(test)\n", test.hasValue, test.value, test.pointee, separator: ", ",terminator: " }\n")

if let oa{
	test2 = opt_test.makeOpt(oa) //the only way is to create the optional in cpp and return it to swift
}else{
	test2 = nil}

print("?{\(test2)\n", test2.hasValue, test2.value, test2.pointee, separator: ", ",terminator: " }\n")

print(opt_test.test_func(test))

print(opt_test.test_func(test2))

var os = opt_test.optString()
print("?{\(os)\n",os.hasValue,os.value, os.pointee, separator: ", ",terminator: " }\n")
let s:std.string = "test"
os.pointee = s
print("?{\(os)\n", os.hasValue, os.value, os.pointee, separator: ", ",terminator: " }\n")

var ob = opt_test.optInt64()
print("?{\(ob)\n", ob.hasValue, ob.value, ob.pointee, separator: ", ",terminator: " }\n")
ob.pointee = -1337
print("?{\(ob)\n", ob.hasValue, ob.value, ob.pointee, separator: ", ",terminator: " }\n")

