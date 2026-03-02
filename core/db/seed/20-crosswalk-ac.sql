-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — AC Family Crosswalk Mappings
-- Source: NIST_AI_RMF_to_800-53_AC_Crosswalk.xlsx
-- 24 subcategory rows → 66 individual control mappings
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
('GOVERN 1.1', 'ac-1', 'Partial',
 'AC-1 establishes the access control policy framework that can incorporate AI-specific legal and regulatory requirements. Addresses the policy layer but not the full scope of AI-specific legal tracking.',
 'Extend AC-1 policy to explicitly address AI system access requirements under HIPAA, state AI regulations, and FDA guidance for AI/ML in digital therapeutics. DLP solution policies should cover AI data handling.',
 ARRAY['Policy documents', 'GRC platform control evidence']),

('GOVERN 1.2', 'ac-1', 'Partial',
 'Access control policies (AC-1), enforcement mechanisms (AC-3), and information flow controls (AC-4) support trustworthy AI characteristics of security and privacy. Does not address explainability, fairness, or other non-security trustworthiness characteristics.',
 'Integrate AI trustworthiness requirements into access control policies. Ensure AI model APIs enforce appropriate access controls (AC-3) and data flowing to/from AI systems is governed (AC-4 via DLP solution).',
 ARRAY['AC policies', 'DLP solution config', 'API gateway logs']),

('GOVERN 1.2', 'ac-3', 'Partial',
 'Access control policies (AC-1), enforcement mechanisms (AC-3), and information flow controls (AC-4) support trustworthy AI characteristics of security and privacy. Does not address explainability, fairness, or other non-security trustworthiness characteristics.',
 'Integrate AI trustworthiness requirements into access control policies. Ensure AI model APIs enforce appropriate access controls (AC-3) and data flowing to/from AI systems is governed (AC-4 via DLP solution).',
 ARRAY['AC policies', 'DLP solution config', 'API gateway logs']),

('GOVERN 1.2', 'ac-4', 'Partial',
 'Access control policies (AC-1), enforcement mechanisms (AC-3), and information flow controls (AC-4) support trustworthy AI characteristics of security and privacy. Does not address explainability, fairness, or other non-security trustworthiness characteristics.',
 'Integrate AI trustworthiness requirements into access control policies. Ensure AI model APIs enforce appropriate access controls (AC-3) and data flowing to/from AI systems is governed (AC-4 via DLP solution).',
 ARRAY['AC policies', 'DLP solution config', 'API gateway logs']),

('GOVERN 1.3', 'ac-1', 'Supportive',
 'AC-1 and AC-2 provide risk-based access control processes but are not specifically designed to determine AI risk management activity levels. Supportive to AI risk tolerance decisions through access tier definitions.',
 'Define risk-based access tiers for AI systems: clinical AI models require higher access control rigor than internal analytics tools. IdP group policies should reflect AI system risk classification.',
 ARRAY['Risk assessment docs', 'IdP group policies']),

('GOVERN 1.3', 'ac-2', 'Supportive',
 'AC-1 and AC-2 provide risk-based access control processes but are not specifically designed to determine AI risk management activity levels. Supportive to AI risk tolerance decisions through access tier definitions.',
 'Define risk-based access tiers for AI systems: clinical AI models require higher access control rigor than internal analytics tools. IdP group policies should reflect AI system risk classification.',
 ARRAY['Risk assessment docs', 'IdP group policies']),

('GOVERN 1.4', 'ac-1', 'Partial',
 'AC-1 provides transparent policy framework; AC-2 documents account management outcomes; AC-6 enforces least privilege as a risk management outcome. Partial because these cover access risk, not full AI risk management transparency.',
 'Document AI system access decisions and privilege assignments transparently. workflow automation tool workflows should log all AI system access provisioning decisions for audit trail.',
 ARRAY['workflow automation tool workflow logs', 'IdP audit logs', 'GRC platform']),

