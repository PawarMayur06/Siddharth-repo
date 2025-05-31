-- macros/generate_alias_name.sql
{% macro generate_alias_name(custom_alias_name=none, node=none) -%}
    {%- if custom_alias_name is none -%}
        {% set model_name = node.name %}
        {% set splits = model_name.split('_', 1) %}
        {%- if splits|length > 1 -%}
            {{ splits[1] }}
        {%- else -%}
            {{ model_name }}
        {%- endif -%}
    {%- else -%}
        {{ custom_alias_name }}
    {%- endif -%}
{%- endmacro %}