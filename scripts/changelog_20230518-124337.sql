--liquibase formatted sql

--changeset jose.lanzos:20230518-124337 labels:Vueling_SAP context:DEV
--comment:Otro modelo
CREATE TABLE test_table_202 (
test_id INT,
test_column VARCHAR(255),
PRIMARY KEY (test_id)
)