('GOVERN 1.4', 'ac-2', 'Partial',
 'AC-1 provides transparent policy framework; AC-2 documents account management outcomes; AC-6 enforces least privilege as a risk management outcome. Partial because these cover access risk, not full AI risk management transparency.',
 'Document AI system access decisions and privilege assignments transparently. workflow automation tool workflows should log all AI system access provisioning decisions for audit trail.',
 ARRAY['workflow automation tool workflow logs', 'IdP audit logs', 'GRC platform']),

('GOVERN 1.4', 'ac-6', 'Partial',
 'AC-1 provides transparent policy framework; AC-2 documents account management outcomes; AC-6 enforces least privilege as a risk management outcome. Partial because these cover access risk, not full AI risk management transparency.',
 'Document AI system access decisions and privilege assignments transparently. workflow automation tool workflows should log all AI system access provisioning decisions for audit trail.',
 ARRAY['workflow automation tool workflow logs', 'IdP audit logs', 'GRC platform']),

('GOVERN 1.5', 'ac-2', 'Partial',
 'AC-2 requires periodic review of accounts and defines roles for account managers. Supports ongoing monitoring of access-related AI risks but does not cover broader AI risk process review.',
 'Establish quarterly access reviews for AI systems using existing workflow automation tool/IdP access review automation. Assign AI system owners as account managers per AC-2.',
 ARRAY['IdP access reviews', 'workflow automation tool automation']),

('GOVERN 1.6', 'ac-20', 'Supportive',
 'AC-20 addresses use of external systems (including third-party AI) and AC-21 covers information sharing. Supportive to inventory requirements by governing external AI system connections but not a direct inventory mechanism.',
 'Extend external system inventory to specifically track AI/ML systems, including third-party AI APIs (e.g., foundation model APIsOpenAI). vendor risk management platform vendor assessments should include AI capability inventory.',
 ARRAY['Asset inventory', 'vendor risk management platform', 'vendor register']),

('GOVERN 1.6', 'ac-21', 'Supportive',
 'AC-20 addresses use of external systems (including third-party AI) and AC-21 covers information sharing. Supportive to inventory requirements by governing external AI system connections but not a direct inventory mechanism.',
 'Extend external system inventory to specifically track AI/ML systems, including third-party AI APIs (e.g., foundation model APIsOpenAI). vendor risk management platform vendor assessments should include AI capability inventory.',
 ARRAY['Asset inventory', 'vendor risk management platform', 'vendor register']),

('GOVERN 1.7', 'ac-2', 'Supportive',
 'AC-2 account lifecycle management (disable, remove accounts) supports AI system decommissioning by ensuring access is revoked. Does not address AI-specific decommissioning like model artifact cleanup or data lineage.',
 'Build AI system decommissioning checklist extending AC-2 account termination: revoke API keys, disable model endpoints, archive training data, document rationale in GRC platform.',
 ARRAY['Account termination procedures', 'workflow automation tool workflows']),

('GOVERN 2.1', 'ac-2', 'Supportive',
 'AC-2 defines account manager roles; AC-5 establishes separation of duties. These support clear role definition for AI risk management but are scoped to access control, not the full breadth of AI risk roles.',
 'Define RACI for AI risk management overlaying access control roles. Security team owns AI system access governance; Platform Engineering owns AI model deployment access; Legal owns AI regulatory compliance.',
 ARRAY['Organizational charts', 'role definitions', 'RACI']),

('GOVERN 2.1', 'ac-5', 'Supportive',
 'AC-2 defines account manager roles; AC-5 establishes separation of duties. These support clear role definition for AI risk management but are scoped to access control, not the full breadth of AI risk roles.',
 'Define RACI for AI risk management overlaying access control roles. Security team owns AI system access governance; Platform Engineering owns AI model deployment access; Legal owns AI regulatory compliance.',
 ARRAY['Organizational charts', 'role definitions', 'RACI']),

('GOVERN 2.2', 'ac-1', 'Supportive',
 'AC-1 requires personnel to understand access control policies, which can include AI-specific access procedures. Training scope is limited to access control awareness, not comprehensive AI risk training.',
 'Incorporate AI-specific access control training into security awareness training platform program. Include modules on: handling AI system credentials, recognizing AI phishing vectors, responsible use of AI tools per organization.',
 ARRAY['security awareness training platform training records', 'policy acknowledgments']),

