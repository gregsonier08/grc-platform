-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — IR Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 IR controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- IR-1: Policy and Procedures
('GOVERN 1.1', 'ir-1', 'Partial',
 'IR-1 establishes the incident response policy framework that can incorporate AI-specific incident categories including model failures, bias events, and adversarial attacks. Addresses the policy layer for incident handling but not the full scope of AI risk management policies.',
 'Extend IR-1 policy to explicitly define AI-specific incident categories such as model degradation, adversarial exploitation, training data poisoning, and discriminatory output patterns. Include AI incident severity classification criteria and escalation requirements.',
 ARRAY['Policy documents', 'AI incident taxonomy', 'Policy review records']),

('GOVERN 1.3', 'ir-1', 'Partial',
 'IR-1 procedures define organizational incident handling processes that support AI risk tolerance through defined response thresholds and escalation criteria. Addresses incident response discipline but not the full scope of AI risk tolerance determination.',
 'Define procedures for AI model failure, bias detection, and adversarial attack incidents including detection criteria, containment procedures, and recovery steps. Establish AI-specific incident response thresholds aligned with organizational risk tolerance.',
 ARRAY['Policy documents', 'IR procedure documentation', 'AI incident response thresholds']),

('GOVERN 4.3', 'ir-1', 'Partial',
 'IR-1 policy supports organizational practices for AI incident sharing by establishing requirements for incident documentation and communication. Addresses incident policy but not the broader testing and information sharing practices.',
 'Include AI incident information sharing requirements in IR policy covering internal notification, external reporting obligations, and community disclosure timelines. Define what AI incident details may be shared and with whom.',
 ARRAY['Policy documents', 'Information sharing guidelines', 'Disclosure procedures']),

-- IR-2: Incident Response Training
('GOVERN 2.2', 'ir-2', 'Partial',
 'IR-2 incident response training supports AI risk management competency by ensuring personnel can recognize and respond to AI-specific incidents. Addresses incident response skills but not the broader AI risk management training curriculum.',
 'Include AI-specific incident scenarios in incident response training such as model drift detection, bias event escalation, adversarial attack recognition, and AI data breach containment. Train both technical and non-technical staff on AI incident indicators.',
 ARRAY['Training records', 'Training curricula', 'AI scenario documentation']),

('GOVERN 3.2', 'ir-2', 'Partial',
 'IR-2 training supports differentiation of human-AI roles during incidents by preparing personnel to understand their responsibilities when AI systems fail or produce harmful outputs. Addresses incident role training but not the broader human-AI configuration policy.',
 'Define and train on distinct roles for AI incident response: AI engineers for technical containment, domain experts for impact assessment, communications staff for stakeholder notification, and legal for regulatory reporting. Conduct tabletop exercises with AI failure scenarios.',
 ARRAY['Training records', 'Role definition documents', 'Tabletop exercise reports']),

-- IR-3: Incident Response Testing
('MEASURE 1.1', 'ir-3', 'Partial',
 'IR-3 incident response testing validates AI incident detection and response capabilities, supporting selection of measurement approaches for AI risks. Addresses testing of response mechanisms but not the broader selection of AI risk metrics.',
 'Include AI failure scenarios in incident response exercises such as model poisoning, adversarial input attacks, bias amplification events, and training data exposure. Measure detection time, response time, and containment effectiveness for AI-specific scenarios.',
 ARRAY['IR test reports', 'Exercise results', 'AI scenario test documentation']),

('MEASURE 1.3', 'ir-3', 'Partial',
 'IR-3 testing supports AI measurement validation by verifying that monitoring and alerting pathways for AI incidents function correctly. Addresses monitoring validation but not the broader involvement of independent assessors.',
 'Test AI monitoring alert pathways during incident response exercises to verify end-to-end detection and notification. Validate that AI-specific SIEM rules, model monitoring alerts, and escalation workflows trigger correctly under simulated conditions.',
 ARRAY['Alert pathway test results', 'Monitoring validation reports', 'Exercise findings']),

('MEASURE 2.13', 'ir-3', 'Partial',
 'IR-3 testing supports evaluation of TEVV effectiveness by identifying gaps in AI incident detection that may indicate measurement deficiencies. Addresses detection gap identification but not comprehensive TEVV process evaluation.',
 'Use incident response test findings to identify gaps in AI TEVV processes. Correlate undetected simulated incidents with measurement coverage to improve AI monitoring and evaluation approaches.',
 ARRAY['Gap analysis reports', 'TEVV improvement recommendations', 'Test-measurement correlation analysis']),

