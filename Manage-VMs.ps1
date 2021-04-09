# Variables
$VMName = 'TARGET VM'
$VMServer = 'VM SERVER'
$VMSwitch = 'VM SWITCH'
# Customizing VM names for personalization. Hoping to add this to an array of some kind eventually.
if ( $VMName = 'DIT-VM-SAL-01') {$RepID = 'Rep1'}   
if ( $VMName = 'DIT-VM-SAL-02') {$RepID = 'Rep2'}
if ( $VMName = 'DIT-VM-SAL-03') {$RepID = 'Rep3'}
if ( $VMName = 'DIT-VM-SAL-04') {$RepID = 'Rep4'} 

# Functions
function Disconnect-DIT-VM {
    Disconnect-VMNetworkAdapter -ComputerName $VMServer -VMName $VMName
}

function Connect-DIT-VM {
    Connect-VMNetworkAdapter -ComputerName $VMServer -VMName $VMName -SwitchName $VMSwitch
}

function Get-VM-NetworkStatus {
    Get-VMNetworkAdapter -ComputerName $VMServer -VMName $VMName 
}

function Get-VM-Status { 
    $VMIPAddress = Get-VMNetworkAdapter -ComputerName $VMServer -VMName $VMName | Select -ExpandProperty IPAddresses
    if ($VMIPAddress -eq $null)
        { 
         $VMIPAddress = 0
        }
    if ($VMIPAddress -ne 0)
           {
           $VMNetworkStatus = ( $VMIPAddress.Split([Environment]::NewLine) | Select -First 1 )
           }
    if ( $VMIPAddress -eq 0)
        {        
        Write-Output $VMName' is not activated. '$RepID' will not be able to connect.'
        }
    if ( $VMIPAddress -ne 0 )
        {
        Write-Output $VMName' is currently activated. The IP address is: '$VMNetworkStatus'. '$RepID' should be able to connect just fine.'
        }
}

function Show-VM-Menu 
{
    param (
        [string]$Title = 'VM Menu'
    )
    Clear-Host
    Write-Host $Title
    Write-Host "[1] - Press '1' to select Rep1 Remote Workstation"
    Write-Host "[2] - Press '2' to select Rep2 Remote Workstation"
    Write-Host "[3] - Press '3' to select Rep3 Remote Workstation"
    Write-Host "[4] - Press '4' to select Rep4 Remote Workstation"
    Write-Host "[5] - Press '5' to get information for all remote workstations"
    Write-Host "[q] - Press 'q' to quit."
}

