-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 CP (Contingency Planning)
-- 11 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'cp-1', 'Partial', 'CP policy establishes continuity requirements for AI systems', 'Include AI system continuity requirements in contingency planning policy', ARRAY['policy_documents']),
  ('GOVERN 1.3', 'cp-1', 'Partial', 'CP procedures support AI system recovery processes', 'Define contingency procedures for AI system failures and degradation', ARRAY['policy_documents']),
  ('MANAGE 2.2', 'cp-2', 'Strong', 'Contingency plans directly support AI system resilience', 'Develop contingency plans for AI model failures including fallback and degradation strategies', ARRAY['contingency_plans']),
  ('MANAGE 4.1', 'cp-2', 'Partial', 'Contingency planning prepares for AI incident recovery', 'Include AI-specific recovery procedures in contingency plans', ARRAY['contingency_plans']),
  ('MEASURE 1.1', 'cp-3', 'Partial', 'Contingency training supports AI recovery readiness', 'Include AI system recovery scenarios in contingency training exercises', ARRAY['training_records']),
  ('MEASURE 1.1', 'cp-4', 'Partial', 'Contingency testing validates AI system recovery capabilities', 'Test AI system failover and recovery procedures', ARRAY['test_reports']),
  ('MEASURE 1.3', 'cp-4', 'Partial', 'Testing validates AI measurement continuity during disruptions', 'Verify AI monitoring continues during contingency operations', ARRAY['test_reports']),
  ('MANAGE 2.2', 'cp-6', 'Partial', 'Alternate processing supports AI system availability', 'Identify alternate processing sites for critical AI workloads', ARRAY['contingency_plans']),
  ('MANAGE 2.2', 'cp-7', 'Partial', 'Alternate storage supports AI data and model availability', 'Maintain backup copies of AI models and critical training data', ARRAY['backup_records']),
  ('MANAGE 2.2', 'cp-9', 'Partial', 'System backup supports AI model and data recovery', 'Back up AI models, configurations, and training data per recovery requirements', ARRAY['backup_records']),
  ('MANAGE 2.2', 'cp-10', 'Partial', 'Recovery and reconstitution supports AI system restoration', 'Define procedures for reconstituting AI systems to known-good states', ARRAY['contingency_plans'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
