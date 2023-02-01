# Azure Policy

## The big idea is to constrain the provisioning limits on Azure, by setting up well defined parameters for resource creation using the Azure Resource Manager.

The tool is driven by a configuration file.  Values can be added to the definition, without fear of breaking the code.  However, any update/change or delete will have to be vetted against the code, as the JSON configuration is "cast" into a Python Dictionary to address aspects of the configuration.

### Resource Group Level
The Initial Blast Radius is predicated on setting the boundries for creation of Resource Groups.  The Policy definition is loaded with the "Allowable Values" for Policy Assignment in Azure based on Azure Regions.  Resource Groups are only containers, but at the highest level, a quick glimpse can be performed for a rapid compliance check.

### Resource Level
The next level is the actual location of a resource within a resource group.  Once again this policy closely models its resource group parent in structure.  Individual resources must be in the allowed Azure regions to qualify for provisioning by the Azure Resource Manager (ARM)

#### Feature Level
For demonstration of this concept, Behavioral Science API's were selected.  Essentially, the resource SKU's were scanned having the values of [Free, Standard, and Premium].  Only Free SKU's were enabled.
