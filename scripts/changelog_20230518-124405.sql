--liquibase formatted sql

--changeset jose.lanzos:20230518-124405 labels:Vueling_SAP context:DEV
--comment: 
CREATE TABLE test_table_202 (
test_id INT,
test_column VARCHAR(255),
PRIMARY KEY (test_id)
)
