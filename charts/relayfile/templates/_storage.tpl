{{/*
Relayfile is a stateless HTTP server — all persistent state lives in Postgres.
No PersistentVolumeClaims are required for the server pod.
This partial is kept for structural parity with the reference layout and may
be used in the future if a durable-local data directory is mounted.
*/}}
{{- define "relayfile.storage.enabled" -}}
{{- false -}}
{{- end }}
