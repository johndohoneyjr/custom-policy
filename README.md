# Azure Policy

## The big idea is to constrain the provisioning limits on Azure and Kuberneter, by setting up well defined parameters for resource creation using the Azure Resource Manager

The tool is driven by a configuration file (Json maps nicely into Python Dictionaries).  Values can be added to the definition, without fear of breaking the code.  However, any update/change or delete will have to be vetted against the code, as the JSON configuration is "cast" into a Python Dictionary to address aspects of the configuration.

The initial focus of this tool was for Custom Kubernetes, but it can be a whole lot more.  I used one example to limit SKU's at the actual resource level -- figured everyone and their brother is going to be playing with OpenAI.  So, I used Cogntive Science APIs as a working example.

### Resource Group Level

The Initial Blast Radius is predicated on setting the boundaries for creation of Resource Groups.  The Policy definition is loaded with the "Allowable Values" for Policy Assignment in Azure based on Azure Regions.  Resource Groups are only containers, but at the highest level, a quick glimpse can be performed for a rapid compliance check.

### Resource Level

The next level is the actual location of a resource within a resource group.  Once again this policy closely models its resource group parent in structure.  Individual resources must be in the allowed Azure regions to qualify for provisioning by the Azure Resource Manager (ARM)

#### Feature Level

For demonstration of this concept, Two features were created.  First an example with Start Probes being required on a Manifest in Kubernetes.  Second, Behavioral Science API's were selected--same idea as OpenAI.  Essentially, the resource SKU's were scanned having the values of [Free, Standard, and Premium].  Only Free SKU's were enabled.  The idea here is the team is not going to break the OPEX Budget using ChatGPT to answer emails or write poems to co-workers.

### To be done
Code Space - devcontainer.json - Map env vars to environment in my computer
Assign the policy -- need to come up with a way to set variables and set exclusions on REST call -- just more homework
