Pythonic.swift
==============

Pythonic.swift is a Swift library implementating selected parts of Python's standard library and making them available to your Swift code.

```import Pythonic``` allows you to write Python flavored code such as:

```
#!/usr/bin/env xcrun swift -i -I .

import Pythonic

var strings = ["foo", "bar"]
if strings {
  println(strings[0]) // foo
}
if len(strings) == 2 {
  println(strings[1].upper()) // BAR
}

var greeting = "   hello pythonista   "
if greeting.strip().startswith("hello") {
  println(greeting.strip().title()) // Hello Pythonista
}

var numbers = [1, 2, 3, 4, 5]
println(sum(numbers)) // 15
println(max(numbers)) // 5
```

See the test suite <a href="https://github.com/practicalswift/pythonic-swift/blob/master/Pythonic-test.swift">Pythonic-test.swift</a> for more examples.

Getting started
---------------

```
git clone https://github.com/practicalswift/pythonic-swift.git
cd pythonic-swift/
make
make test
mkdir my-pythonic-app/
cd my-pythonic-app/
cp ../Pythonic.swiftdoc ../Pythonic.swiftmodule ../libPythonic.dylib .
cat << EOF > my_pythonic_app.swift
#!/usr/bin/env xcrun swift -I . -i

import Pythonic

assert("  hello  ".strip() == "hello")
println("This feels really.. Pythonic!")
EOF
chmod +x my_pythonic_app.swift
./my_pythonic_app.swift
```
