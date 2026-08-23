@description('Provide a name to virtual network')
param name string

@description('Location of virtual network')
param location string

@description('address CIDR of Network')
param addressPrefixes array

@description('Subnets details in array of objects')
param subnets array


resource vnet 'Microsoft.Network/virtualNetworks@2025-07-01' = { 
  name: name
  location: location
  properties:{ 
    addressSpace: {addressPrefixes: addressPrefixes}
    subnets:[
      for s in subnets : {
        name: s.name
        properties:{
          addressPrefix: s.prefix
        }
      }
    ]
  } 
}
