# ai_decimal_accuracy

A new Flutter package about decimal accuracy.

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----


## 1.安装

使用当前包作为依赖库

### 1. 依赖此库

在文件 'pubspec.yaml' 中添加

[![pub package](https://img.shields.io/pub/v/ai_decimal_accuracy.svg)](https://pub.dev/packages/ai_decimal_accuracy)

```

dependencies:

  ai_decimal_accuracy: ^version

```

或者以下方式依赖

```
dependencies:

  # ai_decimal_accuracy package.
  ai_decimal_accuracy:
    git:
      url: https://github.com/pdliuw/ai_decimal_accuracy.git

```

### 2. 安装此库

你可以通过下面的命令行来安装此库

```

$ flutter pub get


```

你也可以通过项目开发工具通过可视化操作来执行上述步骤

### 3. 导入此库

现在，在你的Dart编辑代码中，你可以使用：

```

import 'package:ai_decimal_accuracy/ai_decimal_accuracy.dart';

```

## 2.使用



```


                        AiDecimalAccuracy litreNum =
                            AiDecimalAccuracy.parse("1.8");
                        AiDecimalAccuracy singlePrice =
                            AiDecimalAccuracy.parse("2.2");
                        
                        var total = singlePrice * litreNum;

```




## LICENSE

    BSD 3-Clause License
    
    Copyright (c) 2020, pdliuw
    All rights reserved.