-- IR-4: Incident Handling
('MANAGE 1.1', 'ir-4', 'Strong',
 'IR-4 incident handling directly supports determination of whether AI systems should continue operating by providing the structured process for detecting, analyzing, containing, and recovering from AI incidents. Core control for AI risk response execution.',
 'Handle AI model failures, bias incidents, adversarial attacks, and data breaches through the formal incident handling process. Include AI-specific containment actions such as model rollback, traffic diversion to fallback systems, and input filtering activation.',
 ARRAY['Incident records', 'Containment action logs', 'Recovery documentation']),

('MANAGE 1.2', 'ir-4', 'Strong',
 'IR-4 incident handling directly supports AI risk prioritization by requiring triage and severity assessment for each incident. Ensures AI incidents are evaluated for impact and urgency alongside other security events.',
 'Triage AI incidents based on impact to individuals, operational disruption, regulatory exposure, and reputational risk. Prioritize incidents involving discriminatory AI outputs or safety-critical model failures above routine performance degradation events.',
 ARRAY['Incident triage records', 'Severity assessment documentation', 'Prioritization criteria']),

('MANAGE 1.3', 'ir-4', 'Strong',
 'IR-4 incident handling supports documented AI risk response development by requiring recording of all containment, eradication, and recovery actions taken during incidents. Ensures AI risk responses are traceable and reviewable.',
 'Document AI incident containment, eradication, and recovery actions with timestamps, responsible parties, and outcomes. Maintain post-incident records that connect response actions to the specific AI risks they addressed.',
 ARRAY['Incident action logs', 'Response documentation', 'Post-incident records']),

('MANAGE 1.4', 'ir-4', 'Strong',
 'IR-4 incident handling supports documentation of AI residual risks by requiring post-incident assessment of remaining vulnerabilities and exposure. Ensures residual AI risks are identified after incident response actions.',
 'Assess remaining AI risks after incident response including whether the root cause was fully addressed, whether similar incidents could recur, and whether compensating controls are adequate. Document residual risks for tracking.',
 ARRAY['Residual risk assessments', 'Post-incident analysis reports', 'Risk tracking records']),

('MANAGE 4.1', 'ir-4', 'Strong',
 'IR-4 incident handling is the primary mechanism for executing AI post-deployment incident response plans. Directly implements the capture, evaluation, and response activities defined in monitoring plans.',
 'Implement AI-specific incident handling procedures and playbooks covering model drift incidents, adversarial attack containment, bias event investigation, and training data breach response. Integrate AI monitoring alerts with incident management workflows.',
 ARRAY['AI incident playbooks', 'Incident management workflow configs', 'Response procedure documentation']),

('MANAGE 2.3', 'ir-4', 'Strong',
 'IR-4 incident handling directly supports procedures for responding to and recovering from previously unknown AI risks. Provides the operational framework for handling novel AI incidents not anticipated during design.',
 'Establish flexible incident handling procedures for novel AI risks not covered by existing playbooks. Define investigation workflows for unexpected AI behaviors including output analysis, root cause investigation, and impact assessment for previously unseen failure modes.',
 ARRAY['Investigation procedures', 'Novel incident records', 'Flexible response frameworks']),

-- IR-5: Incident Monitoring
('MANAGE 4.1', 'ir-5', 'Strong',
 'IR-5 incident monitoring directly supports post-deployment AI monitoring by providing continuous tracking of incidents, anomalies, and security events related to AI systems. Core monitoring function for AI operational oversight.',
 'Monitor for AI-specific incident indicators including model accuracy drift, output distribution shifts, unusual inference patterns, and adversarial probing attempts. Correlate AI monitoring data with traditional security event monitoring for comprehensive threat detection.',
 ARRAY['Incident monitoring dashboards', 'AI anomaly detection logs', 'Correlation analysis reports']),

('MANAGE 4.2', 'ir-5', 'Strong',
 'IR-5 incident monitoring supports continual AI improvement by providing trend data on incidents, near-misses, and recurring issues. Enables data-driven improvement of AI systems and their protective controls.',
 'Track and report AI incident trends to stakeholders including frequency, severity, root causes, and resolution effectiveness. Use incident trend analysis to prioritize AI system improvements and update risk assessments.',
 ARRAY['Incident trend reports', 'Stakeholder briefings', 'Improvement tracking records']),

