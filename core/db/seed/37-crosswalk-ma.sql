-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — MA Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 MA controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- MA-1: Policy and Procedures
('GOVERN 1.1', 'ma-1', 'Partial',
 'MA-1 establishes the maintenance policy framework that can incorporate AI-specific maintenance requirements for model serving infrastructure, training clusters, and inference pipeline components. Addresses the policy layer for maintenance but not the full scope of AI risk management policies.',
 'Extend MA-1 policy to require maintenance procedures for AI-specific infrastructure including GPU compute clusters, model serving endpoints, training data storage systems, and inference pipeline components. Define maintenance scheduling requirements that account for AI system availability needs and model retraining windows.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 1.3', 'ma-1', 'Partial',
 'MA-1 procedures define organizational maintenance processes that support AI risk management through structured upkeep of AI infrastructure components. Addresses maintenance process discipline but not AI-specific risk tolerance determination.',
 'Define maintenance procedures for AI infrastructure that address hardware lifecycle management for compute resources, firmware updates for accelerator hardware, and software patching for model serving frameworks. Establish procedures for coordinating AI system maintenance with model training schedules and inference availability requirements.',
 ARRAY['Policy documents', 'MA procedure documentation', 'AI infrastructure maintenance procedures']),

-- MA-2: Controlled Maintenance
('MANAGE 2.2', 'ma-2', 'Partial',
 'MA-2 controlled maintenance supports AI system value sustainment by ensuring AI infrastructure components are maintained according to manufacturer specifications and organizational requirements, preserving system reliability and performance. Addresses infrastructure maintenance but not the broader AI value sustainment mechanisms.',
 'Schedule AI infrastructure maintenance windows to minimize disruption to inference services and coordinate with model training schedules to avoid data loss or training interruption. Document maintenance activities on AI-specific hardware including GPU clusters, specialized accelerators, and high-performance storage systems used for training data and model weights.',
 ARRAY['Maintenance schedules', 'AI infrastructure maintenance records', 'Disruption impact assessments']),

('MANAGE 2.4', 'ma-2', 'Partial',
 'MA-2 controlled maintenance supports AI system protection by reducing vulnerability exposure through timely patching and component replacement of AI infrastructure. Addresses infrastructure upkeep but not the decision criteria for AI system disengagement.',
 'Apply security patches and firmware updates to AI infrastructure components during controlled maintenance windows including model serving frameworks, container orchestration platforms, and GPU driver software. Verify AI system integrity after maintenance by running inference validation tests against reference datasets before returning systems to production.',
 ARRAY['Patch application records', 'Post-maintenance validation results', 'Component replacement documentation']),

('GOVERN 4.3', 'ma-2', 'Supportive',
 'MA-2 controlled maintenance supports organizational AI testing practices by providing scheduled windows during which AI infrastructure can be updated and validated without impacting production operations. Addresses maintenance scheduling but not the AI testing practices themselves.',
 'Coordinate AI infrastructure maintenance with security assessment and testing schedules to ensure maintenance activities do not interfere with ongoing AI system evaluations. Use maintenance windows as opportunities to apply security configuration updates identified during AI system assessments.',
 ARRAY['Maintenance-testing coordination records', 'Security update application logs', 'Schedule alignment documentation']),

-- MA-3: Maintenance Tools
('MANAGE 2.4', 'ma-3', 'Partial',
 'MA-3 maintenance tool controls protect AI system integrity by ensuring that tools used to service AI infrastructure are approved, monitored, and free from malicious modifications that could compromise model weights or training data. Addresses tool management but not the broader AI system protection framework.',
 'Control and monitor tools used to maintain AI training clusters, model serving infrastructure, and inference pipeline components. Approve diagnostic and repair tools for AI infrastructure and verify tool integrity before use to prevent introduction of malicious code that could alter model behavior or compromise training data.',
 ARRAY['Approved tool inventories', 'Tool integrity verification records', 'Maintenance tool audit logs']),

('MAP 2.3', 'ma-3', 'Supportive',
 'MA-3 maintenance tool controls support AI system TEVV integrity by ensuring that maintenance tools cannot inadvertently alter AI system configurations or model artifacts in ways that would invalidate prior testing and evaluation results. Provides tool-level assurance for AI system integrity.',
 'Verify that maintenance tools used on AI infrastructure do not modify model weights, inference configurations, or monitoring baselines without authorization and documentation. Track maintenance tool usage against AI system change management records to maintain traceability between maintenance activities and any changes to AI system behavior.',
 ARRAY['Tool usage tracking records', 'Change traceability documentation', 'Configuration integrity verification']),

