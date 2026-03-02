-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 PE (Physical and Environmental Protection)
-- 11 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'pe-1', 'Supportive', 'PE policy establishes physical protection for AI infrastructure', 'Include AI infrastructure in physical and environmental protection policy', ARRAY['policy_documents']),
  ('MANAGE 2.4', 'pe-2', 'Supportive', 'Physical access authorizations protect AI processing facilities', 'Control physical access to facilities housing AI training and inference hardware', ARRAY['access_control_records']),
  ('MANAGE 2.4', 'pe-3', 'Supportive', 'Physical access control protects AI infrastructure', 'Enforce physical access controls at AI data center and GPU cluster locations', ARRAY['access_control_records']),
  ('MANAGE 2.4', 'pe-6', 'Supportive', 'Monitoring physical access supports AI infrastructure security', 'Monitor physical access to AI training and inference facilities', ARRAY['monitoring_logs']),
  ('MANAGE 2.2', 'pe-9', 'Supportive', 'Power equipment protection supports AI system availability', 'Protect power systems for AI GPU clusters and inference servers', ARRAY['maintenance_records']),
  ('MANAGE 2.2', 'pe-10', 'Supportive', 'Emergency shutoff applies to AI infrastructure power management', 'Include AI infrastructure in emergency power shutoff procedures', ARRAY['emergency_procedures']),
  ('MANAGE 2.2', 'pe-11', 'Supportive', 'Emergency power supports AI system continuity', 'Provide uninterruptible power for critical AI inference workloads', ARRAY['configuration_records']),
  ('MANAGE 2.2', 'pe-13', 'Supportive', 'Fire protection supports AI infrastructure availability', 'Install fire suppression in AI GPU cluster and data storage areas', ARRAY['maintenance_records']),
  ('MANAGE 2.2', 'pe-14', 'Supportive', 'Environmental controls support AI hardware reliability', 'Maintain temperature and humidity controls for AI compute hardware', ARRAY['monitoring_logs']),
  ('MANAGE 2.2', 'pe-17', 'Supportive', 'Alternate work site supports AI operations continuity', 'Enable AI system administration from alternate work sites', ARRAY['contingency_plans']),
  ('MAP 1.1', 'pe-18', 'Supportive', 'Component location supports AI infrastructure inventory', 'Document physical locations of AI compute and storage infrastructure', ARRAY['asset_inventory'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