('GOVERN 2.3', 'ac-1', 'Supportive',
 'AC-1 requires organizational leadership to authorize access control policy; AC-6 enforces that privileged access decisions are made by authorized personnel. Supports executive accountability for access risk decisions.',
 'CISO should formally approve AI system access policies. Privileged access to AI systems (model training, production deployment) requires VP-level authorization per AC-6.',
 ARRAY['Policy approval records', 'PAM logs']),

('GOVERN 2.3', 'ac-6', 'Supportive',
 'AC-1 requires organizational leadership to authorize access control policy; AC-6 enforces that privileged access decisions are made by authorized personnel. Supports executive accountability for access risk decisions.',
 'CISO should formally approve AI system access policies. Privileged access to AI systems (model training, production deployment) requires VP-level authorization per AC-6.',
 ARRAY['Policy approval records', 'PAM logs']),

('GOVERN 3.2', 'ac-3', 'Partial',
 'AC-3 enforces access based on defined roles; AC-5 separates duties between AI operators and oversight; AC-6 ensures least privilege for AI system interactions. Addresses technical role enforcement but not the full policy framework for human-AI configurations.',
 'Implement RBAC in IdP for AI systems: separate roles for model developers, model reviewers, deployers, and monitors. Enforce separation between those training models and those approving deployment.',
 ARRAY['IdP role definitions', 'RBAC policies']),

('GOVERN 3.2', 'ac-5', 'Partial',
 'AC-3 enforces access based on defined roles; AC-5 separates duties between AI operators and oversight; AC-6 ensures least privilege for AI system interactions. Addresses technical role enforcement but not the full policy framework for human-AI configurations.',
 'Implement RBAC in IdP for AI systems: separate roles for model developers, model reviewers, deployers, and monitors. Enforce separation between those training models and those approving deployment.',
 ARRAY['IdP role definitions', 'RBAC policies']),

('GOVERN 3.2', 'ac-6', 'Partial',
 'AC-3 enforces access based on defined roles; AC-5 separates duties between AI operators and oversight; AC-6 ensures least privilege for AI system interactions. Addresses technical role enforcement but not the full policy framework for human-AI configurations.',
 'Implement RBAC in IdP for AI systems: separate roles for model developers, model reviewers, deployers, and monitors. Enforce separation between those training models and those approving deployment.',
 ARRAY['IdP role definitions', 'RBAC policies']),

('GOVERN 4.1', 'ac-1', 'Supportive',
 'AC-1 establishes the policy foundation; AC-8 provides system use notifications that can remind users of AI system policies and safety expectations. Focused on access awareness rather than comprehensive safety culture.',
 'Configure system use notifications (AC-8) on AI system interfaces to display responsible use guidelines, data handling requirements, and escalation procedures for AI anomalies.',
 ARRAY['System banners', 'policy acknowledgments']),

('GOVERN 4.1', 'ac-8', 'Supportive',
 'AC-1 establishes the policy foundation; AC-8 provides system use notifications that can remind users of AI system policies and safety expectations. Focused on access awareness rather than comprehensive safety culture.',
 'Configure system use notifications (AC-8) on AI system interfaces to display responsible use guidelines, data handling requirements, and escalation procedures for AI anomalies.',
 ARRAY['System banners', 'policy acknowledgments']),

('GOVERN 4.3', 'ac-4', 'Supportive',
 'AC-4 governs information flows supporting AI testing data pipelines; AC-21 enables controlled information sharing for AI incident identification. Supportive to creating the access framework for AI testing and incident sharing.',
 'Ensure AI test environments have controlled data flows (AC-4) through DLP solution. Establish information sharing agreements for AI incident data with SIEM SIEM integration.',
 ARRAY['DLP solution rules', 'SIEM config', 'sharing agreements']),