-- MA-4: Nonlocal Maintenance
('MANAGE 2.4', 'ma-4', 'Partial',
 'MA-4 nonlocal maintenance controls protect AI system integrity during remote administration by requiring strong authentication, session monitoring, and proper termination for remote maintenance of AI infrastructure. Addresses remote access security but not the broader AI system protection mechanisms.',
 'Secure remote maintenance sessions for AI infrastructure using strong authentication, encrypted connections, and session recording. Monitor nonlocal maintenance activities on AI training clusters, model repositories, and inference endpoints to detect unauthorized modifications to AI system components during remote servicing.',
 ARRAY['Remote maintenance session records', 'Authentication logs', 'Session monitoring documentation']),

('GOVERN 6.1', 'ma-4', 'Partial',
 'MA-4 nonlocal maintenance controls support third-party AI risk management by governing how external maintenance providers remotely access AI infrastructure. Addresses remote access governance for external parties but not the broader third-party risk assessment.',
 'Apply enhanced monitoring and access restrictions for third-party personnel performing nonlocal maintenance on AI infrastructure. Require that remote maintenance sessions by external providers are observed or recorded, and limit remote access scope to specific AI infrastructure components needed for the maintenance task.',
 ARRAY['Third-party remote access records', 'Session observation logs', 'Access scope limitation documentation']),

-- MA-5: Maintenance Personnel
('GOVERN 2.1', 'ma-5', 'Partial',
 'MA-5 maintenance personnel authorization supports a trustworthy AI workforce by ensuring that individuals who physically or logically access AI infrastructure for maintenance purposes are vetted and authorized. Addresses maintenance personnel management but not the broader AI role definition framework.',
 'Vet and authorize maintenance personnel who access AI training clusters, GPU infrastructure, model storage systems, and inference serving components. Maintain a list of authorized maintenance organizations and personnel for AI-specific infrastructure and verify authorization before granting access to AI system components.',
 ARRAY['Authorized personnel lists', 'Vetting documentation', 'Authorization verification records']),

('GOVERN 6.1', 'ma-5', 'Partial',
 'MA-5 maintenance personnel controls support third-party AI risk management by establishing authorization requirements for external maintenance providers who service AI infrastructure. Addresses personnel authorization but not the broader third-party risk assessment process.',
 'Verify that third-party maintenance personnel authorized to service AI infrastructure meet organizational security requirements. Require escort or supervision for external maintenance personnel who access AI model storage, training data systems, or inference infrastructure and who do not possess required access authorizations.',
 ARRAY['Third-party authorization records', 'Escort and supervision logs', 'Competency verification documentation']),

('MANAGE 3.1', 'ma-5', 'Supportive',
 'MA-5 personnel controls support monitoring of third-party AI resources by establishing the authorization framework that enables oversight of external maintenance activities on AI systems. Addresses personnel-level authorization but not the broader third-party resource monitoring.',
 'Monitor maintenance activities performed by authorized external personnel on AI infrastructure including changes to hardware configurations, software updates, and component replacements. Require maintenance personnel to document all actions taken on AI system components for post-maintenance review and audit.',
 ARRAY['Maintenance activity logs', 'External personnel action documentation', 'Post-maintenance review records']),

-- MA-6: Timely Maintenance
('MANAGE 2.2', 'ma-6', 'Partial',
 'MA-6 timely maintenance supports AI system value sustainment by ensuring that failed AI infrastructure components are repaired or replaced within timeframes that maintain acceptable AI system availability levels. Addresses component-level repair timeliness but not the broader AI value sustainment framework.',
 'Define maintenance support agreements and spare parts availability for critical AI infrastructure components including GPU accelerators, high-performance storage, and specialized networking hardware. Establish maintenance response timeframes for AI system components based on the criticality of AI services they support and the availability of fallback capabilities.',
 ARRAY['Maintenance support agreements', 'Spare parts inventory records', 'Response timeframe documentation']),

('MANAGE 4.1', 'ma-6', 'Supportive',
 'MA-6 timely maintenance supports AI risk treatment by providing the operational capability to quickly restore failed AI infrastructure components, reducing the duration of AI system outages or degraded operation. Addresses repair responsiveness but not the risk treatment decision framework.',
 'Prioritize maintenance response for AI infrastructure components that directly impact model serving availability, training pipeline continuity, or monitoring capability. Maintain contracts or agreements that ensure timely repair or replacement of critical AI hardware to minimize AI system downtime.',
 ARRAY['Priority classification records', 'Contract and SLA documentation', 'Repair response tracking']),

-- MA-7: Field Maintenance
('MANAGE 2.4', 'ma-7', 'Supportive',
 'MA-7 field maintenance restrictions support AI system integrity by controlling where and how maintenance is performed on AI infrastructure components that may contain sensitive model weights or training data. Provides physical maintenance controls for AI system protection.',
 'Restrict field maintenance on AI infrastructure components that store model weights, training data, or inference configurations to trusted facilities where additional security controls are available. Require that components containing AI artifacts are sanitized before field maintenance or serviced only by personnel with appropriate authorizations in controlled environments.',
 ARRAY['Field maintenance restriction documentation', 'Trusted facility designations', 'Component handling procedures'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
