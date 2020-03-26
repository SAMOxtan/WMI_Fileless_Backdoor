#Filter
Get-WMIObject -Namespace root\Subscription -Class __EventFilter -Filter "Name='filtP1'" | Remove-WmiObject -Verbose

#Consumer
Get-WMIObject -Namespace root\Subscription -Class CommandLineEventConsumer -Filter "Name='consP1'" | Remove-WmiObject -Verbose

#Binding
Get-WMIObject -Namespace root\Subscription -Class __FilterToConsumerBinding -Filter "__Path LIKE '%filtP1%'" | Remove-WmiObject -Verbose