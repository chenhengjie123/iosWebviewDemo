# 验证不同类型的 iOS WebView 内存占用是否会纳入统计用demo

## 背景

公司内自研的一个性能采集工具（背后原理是获取 Instruments 的数据），近期在一个项目中被发现，某部分从原来采用 webview 内嵌改为原生实现后，内存竟然还涨了不少，因此需要确认下，会不会存在 webview 数据没被包含进去这种情况。

## 用法

直接运行，里面会有2个按钮，分别对应打开2个webview。此时可以借助工具统计此时进程情况变化以及内存值变化，进行判定

## 结论

时间关系，也把结论在这里同步下：

使用 UIWebView 组件，不会新建进程，内存数值还会被包含在 app 进程中
使用 WKWebView 组件，会新建外部独立进程(com.apple.WebKit.Networking和com.apple.WebKit.WebContent)，独立进程的内存数值不会被包含在 app 进程中

xcode的debug模式，只会获取app进程的内存数据，不会包含WKWebView新建的进程的数据。如果要获取这部分数据，只能通过 instruments 的 activity 模板来获取。

关于 WKWebView 组件进程模型的详细信息，建议查看：https://segmentfault.com/a/1190000040652799