-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 MP (Media Protection)
-- 8 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'mp-1', 'Supportive', 'MP policy establishes media protection requirements for AI data assets', 'Include AI training data and model media in protection policy', ARRAY['policy_documents']),
  ('MANAGE 2.4', 'mp-2', 'Supportive', 'Media access controls protect AI training data and model storage', 'Restrict physical access to media containing AI models and training data', ARRAY['access_control_records']),
  ('MAP 1.1', 'mp-3', 'Partial', 'Media marking supports AI data classification visibility', 'Mark media containing AI training data with appropriate classification labels', ARRAY['data_inventory']),
  ('MANAGE 2.4', 'mp-4', 'Supportive', 'Media storage protections apply to AI data at rest', 'Store AI training data and model media in controlled environments', ARRAY['configuration_records']),
  ('MANAGE 2.4', 'mp-5', 'Partial', 'Media transport protections apply to AI data and model transfers', 'Protect AI models and training data during physical transport', ARRAY['transport_records']),
  ('MANAGE 2.4', 'mp-6', 'Partial', 'Media sanitization applies to AI data decommissioning', 'Sanitize media containing AI training data, model weights, and inference logs', ARRAY['sanitization_records']),
  ('MAP 1.1', 'mp-6', 'Supportive', 'Media sanitization supports AI data lifecycle management', 'Track media sanitization for decommissioned AI data assets', ARRAY['sanitization_records']),
  ('MANAGE 2.4', 'mp-7', 'Supportive', 'Media use restrictions protect AI data from unauthorized copying', 'Restrict use of removable media on AI training and inference systems', ARRAY['policy_documents'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
