ALTER TABLE {TARGET_SCHEMA}.drug_exposure ADD CONSTRAINT fpk_drug_v_detail FOREIGN KEY (visit_detail_id) REFERENCES {TARGET_SCHEMA}.visit_detail (visit_detail_id);