('GOVERN 4.3', 'ac-21', 'Supportive',
 'AC-4 governs information flows supporting AI testing data pipelines; AC-21 enables controlled information sharing for AI incident identification. Supportive to creating the access framework for AI testing and incident sharing.',
 'Ensure AI test environments have controlled data flows (AC-4) through DLP solution. Establish information sharing agreements for AI incident data with SIEM SIEM integration.',
 ARRAY['DLP solution rules', 'SIEM config', 'sharing agreements']),

('GOVERN 5.1', 'ac-20', 'Supportive',
 'AC-20 governs external system interactions; AC-21 enables information sharing with external stakeholders; AC-22 manages publicly accessible AI-related content. Supportive to creating secure channels for external feedback.',
 'Configure secure feedback channels for AI system users (patients, providers) with appropriate access controls. Ensure external feedback portals meet AC-22 content management requirements.',
 ARRAY['Feedback portal configs', 'external access logs']),

('GOVERN 5.1', 'ac-21', 'Supportive',
 'AC-20 governs external system interactions; AC-21 enables information sharing with external stakeholders; AC-22 manages publicly accessible AI-related content. Supportive to creating secure channels for external feedback.',
 'Configure secure feedback channels for AI system users (patients, providers) with appropriate access controls. Ensure external feedback portals meet AC-22 content management requirements.',
 ARRAY['Feedback portal configs', 'external access logs']),

('GOVERN 5.1', 'ac-22', 'Supportive',
 'AC-20 governs external system interactions; AC-21 enables information sharing with external stakeholders; AC-22 manages publicly accessible AI-related content. Supportive to creating secure channels for external feedback.',
 'Configure secure feedback channels for AI system users (patients, providers) with appropriate access controls. Ensure external feedback portals meet AC-22 content management requirements.',
 ARRAY['Feedback portal configs', 'external access logs']),

('GOVERN 6.1', 'ac-20', 'Partial',
 'AC-20 directly addresses establishing terms and conditions for third-party/external system use. AC-21 governs information sharing with third parties. Provides the access control framework for third-party AI risk management.',
 'Extend AC-20 controls to all third-party AI services (foundation model APIs). vendor risk management platform assessments should evaluate third-party AI vendors'' data usage, model training practices, and IP handling.',
 ARRAY['vendor risk management platform assessments', 'vendor agreements', 'AC-20 docs']),

('GOVERN 6.1', 'ac-21', 'Partial',
 'AC-20 directly addresses establishing terms and conditions for third-party/external system use. AC-21 governs information sharing with third parties. Provides the access control framework for third-party AI risk management.',
 'Extend AC-20 controls to all third-party AI services (foundation model APIs). vendor risk management platform assessments should evaluate third-party AI vendors'' data usage, model training practices, and IP handling.',
 ARRAY['vendor risk management platform assessments', 'vendor agreements', 'AC-20 docs']),

('GOVERN 6.2', 'ac-4', 'Supportive',
 'AC-4 can enforce fallback information flow controls when third-party AI fails; AC-20 governs external system terms including failure handling. Contingency planning extends beyond access control scope.',
 'Build workflow automation tool workflow for third-party AI system failure response: auto-disable API integrations, redirect traffic to fallback systems, notify stakeholders. Include in BC/DR planning.',
 ARRAY['BC/DR plans', 'workflow automation tool incident workflows']),

('GOVERN 6.2', 'ac-20', 'Supportive',
 'AC-4 can enforce fallback information flow controls when third-party AI fails; AC-20 governs external system terms including failure handling. Contingency planning extends beyond access control scope.',
 'Build workflow automation tool workflow for third-party AI system failure response: auto-disable API integrations, redirect traffic to fallback systems, notify stakeholders. Include in BC/DR planning.',
 ARRAY['BC/DR plans', 'workflow automation tool incident workflows']),

('MAP 1.6', 'ac-3', 'Partial',
 'AC-3 enforces access aligned with requirements; AC-4 enforces information flow per privacy requirements; AC-6 ensures least privilege aligns with design intent; AC-14 documents what actions are permitted without authentication.',
 'For each AI system, document access requirements mapping to socio-technical design decisions: who can query models, what data flows are permitted, what actions require no auth (e.g., public health risk calculators).',
 ARRAY['System design docs', 'access requirement matrices']),

