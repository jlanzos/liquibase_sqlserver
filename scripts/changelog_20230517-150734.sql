--liquibase formatted sql

--changeset jose.lanzos:20230517-150734 labels:Vueling_SAP context:'DEV'
--comment:Create liquibase_table_202
CREATE TABLE dbo.liquibase_table_202 (
test_id INT,
test_column VARCHAR(255),
PRIMARY KEY (test_id)
)
