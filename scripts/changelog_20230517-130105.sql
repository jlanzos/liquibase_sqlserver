--liquibase formatted sql

--changeset jose.lanzos:20230517-130105 labels:Vueling_SAP context:DEV
--comment:Muchos comentarios
CREATE TABLE test_table_202 (
test_id INT,
test_column VARCHAR(255),
PRIMARY KEY (test_id)
)