('MAP 1.6', 'ac-4', 'Partial',
 'AC-3 enforces access aligned with requirements; AC-4 enforces information flow per privacy requirements; AC-6 ensures least privilege aligns with design intent; AC-14 documents what actions are permitted without authentication.',
 'For each AI system, document access requirements mapping to socio-technical design decisions: who can query models, what data flows are permitted, what actions require no auth (e.g., public health risk calculators).',
 ARRAY['System design docs', 'access requirement matrices']),

('MAP 1.6', 'ac-6', 'Partial',
 'AC-3 enforces access aligned with requirements; AC-4 enforces information flow per privacy requirements; AC-6 ensures least privilege aligns with design intent; AC-14 documents what actions are permitted without authentication.',
 'For each AI system, document access requirements mapping to socio-technical design decisions: who can query models, what data flows are permitted, what actions require no auth (e.g., public health risk calculators).',
 ARRAY['System design docs', 'access requirement matrices']),

('MAP 1.6', 'ac-14', 'Partial',
 'AC-3 enforces access aligned with requirements; AC-4 enforces information flow per privacy requirements; AC-6 ensures least privilege aligns with design intent; AC-14 documents what actions are permitted without authentication.',
 'For each AI system, document access requirements mapping to socio-technical design decisions: who can query models, what data flows are permitted, what actions require no auth (e.g., public health risk calculators).',
 ARRAY['System design docs', 'access requirement matrices']),

('MAP 4.1', 'ac-20', 'Supportive',
 'AC-20 addresses risk of external/third-party systems; AC-4 governs data flows that could introduce legal risk. Supportive to mapping technology risks through access and data flow governance.',
 'Map all third-party AI components through vendor risk management platform with specific AI risk questionnaire. Document data flows to/from third-party AI via AC-4 controls enforced by DLP solution.',
 ARRAY['vendor risk management platform', 'data flow diagrams', 'DLP solution']),

('MAP 4.1', 'ac-4', 'Supportive',
 'AC-20 addresses risk of external/third-party systems; AC-4 governs data flows that could introduce legal risk. Supportive to mapping technology risks through access and data flow governance.',
 'Map all third-party AI components through vendor risk management platform with specific AI risk questionnaire. Document data flows to/from third-party AI via AC-4 controls enforced by DLP solution.',
 ARRAY['vendor risk management platform', 'data flow diagrams', 'DLP solution']),

('MAP 4.2', 'ac-2', 'Partial',
 'Multiple AC controls collectively form the internal risk control framework for AI system components: account lifecycle, enforcement, data flow governance, duty separation, privilege management, remote access, and external system governance.',
 'Document the AC control set applied to each AI system component. Create a control-to-AI-component matrix showing which AC controls protect which parts of the AI pipeline (data ingestion, training, inference, monitoring).',
 ARRAY['Control matrix', 'system architecture docs']),

('MAP 4.2', 'ac-3', 'Partial',
 'Multiple AC controls collectively form the internal risk control framework for AI system components: account lifecycle, enforcement, data flow governance, duty separation, privilege management, remote access, and external system governance.',
 'Document the AC control set applied to each AI system component. Create a control-to-AI-component matrix showing which AC controls protect which parts of the AI pipeline (data ingestion, training, inference, monitoring).',
 ARRAY['Control matrix', 'system architecture docs']),

('MAP 4.2', 'ac-4', 'Partial',
 'Multiple AC controls collectively form the internal risk control framework for AI system components: account lifecycle, enforcement, data flow governance, duty separation, privilege management, remote access, and external system governance.',
 'Document the AC control set applied to each AI system component. Create a control-to-AI-component matrix showing which AC controls protect which parts of the AI pipeline (data ingestion, training, inference, monitoring).',
 ARRAY['Control matrix', 'system architecture docs']),

('MAP 4.2', 'ac-5', 'Partial',
 'Multiple AC controls collectively form the internal risk control framework for AI system components: account lifecycle, enforcement, data flow governance, duty separation, privilege management, remote access, and external system governance.',
 'Document the AC control set applied to each AI system component. Create a control-to-AI-component matrix showing which AC controls protect which parts of the AI pipeline (data ingestion, training, inference, monitoring).',
 ARRAY['Control matrix', 'system architecture docs']),

