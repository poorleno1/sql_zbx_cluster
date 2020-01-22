$SQLServer = get-clusterresource -ErrorAction SilentlyContinue | where-object { $_.ResourceType -like “SQL Server” } | get-clusterparameter VirtualServerName | select-object -ExpandProperty value
$ver = Invoke-Sqlcmd -Query "SELECT @@VERSION;" -QueryTimeout 3 -ServerInstance $SQLServer

write-host $ver.Column1
