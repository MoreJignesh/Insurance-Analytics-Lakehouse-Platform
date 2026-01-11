{# SELECT *
FROM  {{ source('src_bronze','bronze_staging_volume')}}
     #}
{# insurance_analytics_project.src_bronze.bronze_staging_volume #}
SELECT * 
FROM  delta.`/Volumes/insurance_analytics_project/src_bronze/bronze_volume/data/`

{# Below location works but it's not recommended for long term use, not a good practice. #}
{# delta.`/Volumes/insurance_analytics_project/src_bronze/bronze_staging_volume` #} ----location got changed