('MEASURE 3.1', 'ir-5', 'Partial',
 'IR-5 incident monitoring contributes to AI risk tracking by providing ongoing visibility into realized AI risks and emerging threat patterns. Addresses incident-level risk observation but not the broader risk tracking methodology.',
 'Use incident monitoring data to inform AI risk measurement baselines and identify emergent risk categories. Feed incident patterns back into AI risk assessment processes to improve prospective risk identification.',
 ARRAY['Risk tracking dashboards', 'Incident-to-risk correlation records', 'Baseline adjustment documentation']),

('MEASURE 3.2', 'ir-5', 'Partial',
 'IR-5 monitoring supports risk tracking in settings where AI risks are difficult to measure by providing empirical incident data as an alternative to predictive metrics. Addresses observational risk tracking but not measurement technique development.',
 'Track AI incidents as empirical risk indicators where formal measurement techniques are not yet available. Use incident frequency and severity data as proxy metrics for AI risk categories that lack established quantitative measures.',
 ARRAY['Proxy metric documentation', 'Incident frequency analysis', 'Risk category tracking']),

-- IR-6: Incident Reporting
('MANAGE 4.2', 'ir-6', 'Strong',
 'IR-6 incident reporting directly supports continual AI improvement by requiring communication of incidents to stakeholders, enabling organizational learning. Ensures AI incident information reaches decision-makers and affected parties.',
 'Report AI incidents to affected parties, internal stakeholders, and regulatory bodies as required. Include AI-specific incident details such as affected model versions, impacted user populations, and estimated scope of incorrect or biased outputs.',
 ARRAY['Incident reports', 'Regulatory notifications', 'Stakeholder communications']),

('MANAGE 4.3', 'ir-6', 'Strong',
 'IR-6 incident reporting directly supports AI accountability by requiring that incidents and errors are communicated to relevant AI actors including affected communities. Core control for transparent AI incident communication.',
 'Maintain transparent AI incident reporting that communicates the nature of the incident, affected populations, remediation actions taken, and measures to prevent recurrence. Provide accessible reporting channels for affected communities to report AI system issues.',
 ARRAY['Public incident reports', 'Community notification records', 'Remediation communication logs']),

('GOVERN 5.1', 'ir-6', 'Partial',
 'IR-6 incident reporting supports collection of external feedback by requiring incident information sharing that may prompt feedback from affected parties. Addresses incident-driven feedback but not systematic feedback collection mechanisms.',
 'Use AI incident reports as opportunities to collect feedback from affected individuals and communities about the impact of AI system failures. Integrate incident feedback into AI risk assessment and system improvement processes.',
 ARRAY['Feedback collection records', 'Incident response surveys', 'Community engagement documentation']),

('GOVERN 5.2', 'ir-6', 'Partial',
 'IR-6 incident reporting supports mechanisms for incorporating adjudicated feedback by documenting incident lessons learned and corrective actions. Addresses post-incident learning but not systematic feedback integration processes.',
 'Share AI incident lessons learned with governance stakeholders and development teams. Feed incident findings back into AI system design and deployment processes to prevent recurrence of similar issues.',
 ARRAY['Lessons learned documentation', 'Corrective action records', 'Post-incident review reports']),

-- IR-7: Incident Response Assistance
('MANAGE 4.1', 'ir-7', 'Partial',
 'IR-7 response assistance supports AI incident resolution by providing access to specialized expertise and resources during incident handling. Addresses expert support but not the broader monitoring and evaluation plan.',
 'Provide AI-specific expertise for incident response teams including model behavior analysts, data scientists, and AI ethics specialists. Establish relationships with external AI security experts and research communities for complex incident support.',
 ARRAY['Expert roster documentation', 'Support engagement records', 'External partnership agreements']),

('MANAGE 2.1', 'ir-7', 'Partial',
 'IR-7 response assistance supports consideration of viable alternatives during AI incidents by providing expert guidance on non-AI approaches. Addresses expert consultation but not the broader resource planning for AI risk management.',
 'Ensure incident response assistance includes evaluation of non-AI alternatives when AI systems fail. Provide guidance on manual fallback procedures and rule-based alternatives that can maintain operations during AI system recovery.',
 ARRAY['Alternative assessment records', 'Fallback procedure documentation', 'Expert consultation logs']),

