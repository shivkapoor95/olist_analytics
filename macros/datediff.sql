{% macro datediff(start_date, end_date) %}
    EXTRACT(epoch from ({{ end_date }} - {{ start_date }})) / 86400
{% endmacro %}