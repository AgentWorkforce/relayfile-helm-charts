{{/*
Render a standard set of pod-level annotations.
*/}}
{{- define "relayfile.podAnnotations" -}}
{{- if . }}
{{- toYaml . }}
{{- end }}
{{- end }}

{{/*
Render nodeSelector, tolerations, and affinity blocks.
Usage: include "relayfile.scheduling" . (passes full root context)
*/}}
{{- define "relayfile.scheduling" -}}
{{- if .Values.nodeSelector }}
nodeSelector:
  {{- toYaml .Values.nodeSelector | nindent 2 }}
{{- end }}
{{- if .Values.tolerations }}
tolerations:
  {{- toYaml .Values.tolerations | nindent 2 }}
{{- end }}
{{- if .Values.affinity }}
affinity:
  {{- toYaml .Values.affinity | nindent 2 }}
{{- end }}
{{- end }}
