# SOLocalization

Configure multi-language environment in iOS application.

在 iOS 应用中切换使用的语言。

## Feature

* [x] 切换语言后不需要界面跳转。
* [x] 默认使用当前系统设置的语言。
* [x] 使用简单、扩展方便、速度很快。
* [x] UILabel、UITextField 增加对 AttributedText 的支持。
* [x] 第三方增加对 MJRefresh 的支持。

## Usage

### Export SOLocalization

Copy SOLocalization.{h, m} and UIKit Folder to your project.

把 SOLocalization 类文件及 UIKit 文件夹中的文件复制到你的项目中。

### Create strings file

Create Strings file for your project, The default strings file is named infoPlist.strings.

创建本地化字符串文件，默认为 infoPlist.strings，设置好需要本地化的内容。

### Configure

Configure support language and fallback language。

设置应用中支持的语言及默认语言(建议在AppDelegate中设置)。

```
[SOLocalization configSupportRegions:@[SOLocalizationEnglish, SOLocalizationSimplifiedChinese] fallbackRegion:SOLocalizationEnglish];
```

### Set Localized String

Set property for supported UIKit element

为 UIKit 元素设置需要的属性，像下面这样简单：

```
UIBarButtonItem *change = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(changeLanguage:)];
change.sol_title = @"Setting";
self.navigationItem.rightBarButtonItem = change;

self.label.sol_text = @"label";
[self.button sol_setTitle:@"button" forState:UIControlStateNormal];

self.textField.sol_placeholder = @"textField placeholder";

self.navigationItem.sol_title = @"title";
```

or, direct use `SOLocalizedStringFromTable` get localized string

对于不支持的 UIKit 元素，也可以像下面的代码这样获取本地化字符：

```
self.title = SOLocalizedStringFromTable(@"title", @"infoPlist");
```

### Setting application Language

切换应用中的语言，已增加对第三方 MJRefresh 的支持，切换语言后，MJRefresh 中的语言也会跟随 SOLocalization 的设置显示，理论上其他第三方也可支持。

```
// to use English
[SOLocalization sharedLocalization].region = SOLocalizationEnglish;

// to use 简体中文
[SOLocalization sharedLocalization].region = SOLocalizationSimplifiedChinese;
```

## License

SOLocalization is available under the MIT license. See the LICENSE file for more info.
