ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_concept FOREIGN KEY (visit_concept_id) REFERENCES concept (concept_id);

ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_type_concept FOREIGN KEY (visit_type_concept_id)  REFERENCES concept (concept_id);

ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_concept_s FOREIGN KEY (visit_source_concept_id)  REFERENCES concept (concept_id);

ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_discharge FOREIGN KEY (discharge_to_concept_id) REFERENCES concept (concept_id);
