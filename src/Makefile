PWD=$(shell pwd)
MODULE_NAME=Pythonic
TEST_APPLICATION=$(MODULE_NAME)-test
LIB_NAME=lib$(MODULE_NAME).dylib
LIB_PATH=$(PWD)/$(LIB_NAME)
SWIFT_MODULE_PATH=$(PWD)/$(MODULE_NAME).swiftmodule

module: clean
	xcrun swift -emit-library -o $(LIB_PATH) -Xlinker -install_name -Xlinker @rpath/$(LIB_NAME) -emit-module -emit-module-path $(SWIFT_MODULE_PATH) -module-name $(MODULE_NAME) -module-link-name $(MODULE_NAME) $(MODULE_NAME).swift $(MODULE_NAME).*.swift

clean:
	rm -f $(LIB_NAME) $(MODULE_NAME).swiftdoc $(MODULE_NAME).swiftmodule $(TEST_APPLICATION)

test: module
	(printf "import math\nimport re\n"; egrep ^assert Pythonic-test.swift | sed 's/nil/None/g' | sed 's/true/True/g' | sed 's/false/False/g') | python2.7 && echo "All tests successfully passed when executing as Python code."
	xcrun swift $(TEST_APPLICATION).swift -o $(TEST_APPLICATION) -I $(PWD) -L $(PWD) -Xlinker -rpath -Xlinker @executable_path/
	./$(TEST_APPLICATION)
