{{- define "api-server.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "api-server.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- with .Chart.AppVersion }}
app.kubernetes.io/version: {{ . | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "api-server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "api-server.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
