{{/*
Server component full name.
*/}}
{{- define "relayfile.server.fullname" -}}
{{- printf "%s-server" (include "relayfile.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Server component labels.
*/}}
{{- define "relayfile.server.labels" -}}
{{ include "relayfile.labels" . }}
app.kubernetes.io/component: server
{{- end }}

{{/*
Server component selector labels.
*/}}
{{- define "relayfile.server.selectorLabels" -}}
{{ include "relayfile.selectorLabels" . }}
app.kubernetes.io/component: server
{{- end }}

{{/*
Render the environment variables block for the server container.
Env vars come from three sources (in priority order Kubernetes applies):
  1. envFrom (bulk secret/configmap mounts)
  2. explicit env entries from the chart values
  3. user-supplied extraEnv
*/}}
{{- define "relayfile.server.env" -}}
- name: RELAYFILE_ADDR
  value: {{ .Values.server.addr | quote }}
- name: RELAYFILE_BACKEND_PROFILE
  value: {{ .Values.server.backendProfile | quote }}
- name: RELAYFILE_ENVELOPE_WORKERS
  value: {{ .Values.server.envelopeWorkers | quote }}
- name: RELAYFILE_WRITEBACK_WORKERS
  value: {{ .Values.server.writebackWorkers | quote }}
- name: RELAYFILE_PROVIDER_MAX_CONCURRENCY
  value: {{ .Values.server.providerMaxConcurrency | quote }}
{{- if .Values.server.rateLimitMax }}
- name: RELAYFILE_RATE_LIMIT_MAX
  value: {{ .Values.server.rateLimitMax | quote }}
{{- end }}
{{- if .Values.server.rateLimitWindow }}
- name: RELAYFILE_RATE_LIMIT_WINDOW
  value: {{ .Values.server.rateLimitWindow | quote }}
{{- end }}
{{- if .Values.server.maxBodyBytes }}
- name: RELAYFILE_MAX_BODY_BYTES
  value: {{ .Values.server.maxBodyBytes | quote }}
{{- end }}
{{- if .Values.auth.jwksUrl }}
- name: RELAYAUTH_JWKS_URL
  value: {{ .Values.auth.jwksUrl | quote }}
{{- end }}
{{- if .Values.providers.notion.baseUrl }}
- name: RELAYFILE_NOTION_BASE_URL
  value: {{ .Values.providers.notion.baseUrl | quote }}
{{- end }}
{{- if .Values.providers.notion.apiVersion }}
- name: RELAYFILE_NOTION_API_VERSION
  value: {{ .Values.providers.notion.apiVersion | quote }}
{{- end }}
- name: RELAYFILE_PRODUCTION_DSN
  valueFrom:
    secretKeyRef:
      name: {{ include "relayfile.secretName" . }}
      key: RELAYFILE_PRODUCTION_DSN
      optional: true
- name: RELAYFILE_INTERNAL_HMAC_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ include "relayfile.secretName" . }}
      key: RELAYFILE_INTERNAL_HMAC_SECRET
- name: RELAYFILE_JWT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ include "relayfile.secretName" . }}
      key: RELAYFILE_JWT_SECRET
      optional: true
- name: RELAYFILE_NOTION_TOKEN
  valueFrom:
    secretKeyRef:
      name: {{ include "relayfile.secretName" . }}
      key: RELAYFILE_NOTION_TOKEN
      optional: true
{{- with .Values.extraEnv }}
{{ toYaml . }}
{{- end }}
{{- end }}