('MAP 4.2', 'ac-6', 'Partial',
 'Multiple AC controls collectively form the internal risk control framework for AI system components: account lifecycle, enforcement, data flow governance, duty separation, privilege management, remote access, and external system governance.',
 'Document the AC control set applied to each AI system component. Create a control-to-AI-component matrix showing which AC controls protect which parts of the AI pipeline (data ingestion, training, inference, monitoring).',
 ARRAY['Control matrix', 'system architecture docs']),

('MAP 4.2', 'ac-17', 'Partial',
 'Multiple AC controls collectively form the internal risk control framework for AI system components: account lifecycle, enforcement, data flow governance, duty separation, privilege management, remote access, and external system governance.',
 'Document the AC control set applied to each AI system component. Create a control-to-AI-component matrix showing which AC controls protect which parts of the AI pipeline (data ingestion, training, inference, monitoring).',
 ARRAY['Control matrix', 'system architecture docs']),

('MAP 4.2', 'ac-20', 'Partial',
 'Multiple AC controls collectively form the internal risk control framework for AI system components: account lifecycle, enforcement, data flow governance, duty separation, privilege management, remote access, and external system governance.',
 'Document the AC control set applied to each AI system component. Create a control-to-AI-component matrix showing which AC controls protect which parts of the AI pipeline (data ingestion, training, inference, monitoring).',
 ARRAY['Control matrix', 'system architecture docs']),

('MANAGE 2.2', 'ac-2', 'Partial',
 'Operational AC controls collectively sustain AI system value by maintaining secure access: account lifecycle, enforcement, least privilege, logon protection, device/session controls, and access channel security.',
 'Ensure all AI system interfaces are covered by the full AC control stack. API endpoints need AC-7 (rate limiting/lockout), AI dashboards need AC-11/AC-12 (session controls), remote model access needs AC-17 encryption.',
 ARRAY['Security config reviews', 'penetration test results']),

('MANAGE 2.2', 'ac-3', 'Partial',
 'Operational AC controls collectively sustain AI system value by maintaining secure access: account lifecycle, enforcement, least privilege, logon protection, device/session controls, and access channel security.',
 'Ensure all AI system interfaces are covered by the full AC control stack. API endpoints need AC-7 (rate limiting/lockout), AI dashboards need AC-11/AC-12 (session controls), remote model access needs AC-17 encryption.',
 ARRAY['Security config reviews', 'penetration test results']),

('MANAGE 2.2', 'ac-6', 'Partial',
 'Operational AC controls collectively sustain AI system value by maintaining secure access: account lifecycle, enforcement, least privilege, logon protection, device/session controls, and access channel security.',
 'Ensure all AI system interfaces are covered by the full AC control stack. API endpoints need AC-7 (rate limiting/lockout), AI dashboards need AC-11/AC-12 (session controls), remote model access needs AC-17 encryption.',
 ARRAY['Security config reviews', 'penetration test results']),

('MANAGE 2.2', 'ac-7', 'Partial',
 'Operational AC controls collectively sustain AI system value by maintaining secure access: account lifecycle, enforcement, least privilege, logon protection, device/session controls, and access channel security.',
 'Ensure all AI system interfaces are covered by the full AC control stack. API endpoints need AC-7 (rate limiting/lockout), AI dashboards need AC-11/AC-12 (session controls), remote model access needs AC-17 encryption.',
 ARRAY['Security config reviews', 'penetration test results']),

('MANAGE 2.2', 'ac-11', 'Partial',
 'Operational AC controls collectively sustain AI system value by maintaining secure access: account lifecycle, enforcement, least privilege, logon protection, device/session controls, and access channel security.',
 'Ensure all AI system interfaces are covered by the full AC control stack. API endpoints need AC-7 (rate limiting/lockout), AI dashboards need AC-11/AC-12 (session controls), remote model access needs AC-17 encryption.',
 ARRAY['Security config reviews', 'penetration test results']),

