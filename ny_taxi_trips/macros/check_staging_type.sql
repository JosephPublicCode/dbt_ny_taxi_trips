{% macro list_staging_fields() %}
{% set models_to_generate = codegen.get_models(directory='staging',prefix='stg') %}
{{
    codegen.generate_model_yaml(
        model_names = models_to_generate
    )
}}
{% endmacro %}

{% macro list_core_fields() %}
{% set models_to_generate = codegen.get_models(directory='core') %}
{{
    codegen.generate_model_yaml(
        model_names = models_to_generate
    )
}}
{% endmacro %}