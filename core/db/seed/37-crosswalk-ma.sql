-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 MA (Maintenance)
-- 7 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'ma-1', 'Supportive', 'MA policy establishes maintenance requirements applicable to AI infrastructure', 'Include AI infrastructure maintenance requirements in MA policy', ARRAY['policy_documents']),
  ('MANAGE 2.2', 'ma-2', 'Partial', 'Controlled maintenance supports AI system uptime and integrity', 'Schedule AI system maintenance windows to minimize inference disruption', ARRAY['maintenance_records']),
  ('MANAGE 2.4', 'ma-2', 'Supportive', 'Controlled maintenance reduces AI system vulnerability exposure', 'Apply security patches to AI infrastructure during maintenance windows', ARRAY['maintenance_records']),
  ('MANAGE 2.4', 'ma-3', 'Supportive', 'Maintenance tools management protects AI system integrity during servicing', 'Control tools used to maintain AI training and inference infrastructure', ARRAY['maintenance_records']),
  ('MANAGE 2.4', 'ma-4', 'Supportive', 'Nonlocal maintenance controls protect remote AI system administration', 'Secure remote maintenance sessions for AI infrastructure', ARRAY['maintenance_records', 'access_control_records']),
  ('GOVERN 2.1', 'ma-5', 'Supportive', 'Maintenance personnel controls support AI infrastructure trustworthiness', 'Vet maintenance personnel with access to AI infrastructure', ARRAY['personnel_records']),
  ('MANAGE 2.2', 'ma-6', 'Supportive', 'Timely maintenance supports AI system reliability', 'Prioritize maintenance for AI infrastructure components', ARRAY['maintenance_records'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
