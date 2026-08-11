{{/*
Fully qualified name for a component.
Usage: include "relayfile.componentName" (dict "context" . "component" "server")
*/}}
{{- define "relayfile.componentName" -}}
{{- printf "%s-%s" (include "relayfile.fullname" .context) .component | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Name for the server component.
*/}}
{{- define "relayfile.server.name" -}}
{{- include "relayfile.componentName" (dict "context" . "component" "server") -}}
{{- end }}
