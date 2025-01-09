param(
    [string]$resourceGroupName,
    [string]$sqlServerName,
    [string]$sqlDatabaseName,
    [string]$sqlFilePath,
    [string]$adminLogin,
    [string]$adminPassword
)

# Install necessary modules (if not already installed)
Install-Module -Name Az -Force -Scope CurrentUser
Install-Module -Name SqlServer -Force -Scope CurrentUser

# Login to Azure using a Service Principal
$pscredential = New-Object System.Management.Automation.PSCredential($adminLogin, (ConvertTo-SecureString $adminPassword -AsPlainText -Force))
Connect-AzAccount -ServicePrincipal -Credential $pscredential

# Set the Azure subscription (replace with your subscription ID)
$subscriptionId = "<your-subscription-id>"
Set-AzContext -SubscriptionId $subscriptionId

# Deploy the SQL script to the Azure SQL Database using sqlcmd
$sqlServerFullyQualifiedName = "$sqlServerName.database.windows.net"
$connectionString = "Server=$sqlServerFullyQualifiedName;Database=$sqlDatabaseName;User ID=$adminLogin;Password=$adminPassword;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

Invoke-Sqlcmd -ServerInstance $sqlServerFullyQualifiedName -Database $sqlDatabaseName -InputFile $sqlFilePath -Username $adminLogin -Password $adminPassword
Write-Host "SQL Script Deployment Completed."
