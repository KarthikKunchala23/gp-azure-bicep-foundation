param location string
param vnet object

module devvnet 'modules/network/vnet.bicep' = {
  name: 'dev-vnet'
  params: { 
    name: vnet.name
    location: location
    addressPrefixes: vnet.addressPrefixes
    subnets: vnet.subnets
  }
}