Show-VM-Menu -Title "VM Menu"
$VMMenuSelection = Read-Host "Type in your selection and press 'Enter'"
switch ($VMMenuSelection)
{
    '1' 
        {
        $VMName = 'DIT-VM-SAL-01'
        $RepID = 'Rep1' 
        Clear-Host
        Get-VM-Status
        ([string]$WStitle = "Select action to take on Remote Workstation")
        Write-Host "[1] - Press '1' to deactivate "$RepID" Remote Workstation"
        Write-Host "[2] - Press '2' to activate "$RepID" Remote Workstation"
        Write-Host "[q] - Press 'q' to quit"
        $WSmenuSelection = Read-Host "Type in your selection and press 'Enter'"
            switch ($WSmenuSelection) {
                                        '1' {Write-Host 'Disconnecting ' $RepID ' Remote Workstation...'
                                            Start-Sleep -Seconds 3
                                            Disconnect-DIT-VM
                                            Get-VM-Status
                                            Write-Host 'Quitting...'
                                            Start-Sleep -Seconds 5
                                            pause}
                                        '2' {Write-Host 'Connecting ' $RepID ' Remote Workstation...'
                                            Start-Sleep -Seconds 3
                                            Connect-DIT-VM
                                            Get-VM-Status
                                            Write-Host 'Quitting...'
                                            Start-Sleep -Seconds 5
                                            pause}
                                        'q' {return}
                                       }
        }
    '2'
        {
        $VMName = 'DIT-VM-SAL-02'
        $RepID = 'Rep2' 
        Clear-Host
        Get-VM-Status
        ([string]$WStitle = "Select action to take on Remote Workstation")
        Write-Host "[1] - Press '1' to deactivate "$RepID" Remote Workstation"
        Write-Host "[2] - Press '2' to activate "$RepID" Remote Workstation"
        Write-Host "[q] - Press 'q' to quit"
        $WSmenuSelection = Read-Host "Type in your selection and press 'Enter'"
            switch ($WSmenuSelection) {
                                        '1' {Write-Host 'Disconnecting ' $RepID ' Remote Workstation...'
                                            Start-Sleep -Seconds 3
                                            Disconnect-DIT-VM
                                            Get-VM-Status
                                            Write-Host 'Quitting...'
                                            Start-Sleep -Seconds 5
                                            pause}
                                        '2' {Write-Host 'Connecting ' $RepID ' Remote Workstation...'
                                            Start-Sleep -Seconds 3
                                            Connect-DIT-VM
                                            Get-VM-Status
                                            Write-Host 'Quitting...'
                                            Start-Sleep -Seconds 5
                                            pause}
                                        'q' {return}
                                       }
        }
    '3'
        {
        $VMName = 'DIT-VM-SAL-03'
        $RepID = 'Rep3' 
        Clear-Host
        Get-VM-Status
        ([string]$WStitle = "Select action to take on Remote Workstation")
        Write-Host "[1] - Press '1' to deactivate "$RepID" Remote Workstation"
        Write-Host "[2] - Press '2' to activate "$RepID" Remote Workstation"
        Write-Host "[q] - Press 'q' to quit"
        $WSmenuSelection = Read-Host "Type in your selection and press 'Enter'"
            switch ($WSmenuSelection) {
                                        '1' {Write-Host 'Disconnecting ' $RepID ' Remote Workstation...'
                                            Start-Sleep -Seconds 3
                                            Disconnect-DIT-VM
                                            Get-VM-Status
                                            Write-Host 'Quitting...'
                                            Start-Sleep -Seconds 5
                                            pause}
                                        '2' {Write-Host 'Connecting ' $RepID ' Remote Workstation...'
                                            Start-Sleep -Seconds 3
                                            Connect-DIT-VM
                                            Get-VM-Status
                                            Write-Host 'Quitting...'
                                            Start-Sleep -Seconds 5
                                            pause}
                                        'q' {exit}
                                       }
        }
    '4'
        {
        $VMName = 'DIT-VM-SAL-04'
        $RepID = 'Rep4' 
        Clear-Host
        Get-VM-Status
        ([string]$WStitle = "Select action to take on Remote Workstation")
        Write-Host "[1] - Press '1' to deactivate "$RepID" Remote Workstation"
        Write-Host "[2] - Press '2' to activate "$RepID" Remote Workstation"
        Write-Host "[q] - Press 'q' to quit"
        $WSmenuSelection = Read-Host "Type in your selection and press 'Enter'"
            switch ($WSmenuSelection) {
                                        '1' {Write-Host 'Disconnecting ' $RepID ' Remote Workstation...'
                                            Start-Sleep -Seconds 3
                                            Disconnect-DIT-VM
                                            Get-VM-Status
                                            Write-Host 'Quitting...'
                                            Start-Sleep -Seconds 5
                                            pause}
                                        '2' {Write-Host 'Connecting ' $RepID ' Remote Workstation...'
                                            Start-Sleep -Seconds 3
                                            Connect-DIT-VM
                                            Get-VM-Status
                                            Write-Host 'Quitting...'
                                            Start-Sleep -Seconds 5
                                            pause}
                                        'q' {exit}
                                       }
        }
    '5' {
        Write-Output (Get-VM -ComputerName $VMServer | Select-Object -Property Name | ForEach-Object {Get-VMNetworkAdapter -ComputerName $VMServer -VMName ($_.Name)})
		}
    'q' {
         return
        }
}
