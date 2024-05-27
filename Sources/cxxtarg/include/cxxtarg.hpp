//
//  cxxtarg.hpp

#ifndef cxxtarg_hpp
#define cxxtarg_hpp

#include <optional>
#include <string>

namespace opt_test {
struct test_struct{
	int64_t a;
	int64_t b;
	std::string c;
};

using optTestStruct = std::optional<test_struct>;
using optInt64 = std::optional<int64_t>;

using optString = std::optional<std::string>;

static std::string test_func(const optTestStruct& test){
	if(test.has_value()){
		return std::string("test had value and it was { ")+
		std::to_string(test.value().a)+ ", " +
		std::to_string(test.value().b)+ ", " +
		test.value().c+" }";
	}else{
		return "test had no value";
	}
}

static optTestStruct makeOpt(const test_struct& source){
	return std::make_optional(source);
}

}
#endif /* cxxtarg_hpp */
