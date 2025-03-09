<h1 align=center>Azure Landing Zone</h1>

This repository provides a **reference implementation** of an [Azure landing zone](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone) using Terraform. It aligns with the core concepts, **design principles**, and **conceptual architecture** described in Microsoft’s guidance on Azure landing zones. The Terraform code in this repository creates a **platform landing zone** environment (management groups, subscriptions, policies, and shared services) and can be extended to **application landing zones** for hosting workloads.
> [!WARNING]  
> This example is a starting skeleton. An enterprise‐scale landing zone typically includes many more policies (e.g., security baselines, log collection, blueprint definitions, etc.), peering, firewall, PIM, and so on. Customize and expand as needed.
</br> 

> [!IMPORTANT]  
>Creating subscriptions with Terraform requires special permissions (usually an Enrollment Account or specific roles). In many organizations, subscriptions already exist, and you only “move” them under management groups. Therefore, in this code you will see two approaches:
   >- **Approach A** (Recommended in many real scenarios): Reference existing subscriptions by ID (you pass them in as variables).
   >- **Approach B** (Optional): Use azurerm_subscription resources to create new subscriptions (requires an enrollment account).
>   
> You can pick whichever approach applies to your environment.
</br>

> [!NOTE]  
> Tenant Root Group is a special built‐in management group in Azure. You cannot rename it or create it. Terraform can only reference it.
> 
> Azure AD (users, groups, roles) typically uses the azuread provider, not azurerm. This code does not create Azure AD objects but shows placeholders where you might integrate them.
> 
---

## What is an Azure Landing Zone?

An **Azure landing zone** is an environment in Azure that follows **key design principles** across eight design areas:

1. **Azure billing and Microsoft Entra tenant**  
2. **Identity and access management**  
3. **Management group and subscription organization**  
4. **Network topology and connectivity**  
5. **Security**  
6. **Management**  
7. **Governance**  
8. **Platform automation and DevOps**

These design areas accommodate all application portfolios and enable application **migration**, **modernization**, and **innovation** at scale. Azure landing zones use **subscriptions** to isolate and scale both **platform resources** (platform landing zones) and **application resources** (application landing zones).

### Platform Landing Zones vs. Application Landing Zones

- **Platform landing zone**: A subscription dedicated to shared services such as **identity**, **connectivity**, and **management**. These services are centrally operated and govern all workloads across the enterprise.  
- **Application landing zone**: A subscription for hosting **applications**. These are often delegated to individual application teams or business units. They inherit guardrails from the platform landing zone via **Azure Policy** and **management group** structure.

In the conceptual architecture (see Figure 1 in the official documentation), three example platform landing zones (Identity, Management, Connectivity) and multiple application landing zones (e.g., “Landing zone A1” or “Landing zone A2”) are shown. This repository’s Terraform code primarily sets up the **platform landing zones** and provides a skeleton for application landing zones.

---

## Azure Landing Zone Architecture

Azure landing zones are **modular** and **scalable**, allowing you to apply consistent configurations across all subscriptions. The conceptual architecture (often referred to as “Figure 1”) depicts:

- **Design areas**: The relationship between the eight design areas (tenant, identity, subscription organization, connectivity, security, management, governance, automation/DevOps).  
- **Resource organization**: A **management group hierarchy** that organizes subscriptions under “Platform” and “Landing Zone” management groups.  
- **Policies**: Guardrails enforced at management group or subscription scope.  
- **Shared services**: Identity, connectivity, and management subscriptions providing shared functionality for all workloads.

This Terraform reference follows that conceptual approach:

1. **Management Group Hierarchy**  
   - Tenant Root  
   - Platform → (Identity, Connectivity, Management)  
   - Landing Zones → (Corp, Sandbox, etc.)  
   - Optional Decommissioned group  
2. **Subscriptions** (existing or newly created)  
   - Identity Subscription  
   - Connectivity Subscription  
   - Management Subscription  
   - Corp Landing Zone Subscription  
   - Sandbox Landing Zone Subscription  
3. **Resource Groups**  
   - Example resource groups in each subscription (e.g., `rg-connectivity-hub`, `rg-management-monitor`, etc.)  
4. **Hub Network**  
   - A hub virtual network in the Connectivity subscription  
5. **Policy Assignments**  
   - Example policy for demonstration (e.g., requiring tags)  

You can tailor and expand these modules to align with your organization’s **operating model**, **compliance requirements**, and **cloud adoption plan**.

---

