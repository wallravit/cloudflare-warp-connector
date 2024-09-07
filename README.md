
# Cloudflare WARP Connector GitHub Action: Secure Private Network Access for CI/CD Pipelines

This GitHub Action automates the setup and configuration of the **Cloudflare WARP Connector** on an Ubuntu system. It installs the Cloudflare WARP client, registers the connector, and securely connects your GitHub Actions runner to private networks. This action is perfect for accessing internal systems, enhancing **automation testing**, and ensuring **network consistency** during CI/CD processes.

## Key Features
- **Seamless setup** of Cloudflare WARP on your runner.
- Secure access to **private resources** behind firewalls.
- Ensures **encrypted communication** and **IP masking**.
- Supports **E2E testing** and **API testing** in restricted environments.

## Table of Contents
- [Setup](#setup)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Example Workflow](#example-workflow)
- [Use Cases](#use-cases)
  - [Access Internal Systems](#access-internal-systems)
  - [Network Consistency for E2E Testing](#network-consistency-for-e2e-testing)
  - [Access Restricted Networks for Automation Testing](#access-restricted-networks-for-automation-testing)
  - [Security Testing in Protected Environment](#security-testing-in-protected-environment)
  - [Masking and Encrypting Traffic](#masking-and-encrypting-traffic)
- [Security](#security)
- [Contributions](#contributions)

## Setup
To use the Cloudflare WARP Connector GitHub Action in your CI/CD pipeline, follow these steps:

### Installation
Add the following to your `.github/workflows/main.yml` file:

```yaml
jobs:
  setup-warp:
    runs-on: ubuntu-latest
    steps:
      - name: Setup Cloudflare WARP Connector
        uses: wallravit/cloudflare-warp-connector@v1.0.0
        with:
          organization: 'your-organization'
          cloudflare_access_client_id: ${{ vars.CLOUDFLARE_CLIENT_ID }}
          cloudflare_client_secret: ${{ secrets.CLOUDFLARE_CLIENT_SECRET }}
          cloudflare_warp_token: ${{ secrets.CLOUDFLARE_WARP_TOKEN }}
```

For more information on getting your Cloudflare WARP configuration, visit the [Cloudflare Developer Documentation](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/private-net/warp-connector/).

## How to get the Cloudflare WARP config
👉 https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/private-net/warp-connector/

<img width="1491" alt="Screenshot 2024-08-31 at 10 50 46" src="https://github.com/user-attachments/assets/9df67df7-ae06-4a35-884b-9b316f3cacfa">


## Inputs

| Input Name                     | Description                                           | Required | Default |
|--------------------------------|-------------------------------------------------------|----------|---------|
| `organization`                 | Your organization or team name                       | `true`   |         |
| `cloudflare_access_client_id`  | Cloudflare Access Client ID                           | `true`   |         |
| `cloudflare_client_secret`     | Cloudflare Access Client Secret                       | `true`   |         |
| `cloudflare_warp_token`        | Cloudflare Connector Token                            | `true`   |         |



## Outputs

This action does not produce direct outputs but ensures that the Cloudflare WARP connector is correctly installed, configured, and connected on the runner.

## Example Workflow

```yaml
name: Setup Cloudflare WARP Connector

on: [push]

jobs:
  setup-warp:
    runs-on: ubuntu-latest

    steps:
      - name: Setup Cloudflare WARP Connector
        uses: wallravit/cloudflare-warp-connector@v1.0.0
        with:
          organization: 'your-organization'
          cloudflare_access_client_id: ${{ vars.CLOUDFLARE_CLIENT_ID }}
          cloudflare_client_secret: ${{ secrets.CLOUDFLARE_CLIENT_SECRET }}
          cloudflare_warp_token: ${{ secrets.CLOUDFLARE_WARP_TOKEN }}

      - name: Check WARP Registration
        run: warp-cli --accept-tos registration show

      - name: Check WARP Status
        run: warp-cli --accept-tos status
```

## Use Cases

### 1. Access Internal Systems
Securely connect to **private resources** such as internal systems, databases, or APIs in your CI/CD pipeline, enabling tasks like **deployments**, **API testing**, and **end-to-end tests** without exposing resources to the public internet.

### 2. Network Consistency for E2E Testing
Cloudflare WARP ensures a consistent network environment for **end-to-end testing** by routing traffic through controlled Cloudflare nodes. This reduces **test flakiness** and enables **geo-location testing**.

### 3. Access Restricted Networks for Automation Testing
Run **automation tests** such as **Robot Framework** in restricted networks or behind firewalls. This action securely connects your GitHub runner to the required network, allowing for seamless testing.

### 4. Security Testing in Protected Environment
Run **penetration tests** and **vulnerability scans** within your CI/CD pipeline, utilizing the security of Cloudflare’s network and ensuring sensitive data stays protected.

### 5. Masking and Encrypting Traffic
- **IP Masking**: Hide the runner's IP address by routing traffic through Cloudflare’s network.
- **Encryption**: All runner traffic is encrypted, ensuring a secure testing and deployment process.

## Security

Ensure you securely store sensitive information like `cloudflare_access_client_id`, `cloudflare_client_secret`, and `cloudflare_warp_token` using [GitHub Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).

## Contributions

We welcome contributions! Feel free to report bugs, request features, or open a pull request to help improve the **Cloudflare WARP Connector GitHub Action**.
