{{/*
Component labels — merged with common labels for a specific component.
Usage: include "relayfile.componentLabels" (dict "context" . "component" "server")
*/}}
{{- define "relayfile.componentLabels" -}}
{{ include "relayfile.labels" .context }}
app.kubernetes.io/component: {{ .component }}
{{- end }}

{{/*
Component selector labels.
Usage: include "relayfile.componentSelectorLabels" (dict "context" . "component" "server")
*/}}
{{- define "relayfile.componentSelectorLabels" -}}
{{ include "relayfile.selectorLabels" .context }}
app.kubernetes.io/component: {{ .component }}
{{- end }}
