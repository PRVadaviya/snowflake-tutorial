/* 
    ----3 WAY TO LOAD DATA FROM THE LOCAL STORAGE(USING INTERNAL STAGE)----

    1) NAMED INTERNAL STAGE
        create or replace stage my_stage 
        file_format = my_csv_format

    2) PUT DATA TO STAGE
        PUT FILE:///data/data.csv @MY_STAGE

    3) COPY DATA TO TABLE 
        copy into my_table from @my_stage

    ---- LOAD DATA FROM THE CLOUD STORAGE WITH USE OF THE EXTERNAL STAGE

    1) CREATE EXTERNAL STAGE (POINTER TO S3 BUCKET)
        create stage my_s3_stage
        url='s3://mybucket/encrypted_files/'
        credentials=(aws_key_id = '***' aws_secret_key= '***' )
        encryption=(master_key = '****')
        file_format = my_csv_format;

    2) LOAD DATA USING COPY
        copy into my_table 
        from @my_s3_stage
        pattern='.*sales.*.csv'

    ---3) load continues data using snowpipe ---
    
*/