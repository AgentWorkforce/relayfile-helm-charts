{{/*
Return the appropriate apiVersion for HorizontalPodAutoscaler.
Prefer autoscaling/v2; fall back to v2beta2 for older clusters.
*/}}
{{- define "relayfile.capabilities.hpa.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "autoscaling/v2" -}}
autoscaling/v2
{{- else -}}
autoscaling/v2beta2
{{- end -}}
{{- end }}

{{/*
Return the appropriate apiVersion for PodDisruptionBudget.
*/}}
{{- define "relayfile.capabilities.pdb.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "policy/v1" -}}
policy/v1
{{- else -}}
policy/v1beta1
{{- end -}}
{{- end }}

{{/*
Return the appropriate apiVersion for VPA.
*/}}
{{- define "relayfile.capabilities.vpa.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "autoscaling.k8s.io/v1" -}}
autoscaling.k8s.io/v1
{{- else -}}
autoscaling.k8s.io/v1beta2
{{- end -}}
{{- end }}
