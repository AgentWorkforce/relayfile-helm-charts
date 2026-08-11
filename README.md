# relayfile-helm-charts

Helm charts for [Relayfile](https://github.com/AgentWorkforce/relayfile) — virtual filesystem sync for agents.

## Charts

| Chart | Description |
|-------|-------------|
| [relayfile](charts/relayfile) | Relayfile server — single Go binary, HTTP on :8080, Postgres-backed in production |

## Quick start

```bash
helm repo add relayfile https://AgentWorkforce.github.io/relayfile-helm-charts
helm repo update

helm install relayfile relayfile/relayfile \
  --set secrets.internalHmacSecret=<strong-secret> \
  --set secrets.productionDsn='postgres://user:pass@host:5432/dbname?sslmode=require' \
  --set auth.jwksUrl=https://auth.relay.example.com/.well-known/jwks.json
```

See [charts/relayfile/README.md](charts/relayfile/README.md) for the full parameter reference.

## Releases

Charts are packaged and published to GitHub Pages via [helm/chart-releaser-action](https://github.com/helm/chart-releaser-action) on every merge to `main`.

## Contributing

Open a PR against `main`. Merges are gated by Khaliq.
