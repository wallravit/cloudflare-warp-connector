
# Setup Cloudflare WARP Connector GitHub Action

This GitHub Action sets up and configures the Cloudflare WARP connector on an Ubuntu system. It automates the installation of the Cloudflare WARP client, configures it with the necessary Cloudflare credentials, and ensures the connector is properly registered and connected.

## Usage

To use this action in your workflow, you can add the following step to your `.github/workflows/main.yml` file:

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

## Inputs

| Input Name                     | Description                                           | Required | Default |
|--------------------------------|-------------------------------------------------------|----------|---------|
| `organization`                 | Your organization or team name                       | `true`   |         |
| `cloudflare_access_client_id`  | Cloudflare Access Client ID                           | `true`   |         |
| `cloudflare_client_secret`     | Cloudflare Access Client Secret                       | `true`   |         |
| `cloudflare_warp_token`        | Cloudflare Connector Token                            | `true`   |         |

## How to get the Cloudflare WARP config
👉 https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/private-net/warp-connector/
<img width="1491" alt="Screenshot 2024-08-31 at 10 50 46" src="https://github.com/user-attachments/assets/9df67df7-ae06-4a35-884b-9b316f3cacfa">


## Outputs

This action does not generate any direct outputs. However, it installs, configures, and connects the Cloudflare WARP connector on the runner.

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

The `cloudflare-warp-connector` GitHub Action offers several valuable use cases, particularly in automation testing and CI/CD pipelines:

### 1. Securely Connect to Private Resources
- **Access Internal Systems**: This action allows your GitHub Actions runner to securely connect to services or databases that are only accessible within a private network, essential for executing tasks like deployments, E2E tests, or API testing on internal systems without exposing them to the public internet.

### 2. Network Consistency for E2E Testing
- **Consistent Environment**: By routing E2E test traffic through Cloudflare WARP, you ensure a controlled and stable network environment, reducing test flakiness due to network inconsistencies.
- **Geo-Testing**: The ability to route traffic through different geographical nodes makes it easier to simulate location-specific behaviors in tests.

### 3. Access Restricted Networks for Automation Testing
- **Robot Framework Tests**: For tests executed on systems within secure or restricted networks, this action provides a tunnel into those environments, allowing seamless test execution.
- **Testing APIs Behind Firewalls**: When testing APIs that are restricted to specific IP ranges or networks, this action makes it possible for your runner to appear within the required network, enabling thorough API testing.

### 4. Security Testing in a Protected Environment
- **Penetration Testing and Vulnerability Scanning**: Security tests often require a secure and isolated environment. Using this action, you can run these tests securely within your CI/CD pipeline, ensuring sensitive data remains protected.
- **Simulating Different Network Conditions**: This action can simulate different network conditions by routing traffic through various Cloudflare nodes, which is useful for testing the resilience and performance of applications under diverse network scenarios.

### 5. Masking and Encrypting Traffic
- **IP Masking**: For projects that require hiding the public IP address of the GitHub Actions runner, this action can route traffic through Cloudflare’s network, effectively masking the runner’s IP.
- **Encrypted Communication**: Ensures all traffic from the GitHub Actions runner is encrypted, enhancing security during automation testing and deployment processes.

## Security

It's crucial to store sensitive information like `cloudflare_access_client_id`, `cloudflare_client_secret`, and `cloudflare_warp_token` in GitHub Secrets. You can add them in the repository settings under `Secrets and variables > Actions`.

## Contributions

Contributions are welcome! If you find a bug or have a feature request, please open an issue. Pull requests are also welcome.
