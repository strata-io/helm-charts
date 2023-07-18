{{/*
The base config.
*/}}
{{- define "orchestrator.baseConfig" -}}
{{- .Values.orchestrator.baseConfig | toYaml }}
{{- end }}

{{/*
Build config file for Orchestrator deployment
*/}}
{{- define "orchestrator.deploymentConfig" -}}
{{- $values := deepCopy .Values }}
{{- $data := dict "Values" $values | mustMergeOverwrite (deepCopy .) }}
{{- $config := include "orchestrator.baseConfig" $data | fromYaml }}
{{- if .Values.orchestrator.customConfig }}
{{- $config := mustMergeOverwrite $config .Values.orchestrator.customConfig }}
{{- end }}
{{- tpl (toYaml $config) . }}
{{- end }}
