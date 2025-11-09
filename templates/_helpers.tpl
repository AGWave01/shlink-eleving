{{/*
Return the full name for the shlink backend
*/}}
{{- define "shlink.fullname" -}}
{{ printf "%s-%s" .Release.Name "shlink" }}
{{- end }}

{{/*
Return the full name for the shlink web UI
*/}}
{{- define "shlinkweb.fullname" -}}
{{ printf "%s-%s" .Release.Name "shlink-web" }}
{{- end }}
