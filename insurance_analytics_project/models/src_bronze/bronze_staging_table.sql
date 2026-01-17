{# SELECT *
FROM  {{ source('src_bronze','bronze_staging_volume')}}
     #}
{# insurance_analytics_project.src_bronze.bronze_staging_volume #}
{# SELECT * 
FROM delta.'/Volumes/insurance_analytics_project/src_bronze/bronze_volume/data/' #}
{# FROM  delta.`/Volumes/insurance_analytics_project/src_bronze/bronze_volume/data/` #}

SELECT *
FROM delta.`/Volumes/insurance_analytics_project/scr_bronze/bronze_volume/data/`

{# SELECT *
FROM insurance_analytics_project.scr_bronze.bronze_staging_table #}

{# Below location works but it's not recommended for long term use, not a good practice. #}
{# delta.`/Volumes/insurance_analytics_project/src_bronze/bronze_staging_volume` #} ----location got changed

{# insurance_analytics_project.scr_bronze
insurance_analytics_project.src_bronze #}