--hes_procedures_epi
alter table {SOURCE_SCHEMA}.hes_procedures_epi add constraint pk_hes_procedures_epi primary key (patid,epikey,p_order);
create index idx_hesapc_procedures_epi_patid on {SOURCE_SCHEMA}.hes_procedures_epi(patid,epikey,p_order);
cluster {SOURCE_SCHEMA}.hes_procedures_epi using idx_hesapc_procedures_epi_patid;