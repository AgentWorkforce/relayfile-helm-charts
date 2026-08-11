{{/*
Render resource requests/limits if set.
Usage: include "relayfile.resources" .Values.resources
*/}}
{{- define "relayfile.resources" -}}
{{- if . }}
resources:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
