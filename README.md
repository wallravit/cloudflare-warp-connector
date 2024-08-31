
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
        uses: 24x7x/gh-cloudflare-warp-connector@v1.0.0
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
https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/private-net/warp-connector/

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
        uses: 24x7x/gh-cloudflare-warp-connector@v1.0.0
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

## Security

It's crucial to store sensitive information like `cloudflare_access_client_id`, `cloudflare_client_secret`, and `cloudflare_warp_token` in GitHub Secrets. You can add them in the repository settings under `Secrets and variables > Actions`.

## Contributions

Contributions are welcome! If you find a bug or have a feature request, please open an issue. Pull requests are also welcome.