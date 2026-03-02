-- Crosswalk: NIST AI RMF 1.0 → 800-53 Rev 5 PL (Planning)
-- 15 mappings

INSERT INTO crosswalk_mappings (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
  ('GOVERN 1.1', 'pl-1', 'Partial', 'Planning policy establishes security planning requirements for AI systems', 'Include AI systems in security planning requirements', ARRAY['policy_documents']),
  ('GOVERN 1.1', 'pl-2', 'Strong', 'Security plans directly document AI system security posture', 'Document AI-specific security controls and risk mitigations in system security plans', ARRAY['security_plans']),
  ('GOVERN 1.3', 'pl-2', 'Strong', 'Security plans establish AI security processes', 'Include AI model lifecycle security procedures in security plans', ARRAY['security_plans']),
  ('GOVERN 4.1', 'pl-2', 'Partial', 'Security plans support AI deployment authorization', 'Reference security plan in AI system authorization decisions', ARRAY['security_plans']),
  ('GOVERN 1.4', 'pl-4', 'Strong', 'Rules of behavior directly applicable to AI system acceptable use', 'Define acceptable use rules for AI systems including prohibited uses', ARRAY['policy_documents']),
  ('GOVERN 6.1', 'pl-4', 'Strong', 'Rules of behavior establish AI usage expectations', 'Communicate AI system usage rules and consequences to all users', ARRAY['policy_documents', 'acknowledgment_records']),
  ('GOVERN 6.2', 'pl-4', 'Strong', 'Rules of behavior support AI governance enforcement', 'Enforce consequences for AI system misuse per rules of behavior', ARRAY['policy_documents']),
  ('MAP 1.1', 'pl-5', 'Strong', 'Privacy impact assessments directly applicable to AI systems', 'Conduct privacy impact assessments for AI systems processing personal data', ARRAY['privacy_impact_assessments']),
  ('MAP 3.1', 'pl-5', 'Strong', 'PIAs support AI risk identification', 'Identify privacy risks from AI automated decision-making in PIAs', ARRAY['privacy_impact_assessments']),
  ('GOVERN 1.4', 'pl-5', 'Partial', 'PIAs support AI privacy compliance', 'Use PIA results to inform AI system privacy controls', ARRAY['privacy_impact_assessments']),
  ('GOVERN 1.1', 'pl-7', 'Partial', 'Concept of operations contextualizes AI system roles', 'Describe AI system operational concept and role in mission delivery', ARRAY['architecture_documents']),
  ('MAP 2.1', 'pl-7', 'Strong', 'CONOPS directly defines intended AI system operation', 'Document AI system intended use, operational environment, and constraints', ARRAY['architecture_documents']),
  ('MAP 2.2', 'pl-7', 'Partial', 'CONOPS supports AI scope definition', 'Define AI system operational boundaries and user interactions', ARRAY['architecture_documents']),
  ('MAP 1.1', 'pl-8', 'Strong', 'Security architecture directly documents AI system design', 'Include AI system architecture in security architecture documentation', ARRAY['architecture_documents']),
  ('MAP 2.1', 'pl-8', 'Partial', 'Architecture supports AI system design principles', 'Apply security architecture principles to AI system design', ARRAY['architecture_documents'])
ON CONFLICT (subcategory_id, control_id) DO NOTHING;
