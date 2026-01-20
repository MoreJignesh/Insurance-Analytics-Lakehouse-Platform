
{{ config(materialized='view') }}

WITH base AS (

    SELECT
        id,
        coalesce(previous_claims,0) as previous_claims

    FROM {{ source('src_bronze', 'bronze_staging_table') }}

)

SELECT *
FROM base

