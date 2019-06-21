# OCI Module : terraform-oci-advanced-vcn

## Purpose

This module create a VCN and the related resources, in order to handle advanced networking topologies like Hub-and-Spoke.

This module will execute the following sequence :

- create a new VCN (Virtual Cloud Network),
- offer choice to create the VCN related resources :
  - a new IGW (Internet Gateway) and associate it with the VCN,
  - a new NGW (NAT Gateway) and associate it with the VCN,
  - a new DRG (Dynamic Routing Gateway) and associate it witn the VCN,
  - a new LPGs (Local Peering Gateways) and a dedicated route table for spoke VCNs,
- "watermark" any resources created by this module with a freeform tag :
  - keys/values : Terraformed/yes, TF-Module/advanced-vcn

## How to use this module

This folder defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to the URL of this folder:

```hcl
module "advanced_vcn" {
 // to be updated ... insert here a boilerplate config
}
```

Note the following parameters:

Argument | Description
--- | ---
*Table*|*to complete*

You can find the other parameters in [variables.tf](variables.tf).

Check out the [example](../example) for fully-working sample code.