## Repository Contents

```text
terraform-landing-zone/
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
└── modules
    ├── management_groups
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── subscriptions
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── resource_groups
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── network
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── policies
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

### Key Modules

1. **Management Groups**  
   Creates the “Platform,” “Landing Zones,” “Decommissioned,” and their child management groups (`Identity`, `Connectivity`, `Management`, `Corp`, `Sandbox`).

2. **Subscriptions**  
   - **Approach A**: Move existing subscriptions under the correct management group.  
   - **Approach B**: Optionally create new subscriptions (requires special permissions/billing scope).  

3. **Resource Groups**  
   Sets up resource groups in each subscription to host the required platform or application resources.

4. **Network**  
   Deploys a **hub virtual network** in the Connectivity subscription’s hub resource group.

5. **Policies**  
   Assigns a sample policy (e.g., requiring tags). Extend this to implement the full set of governance or security policies recommended for your environment.

---

## Aligning with Design Principles

Microsoft defines **five key design principles** for Azure landing zones, which help you make decisions as your cloud environment grows:

1. **Subscription democratization**  
2. **Policy-driven governance**  
3. **Single control and management plane**  
4. **Application-centric service model**  
5. **Alignment with Azure-native design and roadmaps**

Our reference code follows these principles by:

- **Democratizing** subscriptions: We separate concerns and let each subscription function as a boundary for ownership and scale.  
- Using **Azure Policy** to enforce consistent guardrails across subscriptions.  
- Relying on **Azure Resource Manager** (ARM) and Terraform for a single, consistent control plane.  
- Emphasizing an **application-centric** approach: the “Landing Zones” management group is dedicated to hosting application subscriptions.  
- Favoring **Azure-native** services for identity, security, and connectivity.

---

## Getting Started

1. **Clone** this repository.
2. **Configure** variables in [`variables.tf`](./variables.tf). At minimum, set:
   - `tenant_root_id`  
   - Existing subscription IDs (if not creating new ones)  
   - `billing_scope_id` (if you do plan to create new subscriptions)
3. **Initialize** Terraform:
   ```bash
   terraform init
   ```
4. **Plan**:
   ```bash
   terraform plan
   ```
5. **Apply**:
   ```bash
   terraform apply
   ```
   Confirm the prompt to create resources.

---

## Extending This Implementation

- **Additional Policies**: Expand the [`policies`](./modules/policies) module with initiatives, role assignments, or custom policy definitions to meet **compliance** and **governance** requirements.  
- **Security & Monitoring**: Add Azure Security Center, Sentinel, Log Analytics, and Azure Monitor solutions in the **Management** subscription.  
- **Connectivity**: Implement subnets, Azure Firewall, Bastion, ExpressRoute, or VPN gateways in the hub VNet.  
- **Application Landing Zones**: Create more subscriptions under the “Landing Zones” management group. Each subscription can have dedicated resource groups, subnets, or any required PaaS services.  
- **DevOps & Automation**: Integrate CI/CD pipelines (GitHub Actions, Azure DevOps, etc.) to automate updates to your landing zone environment.

---

## Azure Verified Modules for Platform Landing Zones

If you prefer a more **modular**, **verified** approach, you can also use [Azure Verified Modules for Platform Landing Zones](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/azure-landing-zone-accelerator) in **Bicep** or **Terraform**. These modules help you rapidly deploy a recommended resource hierarchy and governance model, integrating shared services and application workloads.

---

## Next Steps

1. **Review Design Areas**  
   Familiarize yourself with the [eight design areas](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/design-areas) (identity, connectivity, management, etc.) and **tailor** them to your organization.  
2. **Choose a Landing Zone Implementation**  
   Decide whether you will use a **Portal Accelerator**, **Azure Verified Modules**, or a **custom Terraform** approach (like this repository).  
3. **Iterate**  
   Landing zones evolve over time as new requirements emerge. Continually refine your management group hierarchy, policies, and network topologies.  
4. **Consult Documentation**  
   - [Azure Landing Zone Design Principles](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/design-principles)  
   - [Azure Landing Zone Architecture](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/architecture)  
   - [Journey to the target architecture](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/journey)

---

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have improvements or suggestions.

---

## Disclaimer

This reference implementation is intended as a **starting point** to illustrate how you can structure Terraform code for **enterprise-scale** deployments in Azure. It doesn’t cover every scenario or service. Always review and adapt these modules to align with your organization’s **security**, **compliance**, and **operational** requirements.
