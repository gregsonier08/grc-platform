-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — PS Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 PS controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- PS-1: Policy and Procedures
('GOVERN 1.1', 'ps-1', 'Partial',
 'PS-1 establishes the personnel security policy framework that can incorporate AI-specific workforce requirements for roles involved in AI development, deployment, and oversight. Addresses the policy layer for personnel security but not the full scope of AI risk management policies.',
 'Extend PS-1 policy to require AI-specific personnel security requirements including risk designation criteria for AI roles, screening standards for personnel with access to training data and model weights, and access agreement provisions for responsible AI use.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

('GOVERN 1.3', 'ps-1', 'Partial',
 'PS-1 procedures define organizational personnel security processes that support AI risk tolerance through controlled workforce management for AI system access. Addresses personnel process discipline but not AI-specific risk tolerance determination.',
 'Define personnel security procedures for AI workforce management including onboarding for AI development roles, periodic re-screening triggers for sensitive AI positions, and separation of duties requirements for model development and deployment.',
 ARRAY['Policy documents', 'PS procedure documentation', 'AI workforce management procedures']),

-- PS-2: Position Risk Designation
('GOVERN 2.1', 'ps-2', 'Strong',
 'PS-2 position risk designation directly supports AI risk management role definition by requiring organizations to categorize the risk level of positions that develop, deploy, or oversee AI systems. Core control for establishing a risk-informed AI workforce structure.',
 'Designate risk levels for positions with AI development, training data curation, model deployment, and AI oversight responsibilities. Apply higher risk designations to positions that can modify production AI models, access sensitive training datasets, or authorize AI system deployment decisions.',
 ARRAY['Position risk designation records', 'AI role risk categorization', 'Designation review documentation']),

('GOVERN 2.2', 'ps-2', 'Partial',
 'PS-2 risk designation informs AI workforce competency requirements by linking position sensitivity to the level of AI expertise and vetting required. Addresses risk categorization but not the competency development programs themselves.',
 'Align AI position risk designations with required technical competencies, security clearance levels, and AI ethics training obligations. Use risk designation tiers to determine which AI roles require specialized competency assessments such as bias awareness, model security, or responsible AI practices.',
 ARRAY['Risk-to-competency mapping', 'Competency requirement documentation', 'Designation criteria records']),

('MAP 3.4', 'ps-2', 'Partial',
 'PS-2 risk designation supports AI system operator proficiency by establishing the sensitivity level of operator positions, which informs screening depth and competency requirements. Addresses position categorization but not the operator training or certification standards.',
 'Designate risk levels for AI system operator positions based on the criticality of AI systems they manage and the potential impact of operator errors or misuse. Ensure operator position designations reflect the sensitivity of AI data and decision-making authority involved.',
 ARRAY['Operator position designations', 'Risk level justification records', 'Position sensitivity assessments']),

-- PS-3: Personnel Screening
('GOVERN 2.1', 'ps-3', 'Partial',
 'PS-3 personnel screening supports a trustworthy AI workforce by verifying the suitability of individuals before granting access to AI development environments, training data, and model management systems. Addresses pre-access vetting but not ongoing AI role definition or competency assessment.',
 'Screen personnel with access to AI training data, model weights, inference pipelines, and AI administrative functions at a level commensurate with the AI position risk designation. Apply enhanced screening for roles with access to sensitive datasets, production model deployment authority, or AI system security configurations.',
 ARRAY['Screening records', 'Background investigation reports', 'Screening-to-designation alignment documentation']),

('GOVERN 6.1', 'ps-3', 'Partial',
 'PS-3 screening supports third-party AI risk management by requiring suitability verification of external personnel who access organizational AI systems. Addresses identity verification of external personnel but not the broader third-party risk assessment framework.',
 'Require personnel screening for contractors, consultants, and third-party personnel granted access to AI development environments, training data repositories, or model serving infrastructure. Verify that third-party organizations apply equivalent screening standards for their personnel who support AI systems.',
 ARRAY['Third-party screening records', 'Contractor vetting documentation', 'Screening equivalency assessments']),

-- PS-4: Personnel Termination
('GOVERN 2.1', 'ps-4', 'Supportive',
 'PS-4 personnel termination supports AI workforce lifecycle management by ensuring departing personnel lose access to AI systems, training data, and model artifacts. Addresses access removal but not the ongoing definition of AI risk management roles.',
 'Revoke AI system access promptly upon personnel termination including credentials for model repositories, training pipeline access, API keys for inference endpoints, and administrative access to AI monitoring systems. Retrieve AI-related assets such as development devices, access tokens, and documentation containing model architecture details.',
 ARRAY['Termination checklists', 'Access revocation records', 'Asset retrieval documentation']),

('MANAGE 2.4', 'ps-4', 'Supportive',
 'PS-4 termination procedures support AI system protection by ensuring that departing personnel cannot retain access that could be used to compromise AI system integrity or availability. Addresses personnel offboarding but not the decision criteria for AI system disengagement.',
 'Include AI-specific termination steps such as revoking model registry access, rotating shared API keys that the departing employee used, and reviewing recent AI system changes made by the individual for integrity assurance.',
 ARRAY['AI-specific termination procedures', 'Key rotation records', 'Change review documentation']),

-- PS-5: Personnel Transfer
('GOVERN 2.1', 'ps-5', 'Supportive',
 'PS-5 personnel transfer supports AI access lifecycle management by requiring review of access authorizations when individuals change roles within the organization. Addresses access updates but not the definition of AI risk management roles.',
 'Review and adjust AI system access rights when personnel transfer between roles, ensuring access is appropriate for the new position. Remove AI development, deployment, or oversight access that is no longer needed in the new role and provision new access based on the destination position risk designation.',
 ARRAY['Transfer access review records', 'AI access modification documentation', 'Role transition checklists']),

('GOVERN 3.2', 'ps-5', 'Partial',
 'PS-5 transfer procedures support human-AI oversight continuity by ensuring that AI oversight responsibilities are formally reassigned when personnel change positions. Addresses access transfer but not the policy framework for human-AI configurations.',
 'Reassign AI oversight responsibilities when personnel who serve in human-AI oversight roles transfer to other positions. Ensure continuity of AI model monitoring, output review, and escalation responsibilities during personnel transitions by identifying interim assignees and updating oversight duty rosters.',
 ARRAY['Oversight reassignment records', 'Transition continuity documentation', 'Duty roster updates']),

-- PS-6: Access Agreements
('GOVERN 1.4', 'ps-6', 'Strong',
 'PS-6 access agreements directly support transparent AI governance by requiring personnel to acknowledge their responsibilities regarding AI system access, data handling, and acceptable use before being granted access. Core governance control for documenting individual AI use commitments.',
 'Require signed access agreements for AI system access covering responsible AI use obligations, restrictions on unauthorized model modification, training data handling requirements, and obligations to report AI system anomalies or harmful outputs. Include AI-specific provisions addressing intellectual property for AI-generated artifacts and restrictions on exfiltrating model weights or training data.',
 ARRAY['Access agreement templates', 'Signed agreement records', 'AI-specific provision documentation']),

('GOVERN 6.1', 'ps-6', 'Strong',
 'PS-6 access agreements directly establish AI usage expectations for all personnel including those interacting with third-party AI components and services. Core control for documenting acceptable AI use boundaries and third-party AI interaction constraints.',
 'Include provisions in access agreements addressing use of third-party AI services, restrictions on sharing organizational data with external AI systems, requirements for using only approved AI tools, and obligations regarding third-party AI intellectual property compliance. Ensure agreements cover responsibilities specific to personnel who integrate or manage third-party AI services.',
 ARRAY['Third-party AI use provisions', 'Agreement records', 'Approved tool documentation']),

('GOVERN 6.2', 'ps-6', 'Partial',
 'PS-6 access agreements support contingency processes for AI failures by documenting enforcement mechanisms and consequences that apply when AI systems are misused or access agreement terms are violated. Addresses individual accountability but not organizational contingency planning.',
 'Define enforcement consequences within access agreements for AI policy violations including unauthorized model deployment, circumvention of AI safety controls, and mishandling of training data. Ensure agreement terms are enforceable and aligned with organizational sanctions processes.',
 ARRAY['Enforcement provision documentation', 'Agreement violation records', 'Sanctions alignment documentation']),

('GOVERN 3.2', 'ps-6', 'Partial',
 'PS-6 access agreements support human-AI oversight by documenting individual responsibilities for AI system monitoring, output review, and override decision-making. Addresses individual commitment documentation but not the organizational oversight framework.',
 'Include provisions in access agreements for personnel in AI oversight roles covering responsibilities to review AI outputs, exercise override authority when warranted, and report AI system behavior that exceeds expected parameters or produces potentially harmful results.',
 ARRAY['Oversight role agreement provisions', 'Override responsibility documentation', 'Review obligation records']),

-- PS-7: External Personnel Security
('GOVERN 6.1', 'ps-7', 'Strong',
 'PS-7 external personnel security directly addresses third-party AI risk by establishing security requirements for contractors, consultants, and external service providers who access organizational AI systems. Core control for managing external personnel who interact with AI resources.',
 'Establish AI-specific security requirements for external personnel including screening standards for those accessing AI training data, access limitations for model development environments, and monitoring requirements for external personnel performing AI system administration. Document AI security expectations in service agreements and verify compliance periodically.',
 ARRAY['External personnel security requirements', 'Service agreement AI provisions', 'Compliance verification records']),

('GOVERN 6.2', 'ps-7', 'Partial',
 'PS-7 external personnel security supports contingency processes for third-party AI issues by defining external personnel obligations and organizational recourse when security requirements are not met. Addresses personnel-level contingencies but not broader AI service continuity planning.',
 'Define contingency measures for external personnel security incidents involving AI systems including procedures for revoking contractor access to AI resources, conducting security reviews of AI work performed by external personnel, and notifying affected stakeholders of potential AI system compromise through external personnel.',
 ARRAY['Contingency procedure documentation', 'Incident response records', 'External access revocation logs']),

('MANAGE 3.1', 'ps-7', 'Partial',
 'PS-7 external personnel security supports monitoring of third-party AI resources by establishing personnel security controls that enable oversight of external parties who access or manage AI systems. Addresses personnel-level monitoring but not the broader third-party AI resource risk assessment.',
 'Monitor external personnel activities on AI systems including access to training data, model modifications, and pipeline configuration changes. Require external personnel to comply with the same AI system logging, change management, and review processes applied to internal staff.',
 ARRAY['External personnel activity logs', 'Compliance monitoring records', 'Change tracking documentation']),

-- PS-8: Personnel Sanctions
('GOVERN 1.4', 'ps-8', 'Partial',
 'PS-8 personnel sanctions support transparent AI governance by establishing a formal enforcement mechanism for AI policy violations, demonstrating organizational commitment to responsible AI practices. Addresses enforcement but not comprehensive AI governance documentation.',
 'Define sanctions for AI-specific policy violations including unauthorized model deployment, intentional introduction of bias, circumvention of AI safety controls, and misuse of AI systems for prohibited purposes. Communicate AI-related sanctions to all personnel to reinforce responsible AI practices and deter misuse.',
 ARRAY['Sanctions policy documentation', 'AI violation definitions', 'Communication records']),

('GOVERN 6.2', 'ps-8', 'Partial',
 'PS-8 sanctions support contingency processes for AI misuse by providing organizational recourse when personnel actions cause AI system disruptions or policy violations. Addresses disciplinary response but not the broader contingency and recovery planning.',
 'Apply sanctions proportional to the severity and impact of AI policy violations. Maintain records of AI-related sanctions to support pattern analysis, policy improvement, and demonstration of organizational accountability for responsible AI practices.',
 ARRAY['Sanctions application records', 'Severity assessment documentation', 'Pattern analysis reports']),

-- PS-9: Position Descriptions
('GOVERN 2.1', 'ps-9', 'Strong',
 'PS-9 position descriptions directly support AI risk management role definition by requiring organizations to document security and privacy responsibilities for positions that develop, deploy, or oversee AI systems. Core control for clearly defining AI-related roles and accountability.',
 'Document AI-specific responsibilities in position descriptions including AI risk assessment duties, model review and approval authority, training data governance responsibilities, and AI incident response roles. Ensure position descriptions for AI-related roles clearly distinguish between development, review, deployment, and oversight responsibilities.',
 ARRAY['Position descriptions', 'AI role responsibility documentation', 'Duty specification records']),

('GOVERN 2.2', 'ps-9', 'Strong',
 'PS-9 position descriptions directly support AI workforce competency by specifying the technical skills, knowledge areas, and training requirements needed for positions that involve AI risk management. Core control for establishing competency expectations for AI roles.',
 'Specify AI risk management competencies in position descriptions including required knowledge of AI fairness and bias, model security, data governance, and ethical AI practices. Define minimum qualifications for AI roles such as relevant technical experience, certification requirements, and demonstrated proficiency in AI risk management frameworks.',
 ARRAY['Competency specifications', 'Qualification requirements', 'AI skill requirement documentation']),

('GOVERN 3.2', 'ps-9', 'Partial',
 'PS-9 position descriptions support human-AI oversight configuration by documenting which positions carry AI oversight responsibilities, what oversight authority they hold, and what AI systems fall under their purview. Addresses role documentation but not the policy framework for human-AI configurations.',
 'Include AI oversight responsibilities in position descriptions for roles that review AI outputs, authorize AI deployments, or exercise override authority on AI decisions. Specify the scope of AI oversight for each position including which AI systems, decision types, and operational contexts require human review.',
 ARRAY['Oversight role descriptions', 'Authority scope documentation', 'AI system-to-role mapping']),

('MAP 3.4', 'ps-9', 'Partial',
 'PS-9 position descriptions support AI system operator proficiency by establishing the qualifications and performance expectations for positions that operate AI systems in production. Addresses role specification but not operator certification or training programs.',
 'Define operator proficiency requirements in position descriptions for personnel who manage AI systems in production including monitoring competencies, troubleshooting skills, and escalation responsibilities. Specify performance expectations for AI system operators such as response time for anomaly detection and adherence to model fallback procedures.',
 ARRAY['Operator position descriptions', 'Proficiency requirement records', 'Performance expectation documentation'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
