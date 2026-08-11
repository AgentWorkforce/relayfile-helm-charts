{{/*
Return the full image reference for the relayfile server container.
Tag defaults to .Chart.AppVersion when not set.
*/}}
{{- define "relayfile.images.server" -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion -}}
{{- printf "%s:%s" .Values.image.repository $tag -}}
{{- end }}

{{/*
Return imagePullSecrets as a list.
*/}}
{{- define "relayfile.images.pullSecrets" -}}
{{- if .Values.imagePullSecrets }}
imagePullSecrets:
{{ toYaml .Values.imagePullSecrets | indent 2 }}
{{- end }}
{{- end }}
