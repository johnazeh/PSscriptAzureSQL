# Variables
$resourceGroupName = "TerraformRG"
$serverName = "truprod02"
$databaseName = "AdventureWorks2017"
$newEdition = "Premium" # Options: Basic, Standard, Premium, GeneralPurpose, BusinessCritical, etc.
$newServiceObjectiveName = "P1" # Example: S0, S1, P1, GP_Gen5_2, etc.
$newMaxSizeBytes = "5368709120" # 1 GB example, adjust as needed


function ExecuteScript {
# Remove database from elastic pool
set-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName -ElasticPoolName $null

# Update the database tier
Set-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName -Edition $newEdition -RequestedServiceObjectiveName $newServiceObjectiveName -MaxSizeBytes $newMaxSizeBytes

# Confirm changes
Get-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName

}

# Execute script
ExecuteScript