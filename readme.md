# EXCHANGE 2016 CU17 INSTALLATION

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsredlin%2FExchange2016Azure%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


| Endpoint        | Version           | Validated  |
| ------------- |:-------------:| -----:|
| Microsoft Azure      | - | YES |

This template deploys a test environment, the following resources are deployed as part of the solution.


## Deployed resources


+ **Public IP Address**: Allows connection to a VM
+ **Network Security Group**: 
+ **Storage Account**: Used for Diagnostics
+ **Network Interface**: 
+ **Virtual Network**: 
+ **Virtual Machine**: Server 2016, Exchange 2016, PDC
+ **DSC Extension**: Used to install ADDS, Exchange 2016, configure OU Structure, create some Users
+ **Custom Script Extension**: Used to download Exchange CU17, install some software and create wildcard certificate
+ **Public DNS Zone**: A public DNS Zone


