PWD=$(shell pwd)
MODULE_NAME=Pythonic
TEST_APPLICATION=$(MODULE_NAME)-test
LIB_NAME=lib$(MODULE_NAME).dylib
LIB_PATH=$(PWD)/$(LIB_NAME)
SWIFT_MODULE_PATH=$(PWD)/$(MODULE_NAME).swiftmodule

module: clean
	#  -emit-library              Emit a linked library
	#  -o <file>                  Write output to <file>
	#  -Xlinker <value>           Specifies an option which should be passed to the linker
	#  -emit-module               Emit an importable module
	#  -emit-module-path <path>   Emit an importable module to <path>
	#  -module-name <value>       Name of the module to build
	#  -module-link-name <value>  Library to link against when using this module
	xcrun swift -emit-library -o $(LIB_PATH) -Xlinker -install_name -Xlinker @rpath/$(LIB_NAME) -emit-module -emit-module-path $(SWIFT_MODULE_PATH) -module-name $(MODULE_NAME) -module-link-name $(MODULE_NAME) $(MODULE_NAME).swift

clean:
	rm -f $(LIB_NAME) $(MODULE_NAME).swiftdoc $(MODULE_NAME).swiftmodule

test: module
	#  -o <file>                  Write output to <file>
	#  -I <value>                 Add directory to the import search path
	#  -L <value>                 Add directory to library link search path
	#  -Xlinker <value>           Specifies an option which should be passed to the linker
	xcrun swift $(TEST_APPLICATION).swift -o $(TEST_APPLICATION) -I $(PWD) -L $(PWD) -Xlinker -rpath -Xlinker @executable_path/
	./$(TEST_APPLICATION)
