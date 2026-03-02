-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 IR (Incident Response)
-- 22 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'ir-1', 'Partial', 'IR policy establishes incident handling requirements for AI systems', 'Include AI-specific incident categories in IR policy', ARRAY['policy_documents']),
  ('GOVERN 1.3', 'ir-1', 'Partial', 'IR procedures support AI incident handling processes', 'Define procedures for AI model failure and bias incidents', ARRAY['policy_documents']),
  ('GOVERN 3.2', 'ir-2', 'Partial', 'IR training supports AI incident response competency', 'Include AI-specific scenarios in incident response training', ARRAY['training_records']),
  ('MEASURE 1.1', 'ir-3', 'Partial', 'IR testing validates AI incident detection capabilities', 'Include AI failure scenarios in incident response exercises', ARRAY['test_reports']),
  ('MEASURE 1.3', 'ir-3', 'Partial', 'IR testing supports AI measurement validation', 'Test AI monitoring alert pathways during IR exercises', ARRAY['test_reports']),
  ('MANAGE 1.1', 'ir-4', 'Strong', 'Incident handling directly supports AI risk response execution', 'Handle AI model failures, bias incidents, and data breaches per IR plan', ARRAY['incident_records']),
  ('MANAGE 1.2', 'ir-4', 'Strong', 'Incident handling supports AI risk prioritization', 'Triage AI incidents based on impact to individuals and operations', ARRAY['incident_records']),
  ('MANAGE 1.3', 'ir-4', 'Strong', 'Incident handling tracks AI risk response actions', 'Document AI incident containment, eradication, and recovery actions', ARRAY['incident_records']),
  ('MANAGE 1.4', 'ir-4', 'Strong', 'Incident handling supports AI residual risk assessment', 'Assess remaining AI risks after incident response actions', ARRAY['incident_records']),
  ('MANAGE 4.1', 'ir-4', 'Strong', 'Incident handling is the primary AI risk response mechanism', 'Implement AI-specific incident handling procedures and playbooks', ARRAY['incident_records', 'incident_response_plans']),
  ('MANAGE 4.1', 'ir-5', 'Strong', 'Incident monitoring directly supports AI anomaly detection', 'Monitor for AI-specific incident indicators including model drift and output anomalies', ARRAY['monitoring_logs', 'incident_records']),
  ('MANAGE 4.2', 'ir-5', 'Strong', 'Incident monitoring supports AI risk communication', 'Track and report AI incident trends to stakeholders', ARRAY['incident_records', 'monitoring_logs']),
  ('MEASURE 3.1', 'ir-5', 'Partial', 'Incident monitoring contributes to AI measurement activities', 'Use incident data to inform AI measurement baselines', ARRAY['incident_records']),
  ('MANAGE 4.2', 'ir-6', 'Strong', 'Incident reporting directly supports AI risk communication', 'Report AI incidents to affected parties and regulatory bodies', ARRAY['incident_records', 'public_reports']),
  ('MANAGE 4.3', 'ir-6', 'Strong', 'Incident reporting supports AI accountability', 'Maintain transparent AI incident reporting for stakeholders', ARRAY['incident_records', 'public_reports']),
  ('GOVERN 5.2', 'ir-6', 'Partial', 'Incident reporting supports AI governance transparency', 'Share AI incident lessons learned with governance stakeholders', ARRAY['incident_records']),
  ('MANAGE 4.1', 'ir-7', 'Partial', 'Response assistance supports AI incident resolution', 'Provide AI-specific expertise for incident response teams', ARRAY['incident_records']),
  ('GOVERN 1.3', 'ir-8', 'Strong', 'IR plan directly supports AI incident preparedness', 'Include AI system failure modes and response procedures in IR plan', ARRAY['incident_response_plans']),
  ('MANAGE 1.1', 'ir-8', 'Strong', 'IR plan establishes AI risk response framework', 'Define AI incident severity levels, escalation paths, and response timelines', ARRAY['incident_response_plans']),
  ('MANAGE 4.1', 'ir-8', 'Strong', 'IR plan prepares for AI-specific incidents', 'Develop AI incident playbooks for model failures, bias events, and data poisoning', ARRAY['incident_response_plans']),
  ('MANAGE 1.2', 'ir-9', 'Partial', 'Information spillage response applies to AI data exposure incidents', 'Include AI training data exposure in spillage response procedures', ARRAY['incident_records']),
  ('GOVERN 2.1', 'ir-10', 'Partial', 'Integrated analysis team supports AI risk assessment expertise', 'Include AI expertise in security analysis team composition', ARRAY['organizational_charts'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
