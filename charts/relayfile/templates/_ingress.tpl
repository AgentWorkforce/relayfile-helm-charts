{{/*
Render TLS section for an Ingress.
Usage: include "relayfile.ingress.tls" .Values.ingress
*/}}
{{- define "relayfile.ingress.tls" -}}
{{- if .tls }}
tls:
  {{- toYaml .tls | nindent 2 }}
{{- end }}
{{- end }}

{{/*
Render rules section for an Ingress.
Usage: include "relayfile.ingress.rules" (dict "ingress" .Values.ingress "servicePort" 8080 "serviceName" "my-svc")
*/}}
{{- define "relayfile.ingress.rules" -}}
rules:
{{- range .ingress.hosts }}
  - host: {{ .host | quote }}
    http:
      paths:
      {{- range .paths }}
        - path: {{ .path }}
          pathType: {{ .pathType | default "Prefix" }}
          backend:
            service:
              name: {{ $.serviceName }}
              port:
                number: {{ $.servicePort }}
      {{- end }}
{{- end }}
{{- end }}
