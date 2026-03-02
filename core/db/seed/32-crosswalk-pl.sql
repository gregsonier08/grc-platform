-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — PL Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 PL controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- PL-1: Policy and Procedures
('GOVERN 1.1', 'pl-1', 'Partial',
 'PL-1 establishes the security and privacy planning policy framework that can incorporate AI-specific planning requirements for system development, deployment, and operations. Addresses the policy layer for planning but not the full scope of AI risk management policies.',
 'Extend PL-1 policy to require security and privacy planning for AI systems including model lifecycle planning, AI-specific risk assessment requirements, and integration of AI considerations into system authorization workflows.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

-- PL-2: System Security and Privacy Plans
('GOVERN 1.1', 'pl-2', 'Strong',
 'PL-2 system security plans directly document AI system security and privacy posture by requiring comprehensive documentation of controls, risk assessments, and operational procedures. Core planning control for AI system governance.',
 'Document AI-specific security controls, risk mitigations, and privacy protections in system security and privacy plans. Include AI model security requirements, training data protection measures, and inference pipeline security architecture.',
 ARRAY['System security plans', 'AI security control documentation', 'Privacy plan sections']),

('GOVERN 1.3', 'pl-2', 'Strong',
 'PL-2 security plans establish AI security processes and risk management procedures by documenting the operational security posture for AI systems. Addresses process documentation but not the risk tolerance determination itself.',
 'Include AI model lifecycle security procedures in system security plans covering development environment security, training pipeline integrity, deployment validation, and runtime monitoring requirements.',
 ARRAY['System security plans', 'AI lifecycle procedure documentation']),

('GOVERN 4.1', 'pl-2', 'Partial',
 'PL-2 security plans support a safety-first mindset for AI deployments by requiring documentation of security and privacy posture before system operation. Addresses documentation requirements but not the specific safety criteria for AI systems.',
 'Reference the system security plan in AI system authorization decisions to ensure security posture is documented and reviewed before deployment. Include AI-specific risk acceptance statements in the plan.',
 ARRAY['System security plans', 'Authorization decision records', 'Risk acceptance statements']),

('MAP 2.1', 'pl-2', 'Partial',
 'PL-2 security plans support documentation of AI system implementation by requiring description of system components, boundaries, and operational characteristics. Addresses security-focused documentation but not the full scope of AI method documentation.',
 'Document AI system components, data flows, and integration points in the system security plan. Include descriptions of AI model types, training methodologies, and inference architectures as relevant to security posture.',
 ARRAY['System security plans', 'AI component descriptions', 'Architecture documentation']),

-- PL-3: System Security Plan Update
('GOVERN 1.5', 'pl-3', 'Strong',
 'PL-3 plan updates directly support ongoing review of AI risk management by requiring periodic revision of security plans to reflect system changes and emerging threats. Core control for keeping AI security documentation current.',
 'Update system security plans when AI models are retrained, deployment architectures change, or new AI-specific threats emerge. Define update triggers for AI systems including model version changes, data source modifications, and regulatory requirement updates.',
 ARRAY['Plan update records', 'Update trigger documentation', 'Change-to-plan traceability']),

('MANAGE 4.2', 'pl-3', 'Partial',
 'PL-3 plan updates support continual AI improvement by ensuring security plans evolve with the AI system. Addresses plan maintenance but not the broader stakeholder engagement for improvement.',
 'Incorporate lessons learned from AI incidents, monitoring findings, and evaluation results into security plan updates. Track AI-related plan changes over time to demonstrate continual security posture improvement.',
 ARRAY['Plan revision history', 'Lesson learned integration records', 'Improvement tracking documentation']),

-- PL-4: Rules of Behavior
('GOVERN 1.4', 'pl-4', 'Strong',
 'PL-4 rules of behavior directly apply to AI system acceptable use by defining expected user conduct, restrictions, and consequences for misuse. Core governance control for establishing AI usage norms across the organization.',
 'Define acceptable use rules for AI systems including prohibited uses (unauthorized profiling, discriminatory decision-making, unvetted model deployment), data handling requirements, and obligations to report AI system anomalies or harmful outputs.',
 ARRAY['Rules of behavior documents', 'AI acceptable use policies', 'User acknowledgment records']),

('GOVERN 6.1', 'pl-4', 'Strong',
 'PL-4 rules of behavior directly address third-party AI risks by establishing usage expectations that apply to all system users including those interacting with third-party AI components. Addresses usage governance but not third-party risk assessment.',
 'Communicate AI system usage rules to all users including restrictions on sharing organizational data with external AI services, requirements for approved AI tools, and obligations regarding third-party AI intellectual property compliance.',
 ARRAY['Rules of behavior documents', 'Third-party usage guidelines', 'Communication records']),

('GOVERN 6.2', 'pl-4', 'Strong',
 'PL-4 rules of behavior support contingency processes for AI failures by establishing enforcement mechanisms and consequences that apply when AI systems are misused or cause disruptions. Addresses enforcement but not contingency planning.',
 'Enforce consequences for AI system misuse per rules of behavior including unauthorized data processing, circumvention of AI safety controls, and deployment of unapproved AI models. Maintain disciplinary records for AI-related policy violations.',
 ARRAY['Enforcement action records', 'Violation documentation', 'Disciplinary records']),

('GOVERN 3.2', 'pl-4', 'Partial',
 'PL-4 rules of behavior support human-AI role definition by establishing expected conduct for users who interact with or oversee AI systems. Addresses behavioral expectations but not the policy framework for human-AI configurations.',
 'Include role-specific behavioral expectations for AI system operators, reviewers, and oversight personnel. Define when human override of AI decisions is required and behavioral expectations for AI output review and validation.',
 ARRAY['Role-specific behavior rules', 'Override procedure documentation', 'Review expectations']),

-- PL-5: Privacy Impact Assessment
('MAP 1.1', 'pl-5', 'Strong',
 'PL-5 privacy impact assessments directly apply to AI systems by requiring analysis of how personal data is collected, used, and protected in system operations. Core privacy planning control for AI systems that process personal data.',
 'Conduct privacy impact assessments for AI systems processing personal data covering training data collection, automated inference on personal data, AI-generated personal information, and model memorization risks.',
 ARRAY['Privacy impact assessments', 'AI-specific PIA sections', 'Memorization risk analysis']),

('MAP 3.1', 'pl-5', 'Strong',
 'PL-5 PIAs directly support examination of AI system benefits and risks by requiring analysis of privacy impacts alongside system functionality. Core mechanism for identifying AI-specific privacy risks before deployment.',
 'Identify privacy risks from AI automated decision-making, profiling, and inference in privacy impact assessments. Analyze potential for disparate privacy impact across demographic groups and evaluate whether AI processing creates new privacy risks not present in manual processes.',
 ARRAY['Privacy impact assessments', 'Disparate impact analysis', 'AI vs manual comparison documentation']),

('GOVERN 1.4', 'pl-5', 'Partial',
 'PL-5 PIAs support transparent AI privacy governance by documenting privacy risk analysis and mitigation decisions. Addresses privacy documentation but not comprehensive AI risk management transparency.',
 'Use PIA results to inform AI system privacy control selection and implementation. Publish PIA summaries for AI systems to demonstrate transparent privacy governance and informed risk acceptance.',
 ARRAY['Privacy impact assessments', 'PIA summary publications', 'Control selection rationale']),

('MEASURE 2.10', 'pl-5', 'Strong',
 'PL-5 PIAs directly support AI privacy risk examination by providing the structured assessment methodology for analyzing how AI systems affect individual privacy. Core assessment mechanism for AI privacy risk.',
 'Include AI-specific privacy risk factors in PIAs such as training data re-identification risk, model inversion potential, membership inference vulnerability, and inference result sensitivity. Update PIAs when AI models are retrained or processing scope changes.',
 ARRAY['Privacy impact assessments', 'AI privacy risk factor documentation', 'PIA update records']),

-- PL-6: Security-Related Activity Planning
('GOVERN 4.3', 'pl-6', 'Partial',
 'PL-6 security-related activity planning supports organizational practices for AI testing by requiring coordination and planning of security assessment activities. Addresses planning of security activities but not the testing practices themselves.',
 'Plan and coordinate AI-specific security assessment activities including adversarial robustness testing, model security reviews, and penetration testing of AI endpoints. Schedule AI security activities to minimize disruption to model training and serving operations.',
 ARRAY['Security activity schedules', 'AI assessment planning records', 'Coordination documentation']),

-- PL-7: Concept of Operations
('GOVERN 1.1', 'pl-7', 'Partial',
 'PL-7 concept of operations contextualizes AI systems within organizational mission by describing how systems support operational objectives. Addresses operational context but not AI-specific governance policies.',
 'Describe AI system operational concept and role in mission delivery including what decisions AI informs, what human oversight is required, and how AI outputs integrate with existing workflows.',
 ARRAY['Concept of operations documents', 'AI operational role descriptions', 'Workflow integration documentation']),

('MAP 2.1', 'pl-7', 'Strong',
 'PL-7 CONOPS directly defines intended AI system operation by documenting the operational environment, user interactions, and system behaviors. Core documentation for establishing AI system operational expectations.',
 'Document AI system intended use, operational environment, user personas, expected workloads, and operational constraints in the concept of operations. Include descriptions of AI model behavior under normal, degraded, and failure conditions.',
 ARRAY['Concept of operations documents', 'Operational behavior specifications', 'User persona documentation']),

('MAP 2.2', 'pl-7', 'Partial',
 'PL-7 CONOPS supports documentation of AI system knowledge limits by defining operational boundaries and expected interaction patterns. Addresses operational scope but not the scientific understanding of AI model limitations.',
 'Define AI system operational boundaries and user interaction expectations in the concept of operations. Document what the AI system is designed to do, what it is not designed to do, and what conditions may cause degraded or unreliable operation.',
 ARRAY['Operational boundary documentation', 'Limitation disclosures', 'Degradation condition specifications']),

('MAP 3.3', 'pl-7', 'Partial',
 'PL-7 CONOPS supports targeted application scope specification by documenting the intended operational context within which the AI system is designed to function. Addresses operational scope but not the technical capability assessment.',
 'Align AI system concept of operations with the documented application scope and validated performance envelope. Define operational conditions under which AI system outputs should and should not be relied upon.',
 ARRAY['Scope-CONOPS alignment records', 'Reliability boundary documentation']),

-- PL-8: Security and Privacy Architectures
('MAP 1.1', 'pl-8', 'Strong',
 'PL-8 security architecture directly documents AI system design by requiring description of security and privacy design principles, components, and their relationships. Core architectural control for AI system security design.',
 'Include AI system architecture in security architecture documentation showing model serving infrastructure, training pipeline components, data flow paths, and security control placement. Document AI-specific architectural decisions and their security rationale.',
 ARRAY['Security architecture documents', 'AI architecture diagrams', 'Design decision records']),

('MAP 2.1', 'pl-8', 'Partial',
 'PL-8 architecture documentation supports documentation of AI implementation components by requiring description of system design principles and component relationships. Addresses architectural design but not the full documentation of AI methods and tasks.',
 'Apply security architecture principles to AI system design including defense in depth for model serving, least privilege for training pipeline access, and separation of duties for model development and deployment roles.',
 ARRAY['Architecture design records', 'Security principle application documentation']),

('MEASURE 2.7', 'pl-8', 'Partial',
 'PL-8 security architecture supports AI security evaluation by providing the design documentation against which security posture can be assessed. Addresses architectural assessment basis but not the evaluation methodology.',
 'Use security architecture documentation as the basis for AI system security evaluations. Verify that implemented AI security controls match the architectural design and identify gaps between planned and actual security posture.',
 ARRAY['Architecture-implementation comparison records', 'Security gap analysis', 'Evaluation findings']),

-- PL-9: Central Management
('GOVERN 1.1', 'pl-9', 'Partial',
 'PL-9 central management supports AI governance by enabling centralized oversight of security controls across AI systems. Addresses management consolidation but not AI-specific governance policies.',
 'Include AI system security controls in centralized management platforms to enable consistent policy enforcement, monitoring, and reporting across the AI portfolio. Define which AI security controls require central versus distributed management.',
 ARRAY['Central management configurations', 'AI control inventory', 'Management scope documentation']),

-- PL-10: Baseline Selection
('GOVERN 1.3', 'pl-10', 'Partial',
 'PL-10 baseline selection supports AI risk management by establishing the initial set of security and privacy controls applied to AI systems based on risk categorization. Addresses control selection but not AI-specific risk tolerance determination.',
 'Select security control baselines for AI systems based on system risk categorization considering data sensitivity, decision impact, and autonomy level. Apply higher baselines to AI systems making consequential decisions about individuals.',
 ARRAY['Baseline selection records', 'Risk categorization documentation', 'AI impact assessment records']),

-- PL-11: Baseline Tailoring
('GOVERN 1.3', 'pl-11', 'Partial',
 'PL-11 baseline tailoring supports AI risk management by enabling adjustment of security controls to address AI-specific risks not covered by the standard baseline. Addresses control customization but not AI-specific risk process design.',
 'Tailor security control baselines for AI systems to address AI-specific risks including adversarial robustness, model integrity, training data protection, and output validation. Document tailoring decisions with AI risk rationale for each added or modified control.',
 ARRAY['Tailoring documentation', 'AI-specific control additions', 'Tailoring rationale records'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
