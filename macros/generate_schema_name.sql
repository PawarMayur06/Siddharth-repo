-- macros/generate_schema_name.sql
{% macro generate_schema_name(custom_schema_name, node) %}
  {% set layer_prefix = custom_schema_name or 'default' %}
  {{ layer_prefix }}_{{ target.name | lower }}
{% endmacro %}