('MANAGE 2.2', 'ac-12', 'Partial',
 'Operational AC controls collectively sustain AI system value by maintaining secure access: account lifecycle, enforcement, least privilege, logon protection, device/session controls, and access channel security.',
 'Ensure all AI system interfaces are covered by the full AC control stack. API endpoints need AC-7 (rate limiting/lockout), AI dashboards need AC-11/AC-12 (session controls), remote model access needs AC-17 encryption.',
 ARRAY['Security config reviews', 'penetration test results']),

('MANAGE 2.2', 'ac-17', 'Partial',
 'Operational AC controls collectively sustain AI system value by maintaining secure access: account lifecycle, enforcement, least privilege, logon protection, device/session controls, and access channel security.',
 'Ensure all AI system interfaces are covered by the full AC control stack. API endpoints need AC-7 (rate limiting/lockout), AI dashboards need AC-11/AC-12 (session controls), remote model access needs AC-17 encryption.',
 ARRAY['Security config reviews', 'penetration test results']),

('MANAGE 2.2', 'ac-18', 'Partial',
 'Operational AC controls collectively sustain AI system value by maintaining secure access: account lifecycle, enforcement, least privilege, logon protection, device/session controls, and access channel security.',
 'Ensure all AI system interfaces are covered by the full AC control stack. API endpoints need AC-7 (rate limiting/lockout), AI dashboards need AC-11/AC-12 (session controls), remote model access needs AC-17 encryption.',
 ARRAY['Security config reviews', 'penetration test results']),

('MANAGE 2.2', 'ac-19', 'Partial',
 'Operational AC controls collectively sustain AI system value by maintaining secure access: account lifecycle, enforcement, least privilege, logon protection, device/session controls, and access channel security.',
 'Ensure all AI system interfaces are covered by the full AC control stack. API endpoints need AC-7 (rate limiting/lockout), AI dashboards need AC-11/AC-12 (session controls), remote model access needs AC-17 encryption.',
 ARRAY['Security config reviews', 'penetration test results']),

('MANAGE 2.4', 'ac-2', 'Supportive',
 'AC-2 supports rapid account deactivation; AC-3 can revoke access enforcement; AC-4 can block information flows. These provide technical mechanisms to disengage AI systems.',
 'Build ''AI Kill Switch'' workflow automation tool workflow leveraging AC controls: disable service accounts (AC-2), revoke API access (AC-3), block data flows (AC-4). Assign clear ownership for triggering AI system disengagement.',
 ARRAY['Incident response playbook', 'workflow automation tool workflows']),

('MANAGE 2.4', 'ac-3', 'Supportive',
 'AC-2 supports rapid account deactivation; AC-3 can revoke access enforcement; AC-4 can block information flows. These provide technical mechanisms to disengage AI systems.',
 'Build ''AI Kill Switch'' workflow automation tool workflow leveraging AC controls: disable service accounts (AC-2), revoke API access (AC-3), block data flows (AC-4). Assign clear ownership for triggering AI system disengagement.',
 ARRAY['Incident response playbook', 'workflow automation tool workflows']),

('MANAGE 2.4', 'ac-4', 'Supportive',
 'AC-2 supports rapid account deactivation; AC-3 can revoke access enforcement; AC-4 can block information flows. These provide technical mechanisms to disengage AI systems.',
 'Build ''AI Kill Switch'' workflow automation tool workflow leveraging AC controls: disable service accounts (AC-2), revoke API access (AC-3), block data flows (AC-4). Assign clear ownership for triggering AI system disengagement.',
 ARRAY['Incident response playbook', 'workflow automation tool workflows']),

('MANAGE 3.1', 'ac-20', 'Partial',
 'AC-20 directly governs third-party system use with required terms; AC-21 governs information sharing. Provides the access control layer for third-party AI risk monitoring.',
 'Quarterly review of third-party AI system access through vendor risk management platform continuous monitoring. Ensure AC-20 terms and conditions are updated when third-party AI capabilities change.',
 ARRAY['vendor risk management platform continuous monitoring', 'quarterly reviews']),

