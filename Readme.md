# Pangu.objective-c

[![Travis CI](https://travis-ci.org/Cee/pangu.objective-c.svg?branch=master)](https://travis-ci.org/Cee/pangu.objective-c)
[![codecov.io](http://codecov.io/github/Cee/pangu.objective-c/coverage.svg?branch=master)](http://codecov.io/github/Cee/pangu.objective-c?branch=master)
[![Cocoapods](https://cocoapod-badges.herokuapp.com/v/Pangu/badge.png)](http://cocoapods.org/?q=Pangu)

Paranoid text spacing for good readability, to automatically insert whitespace between CJK (Chinese, Japanese, Korean), half-width English, digit and symbol characters.

* Go version: [pangu.go](https://github.com/vinta/pangu)
* Java version: [pangu.java](https://github.com/vinta/pangu.java)
* JavaScript version: [pangu.js](https://github.com/vinta/paranoid-auto-spacing/blob/master/src/pangu.js)
* Node.js version: [pangu.node](https://github.com/huei90/pangu.node)
* Python version: [pangu.py](https://github.com/vinta/pangu.py)
* Ruby version: [pangu.rb](https://github.com/dlackty/pangu.rb)

## Installation

The simplest option is to use `pod "Pangu"`.

You can also add the `Classes` folder to your project, and then `import Pangu.h`. There are no further requirements.

## Usage

```objective-c
#import "Pangu.h"

[NSString spacing:@"請問Jackie的鼻子有幾個？123個！"];
// 請問 Jackie 的鼻子有幾個？123 個！

UILabel *label = [UILable new];
label.text = @"請問Jackie的鼻子有幾個？123個！";
// 請問 Jackie 的鼻子有幾個？123 個！
```

## License

Released under the MIT License.