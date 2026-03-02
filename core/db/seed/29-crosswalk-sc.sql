-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 SC (System and Communications Protection)
-- 15 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'sc-1', 'Partial', 'SC policy establishes protection requirements for AI systems', 'Include AI system communication and boundary requirements in SC policy', ARRAY['policy_documents']),
  ('MANAGE 2.2', 'sc-5', 'Partial', 'DoS protection supports AI system availability', 'Protect AI inference endpoints from denial-of-service attacks', ARRAY['architecture_documents']),
  ('MANAGE 2.4', 'sc-5', 'Partial', 'DoS protection mitigates AI availability risks', 'Implement rate limiting and load balancing for AI endpoints', ARRAY['architecture_documents']),
  ('MANAGE 2.4', 'sc-7', 'Partial', 'Boundary protection controls AI system network access', 'Segment AI training and inference environments with network boundaries', ARRAY['architecture_documents', 'configuration_records']),
  ('MAP 2.1', 'sc-7', 'Partial', 'Boundary protection defines AI system operational scope', 'Document AI system network boundaries and allowed communications', ARRAY['architecture_documents']),
  ('MANAGE 2.4', 'sc-8', 'Supportive', 'Transmission protection supports AI data confidentiality in transit', 'Encrypt AI model data and inference traffic in transit', ARRAY['configuration_records']),
  ('MANAGE 2.4', 'sc-28', 'Partial', 'Information at rest protection applies to AI models and training data', 'Encrypt stored AI models, training datasets, and inference logs', ARRAY['configuration_records']),
  ('MAP 1.1', 'sc-28', 'Partial', 'Data at rest protection supports AI data asset management', 'Apply encryption and access controls to stored AI data assets', ARRAY['configuration_records']),
  ('GOVERN 1.3', 'sc-38', 'Partial', 'Operations security supports AI system operational risk reduction', 'Apply operations security principles to AI model deployment and operation', ARRAY['policy_documents']),
  ('MANAGE 2.4', 'sc-38', 'Partial', 'Operations security mitigates AI system exposure risks', 'Protect AI system architecture details from unauthorized disclosure', ARRAY['policy_documents']),
  ('MAP 1.1', 'sc-42', 'Strong', 'Sensor data controls directly relevant to AI systems that process sensor inputs', 'Define authorized sensor data collection for AI-driven analysis systems', ARRAY['data_inventory', 'policy_documents']),
  ('MAP 1.5', 'sc-42', 'Strong', 'Sensor controls support AI data collection impact assessment', 'Assess impacts of AI sensor data collection on individuals and communities', ARRAY['impact_assessments']),
  ('GOVERN 1.4', 'sc-42', 'Partial', 'Sensor controls support AI data governance compliance', 'Ensure AI sensor data collection complies with privacy and legal requirements', ARRAY['policy_documents']),
  ('MAP 2.1', 'sc-43', 'Partial', 'Usage restrictions define boundaries for AI system operation', 'Restrict AI system usage to authorized purposes and contexts', ARRAY['policy_documents']),
  ('GOVERN 1.4', 'sc-43', 'Partial', 'Usage restrictions support AI compliance requirements', 'Enforce organizational AI usage policies', ARRAY['policy_documents'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
