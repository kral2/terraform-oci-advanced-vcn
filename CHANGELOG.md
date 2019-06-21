# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and the versioning try to follow the [Semantic Versioning 2.0.0](https://semver.org/) specification.

Maintainer : [kral2]

## [0.9.0]

### Added

- create a new VCN (Virtual Cloud Network),
- offer choice to create the VCN related resources :
  - a new IGW (Internet Gateway) and associate it with the VCN,
  - a new NGW (NAT Gateway) and associate it with the VCN,
  - a new DRG (Dynamic Routing Gateway) and associate it witn the VCN,
  - a new LPGs (Local Peering Gateways) and a dedicated route table for spoke VCNs,
- "watermark" any resources created by this module with a freeform tag :
  - Terraformed=yes
  - TF-Module=advanced-vcn
