# WMI_Fileless_Backdoor

## 0x00 WMI简介
	WMI是从Windows 2000起，在每个Windows系统版本中都会内置的一个管理框架。WMI以本地和远程方式提供了许多管理功能，包括查询系统信息、启动和停止进程以及设置条件触发器。我们可以使用各种工具（比如Windows的WMI命令行工具wmic.exe）或者脚本编程语言（如PowerShell、VBS）提供的API接口来访问WMI。Windows系统的WMI数据存储在WMI公共信息模型（common information model，CMI）仓库中，该仓库由“System32wbemRepository”文件夹中的多个文件组成。

	WMI类是WMI的主要结构。WMI类中可以包含方法（代码）以及属性（数据）。具有系统权限的用户可以自定义类或扩展许多默认类的功能。

	在满足特定条件时，我们可以使用WMI永久事件订阅（permanent event subscriptions）机制来触发特定操作。攻击者经常利用这个功能，在系统启动时执行后门程序，完成本地持久化。WMI的事件订阅包含三个核心WMI类：Filter（过滤器）类、Consumer（消费者）类以及FilterToConsumerBinding类。WMI Consumer用来指定要执行的具体操作，包括执行命令、运行脚本、添加日志条目或者发送邮件。WMI Filter用来定义触发Consumer的具体条件，包括系统启动、特定程序执行、特定时间间隔以及其他条件。FilterToConsumerBinding用来将Consumer与Filter关联在一起。创建一个WMI永久事件订阅需要系统的管理员权限。

# Reference
[wmi与vbs](https://xz.aliyun.com/t/2080)

[利用WMI构建一个持久化的异步的无文件后门](https://m0nst3r.me/pentest/%E5%88%A9%E7%94%A8WMI%E6%9E%84%E5%BB%BA%E4%B8%80%E4%B8%AA%E6%8C%81%E4%B9%85%E5%8C%96%E7%9A%84%E5%BC%82%E6%AD%A5%E7%9A%84%E6%97%A0%E6%96%87%E4%BB%B6%E5%90%8E%E9%97%A8.html)

[WMI利用专题](https://blog.51cto.com/antivirusjo/2092545)

[Powershell攻击指南黑客后渗透之道系列——进阶利用](https://www.anquanke.com/post/id/88851)

[A WMI Based Agentless Post-Exploitation RAT Developed in PowerShell](https://www.fireeye.com/blog/threat-research/2017/03/wmimplant_a_wmi_ba.html)

[WMI Backdoor](https://www.tuicool.com/articles/zmUVbyJ)

[利用WMI打造完美“三无”后门](http://demon.tw/copy-paste/vbs-wmi-trojan-3.html)

[如何检测并移除WMI持久化后门？](https://www.tuicool.com/articles/IzieuyR)

[解析APT29的无文件WMI和PowerShell后门](https://www.anquanke.com/post/id/85851)

[无文件攻击的兴起与应对之道](https://www.aqniu.com/learn/31053.html)
