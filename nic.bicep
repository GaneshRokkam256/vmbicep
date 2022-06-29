//fourth
param nicname string
var location = resourceGroup().location
param subnetname string
param ipconfigNamE string


resource subnet 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' existing = {
  name:subnetname
}

resource nic 'Microsoft.Network/networkInterfaces@2021-08-01'={
  name:nicname
  location:location
  properties:{
    enableAcceleratedNetworking:true
    ipConfigurations:[
      {
        name: ipconfigNamE
        properties:{
          privateIPAllocationMethod:'Dynamic'
          subnet:{
            id: subnet.id
          }
        }
      }      
    ] 
  }
}

output nicid string= nic.id