-- IR-8: Incident Response Plan
('GOVERN 1.3', 'ir-8', 'Strong',
 'IR-8 incident response plan directly supports AI risk management processes by establishing the organizational framework for preparing, detecting, analyzing, containing, and recovering from AI incidents. Core planning control for AI incident preparedness.',
 'Include AI system failure modes, bias events, adversarial attacks, and data poisoning scenarios in the incident response plan. Define AI-specific detection criteria, severity levels, escalation paths, response timelines, and recovery procedures.',
 ARRAY['Incident response plan', 'AI failure mode analysis', 'Recovery procedure documentation']),

('MANAGE 1.1', 'ir-8', 'Strong',
 'IR-8 incident response plan directly supports determination of whether AI systems should continue operating by pre-defining criteria for AI system suspension, rollback, or shutdown during incidents. Ensures go/no-go decisions are made systematically.',
 'Define AI incident severity levels with corresponding response actions: Level 1 (monitor), Level 2 (investigate), Level 3 (contain and remediate), Level 4 (suspend AI system). Include clear authority for AI system shutdown decisions.',
 ARRAY['Incident response plan', 'Severity classification documentation', 'Decision authority matrix']),

('MANAGE 4.1', 'ir-8', 'Strong',
 'IR-8 incident response plan directly establishes the post-deployment incident response framework for AI systems. Ensures AI incident response capabilities are planned, resourced, and documented before deployment.',
 'Develop AI incident playbooks for specific scenarios: model performance degradation, discriminatory output detection, adversarial input discovery, training data breach, and third-party AI component failure. Review and update playbooks after each significant AI incident.',
 ARRAY['AI incident playbooks', 'Playbook review records', 'Post-incident update documentation']),

('GOVERN 1.5', 'ir-8', 'Partial',
 'IR-8 plan maintenance requirements support ongoing review of AI incident response processes and their effectiveness. Addresses IR plan review but not the broader AI risk management process review.',
 'Review AI incident response plan effectiveness at least annually and after significant AI incidents. Update AI-specific playbooks, detection criteria, and response procedures based on lessons learned and evolving AI threat landscape.',
 ARRAY['Plan review records', 'Effectiveness assessment reports', 'Update documentation']),

-- IR-9: Information Spillage Response
('MANAGE 1.2', 'ir-9', 'Partial',
 'IR-9 information spillage response supports AI risk prioritization by providing specific procedures for handling data exposure incidents involving AI training data, model parameters, or inference results. Addresses data spillage but not broader AI risk prioritization.',
 'Include AI training data exposure, model weight leakage, and inference result spillage in information spillage response procedures. Prioritize spillage incidents involving PII used in training, proprietary model architectures, or safety-critical inference data.',
 ARRAY['Spillage response procedures', 'AI data classification records', 'Spillage incident reports']),

('MEASURE 2.10', 'ir-9', 'Partial',
 'IR-9 spillage response supports AI privacy risk management by providing procedures for containing and remediating exposure of personal data used in AI systems. Addresses reactive privacy protection but not proactive privacy risk assessment.',
 'Respond to AI training data spillage incidents that expose personal data with specific containment steps including model quarantine, data access revocation, and affected individual notification. Assess re-identification risk from exposed AI training data.',
 ARRAY['Privacy incident records', 'Containment action logs', 'Re-identification risk assessments']),

-- IR-10: Integrated Information Security Analysis Team
('GOVERN 2.1', 'ir-10', 'Partial',
 'IR-10 integrated analysis teams support AI risk management role definition by requiring cross-functional expertise for security analysis. Addresses team composition but not the full breadth of AI risk management accountability structures.',
 'Include AI expertise in security analysis team composition such as machine learning engineers, data scientists, and AI ethics specialists. Ensure the integrated analysis team can assess AI-specific threats, vulnerabilities, and incident impacts.',
 ARRAY['Team composition documentation', 'Role definition records', 'Expertise coverage assessments']),

('GOVERN 2.3', 'ir-10', 'Partial',
 'IR-10 integrated analysis teams support executive leadership responsibility by providing expert analysis that informs executive decisions about AI risks. Addresses analytical support but not executive decision accountability.',
 'Provide executive leadership with AI-specific threat analysis and incident impact assessments from the integrated analysis team. Ensure AI risk briefings include technical context necessary for informed leadership decision-making.',
 ARRAY['Executive briefing records', 'AI threat analysis reports', 'Decision support documentation'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
