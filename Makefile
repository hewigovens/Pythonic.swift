PWD=$(shell pwd)
MODULE_NAME=pythonic
TEST_APPLICATION=$(MODULE_NAME)-test
LIB_NAME=lib$(MODULE_NAME).dylib
LIB_PATH=$(PWD)/$(LIB_NAME)
SWIFT_MODULE_PATH=$(PWD)/$(MODULE_NAME).swiftmodule

module: clean
	xcrun swift -emit-library -o $(LIB_PATH) -Xlinker -install_name -Xlinker @rpath/$(LIB_NAME) -emit-module -emit-module-path $(SWIFT_MODULE_PATH) -module-name $(MODULE_NAME) -module-link-name $(MODULE_NAME) $(MODULE_NAME).swift

clean:
	rm -f $(LIB_NAME) $(MODULE_NAME).swiftdoc $(MODULE_NAME).swiftmodule

test: module
	xcrun swift $(TEST_APPLICATION).swift -o $(TEST_APPLICATION) -I $(PWD) -L $(PWD) -Xlinker -rpath -Xlinker @executable_path/
	./$(TEST_APPLICATION)