('MANAGE 3.1', 'ac-21', 'Partial',
 'AC-20 directly governs third-party system use with required terms; AC-21 governs information sharing. Provides the access control layer for third-party AI risk monitoring.',
 'Quarterly review of third-party AI system access through vendor risk management platform continuous monitoring. Ensure AC-20 terms and conditions are updated when third-party AI capabilities change.',
 ARRAY['vendor risk management platform continuous monitoring', 'quarterly reviews']),

('MANAGE 3.2', 'ac-4', 'Supportive',
 'AC-4 governs data flows to/from pre-trained model endpoints; AC-20 governs the external system relationship with model providers. Monitoring pre-trained models requires capabilities beyond access control.',
 'Track all pre-trained model dependencies (foundation model APIs, etc.). Monitor data flows to model APIs via AC-4 controls. Flag when model versions change via SIEM API monitoring.',
 ARRAY['SIEM monitors', 'API gateway logs']),

('MANAGE 3.2', 'ac-20', 'Supportive',
 'AC-4 governs data flows to/from pre-trained model endpoints; AC-20 governs the external system relationship with model providers. Monitoring pre-trained models requires capabilities beyond access control.',
 'Track all pre-trained model dependencies (foundation model APIs, etc.). Monitor data flows to model APIs via AC-4 controls. Flag when model versions change via SIEM API monitoring.',
 ARRAY['SIEM monitors', 'API gateway logs']),

('MANAGE 4.1', 'ac-2', 'Supportive',
 'AC controls support post-deployment monitoring through access logging, enforcement monitoring, flow monitoring, anomaly detection via failed logons, and remote access monitoring.',
 'Integrate AI system access telemetry into SIEM security monitoring. Build workflow automation tool story to correlate AC-7 alerts on AI system interfaces with AI performance anomalies. Include in existing IR playbooks.',
 ARRAY['SIEM dashboards', 'workflow automation tool stories', 'IR playbooks']),

('MANAGE 4.1', 'ac-3', 'Supportive',
 'AC controls support post-deployment monitoring through access logging, enforcement monitoring, flow monitoring, anomaly detection via failed logons, and remote access monitoring.',
 'Integrate AI system access telemetry into SIEM security monitoring. Build workflow automation tool story to correlate AC-7 alerts on AI system interfaces with AI performance anomalies. Include in existing IR playbooks.',
 ARRAY['SIEM dashboards', 'workflow automation tool stories', 'IR playbooks']),

('MANAGE 4.1', 'ac-4', 'Supportive',
 'AC controls support post-deployment monitoring through access logging, enforcement monitoring, flow monitoring, anomaly detection via failed logons, and remote access monitoring.',
 'Integrate AI system access telemetry into SIEM security monitoring. Build workflow automation tool story to correlate AC-7 alerts on AI system interfaces with AI performance anomalies. Include in existing IR playbooks.',
 ARRAY['SIEM dashboards', 'workflow automation tool stories', 'IR playbooks']),

('MANAGE 4.1', 'ac-7', 'Supportive',
 'AC controls support post-deployment monitoring through access logging, enforcement monitoring, flow monitoring, anomaly detection via failed logons, and remote access monitoring.',
 'Integrate AI system access telemetry into SIEM security monitoring. Build workflow automation tool story to correlate AC-7 alerts on AI system interfaces with AI performance anomalies. Include in existing IR playbooks.',
 ARRAY['SIEM dashboards', 'workflow automation tool stories', 'IR playbooks']),

('MANAGE 4.1', 'ac-17', 'Supportive',
 'AC controls support post-deployment monitoring through access logging, enforcement monitoring, flow monitoring, anomaly detection via failed logons, and remote access monitoring.',
 'Integrate AI system access telemetry into SIEM security monitoring. Build workflow automation tool story to correlate AC-7 alerts on AI system interfaces with AI performance anomalies. Include in existing IR playbooks.',
 ARRAY['SIEM dashboards', 'workflow automation tool stories', 'IR playbooks']);

-- Total rows inserted: 66
