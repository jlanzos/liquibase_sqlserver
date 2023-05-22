--liquibase formatted sql

--changeset a_jose.lanzos:20200101-010000 labels:dbo context:Any
--comment: Liquibase Tables creation  
SELECT count(1) from [sys].[tables]