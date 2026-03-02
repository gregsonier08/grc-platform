-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — RA Family Crosswalk Mappings
-- Source: NIST AI 100-1 × NIST SP 800-53 Rev 5
-- 35 individual control mappings
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
('GOVERN 1.1', 'ra-1', 'Partial',
 'RA-1 establishes the risk assessment policy framework that can incorporate AI-specific risk identification and analysis requirements. Policy coverage extends to AI risk assessment processes but not to broader AI governance practices.',
 'Extend RA-1 policy to define AI-specific risk assessment requirements: frequency of AI risk assessments, methodology for AI risk identification, AI threat sources to consider, and documentation standards for AI risk findings.',
 ARRAY['Risk assessment policy', 'AI risk assessment standards']),

('GOVERN 1.3', 'ra-1', 'Partial',
 'RA-1 risk assessment policy and procedures establish the organizational process for determining risk management activity levels. Policy defines when and how risk assessments trigger different levels of risk management response.',
 'Use RA-1 policy to define AI risk assessment triggers and thresholds that determine required risk management activity levels. Establish risk tolerance criteria that guide assessment-to-management escalation.',
 ARRAY['Risk assessment policy', 'Risk tolerance criteria', 'Escalation thresholds']),

('GOVERN 3.1', 'ra-3', 'Partial',
 'RA-3 risk assessments produce risk documentation that conveys the level and nature of risk to organizational personnel. Risk assessment reports are the primary mechanism for communicating AI risk levels.',
 'Ensure RA-3 AI risk assessment outputs include clear risk level communication: executive summaries, risk heat maps, and risk trending data suitable for different audience levels. Distribute risk assessment findings to relevant AI risk owners.',
 ARRAY['Risk assessment reports', 'Risk heat maps', 'Distribution records']),

('GOVERN 4.2', 'ra-3', 'Partial',
 'RA-3 risk assessments directly produce the risk documentation that teams are required to document and communicate broadly. Risk assessment is the primary mechanism for identifying and documenting AI risks.',
 'Use RA-3 to systematically document AI risks identified during development and deployment. Establish communication processes for sharing risk assessment findings with affected teams and stakeholders.',
 ARRAY['Risk assessment documentation', 'Risk communication records']),

('MAP 1.4', 'ra-2', 'Strong',
 'RA-2 security categorization determines the criticality and sensitivity of the AI system context, directly informing the business value and context definition required. Categorization establishes the system risk profile that defines appropriate management investment.',
 'Apply RA-2 categorization to AI systems: assess system impact on confidentiality, integrity, and availability of information processed, and consider AI-specific factors such as decision consequence severity. Document categorization rationale.',
 ARRAY['Security categorization documentation', 'Categorization rationale', 'Impact level determination']),

('MAP 1.5', 'ra-3', 'Strong',
 'RA-3 risk assessment is the primary mechanism for determining and documenting organizational risk tolerances for AI systems. Risk assessments establish the evidence base for risk tolerance decisions.',
 'Conduct RA-3 risk assessments for each AI system that explicitly address risk tolerance: identify risk scenarios, assess likelihood and impact, compare against organizational tolerance thresholds, and document tolerance determinations.',
 ARRAY['Risk assessment report', 'Risk tolerance documentation', 'Tolerance threshold definitions']),

('MAP 1.5', 'ra-2', 'Partial',
 'RA-2 security categorization establishes the system impact level that reflects organizational risk tolerance for that system. Higher categorization reflects lower risk tolerance for compromise.',
 'Use RA-2 categorization decisions to document AI system-specific risk tolerance: the selected categorization level reflects acceptable risk for that system context. Document the relationship between categorization and risk tolerance.',
 ARRAY['Categorization documentation', 'Risk tolerance rationale']),

('MAP 3.1', 'ra-3', 'Partial',
 'RA-3 risk assessments include cost-benefit analysis components that support examination of potential benefits alongside risks. Risk assessments provide the analytical framework for comparing AI benefits against potential harms.',
 'Include benefit assessment in RA-3 AI risk analyses: document potential positive outcomes alongside risks. Use risk-benefit framing to inform decisions about AI system development and deployment scope.',
 ARRAY['Risk-benefit assessment', 'Benefit documentation', 'Risk assessment reports']),

('MAP 3.2', 'ra-3', 'Partial',
 'RA-3 risk assessments examine potential costs and negative consequences of AI system failures as part of likelihood and impact analysis. Failure cost analysis is a standard component of risk assessment methodology.',
 'Include AI system failure cost analysis in RA-3: quantify direct costs (incident response, remediation) and indirect costs (reputation, regulatory, operational disruption). Document non-monetary costs such as harm to affected populations.',
 ARRAY['Failure cost analysis', 'Non-monetary impact documentation', 'Risk assessment reports']),

('MAP 3.2', 'ra-5', 'Supportive',
 'RA-5 vulnerability monitoring identifies technical weaknesses that represent potential failure modes with associated costs. Vulnerability identification informs the cost dimension of AI system risk analysis.',
 'Use RA-5 findings to inform AI system failure cost analysis: each identified vulnerability represents a potential failure mode with associated impact costs. Prioritize vulnerability remediation based on potential failure costs.',
 ARRAY['Vulnerability findings', 'Cost impact analysis', 'Prioritization records']),

('MAP 3.3', 'ra-2', 'Strong',
 'RA-2 security categorization specifies the operational scope and risk boundaries for AI systems, directly informing the targeted application scope definition. Categorization helps define where and how AI systems should be deployed.',
 'Use RA-2 categorization findings to define AI system application scope: specify deployment contexts appropriate for the system risk profile, identify environments where deployment is inappropriate, and document scope rationale.',
 ARRAY['Categorization documentation', 'Application scope definition', 'Deployment boundary records']),

('MAP 4.1', 'ra-3', 'Partial',
 'RA-3 risk assessments identify and document technology and legal risks associated with AI system components. Risk assessment methodology covers third-party component risks and legal implications.',
 'Scope RA-3 to include AI technology and legal risk mapping: identify third-party AI components, assess risks associated with each, and document legal considerations including liability, compliance requirements, and IP risks.',
 ARRAY['AI component risk assessment', 'Legal risk documentation', 'Third-party risk analysis']),

('MAP 4.1', 'ca-3', 'Partial',
 'CA-3 information exchange agreements address legal and risk dimensions of sharing data and capabilities with third-party AI components. Exchange agreements establish terms that manage legal risks of AI component interactions.',
 'Establish CA-3 information exchange agreements for all third-party AI services: include data usage restrictions, liability terms, model update notification requirements, and incident response obligations.',
 ARRAY['Information exchange agreements', 'Third-party AI agreements']),

('MAP 4.2', 'ra-3', 'Partial',
 'RA-3 risk assessments identify the internal risk controls needed for AI system components. Risk assessment findings define the control requirements that must be implemented for each component.',
 'Use RA-3 to identify required internal risk controls for each AI system component: data ingestion controls, model access controls, output validation, and monitoring requirements. Document the control-to-component mapping.',
 ARRAY['Component risk assessment', 'Control requirement documentation', 'Control-component mapping']),

('MAP 4.2', 'ra-9', 'Partial',
 'RA-9 criticality analysis identifies which AI system components are most critical to mission/business functions, informing which components require the most robust internal risk controls.',
 'Conduct RA-9 criticality analysis for AI system components: identify components whose failure would most severely impact mission objectives. Prioritize internal risk controls based on component criticality findings.',
 ARRAY['Criticality analysis', 'Component criticality ratings', 'Control prioritization records']),

('MAP 4.2', 'sa-9', 'Partial',
 'SA-9 external system services requirements address the risks of third-party AI components by establishing security and accountability requirements for external services. This supports documentation of internal risk controls for external dependencies.',
 'Apply SA-9 requirements to third-party AI services: require security assessments of external AI providers, establish monitoring requirements for external AI service behavior, and document control responsibilities for each external dependency.',
 ARRAY['External service requirements', 'Third-party AI controls', 'Accountability documentation']),

('MAP 5.1', 'ra-3', 'Strong',
 'RA-3 risk assessment directly addresses the likelihood and magnitude assessment of identified impacts required. Risk assessment is the primary methodology for characterizing the probability and severity of potential AI harms.',
 'Apply RA-3 methodology to AI impact characterization: assess likelihood of each identified harm scenario based on threat sources, vulnerability factors, and deployment context. Document severity using consistent impact scales.',
 ARRAY['AI risk assessment', 'Impact likelihood analysis', 'Severity documentation', 'Risk assessment report']),

('MAP 5.1', 'ra-5', 'Partial',
 'RA-5 vulnerability monitoring contributes to impact likelihood assessment by identifying technical vulnerabilities that increase the probability of harmful AI system failures or misuse.',
 'Integrate RA-5 vulnerability findings into AI impact likelihood assessment. Each identified vulnerability increases the probability of associated harm scenarios. Document the relationship between vulnerabilities and impact likelihood.',
 ARRAY['Vulnerability findings', 'Likelihood adjustment documentation', 'Risk assessment integration']),

('MAP 5.1', 'ra-8', 'Partial',
 'RA-8 privacy impact assessments provide structured analysis of privacy-related impacts, which is a significant category of AI system harm. Privacy impact analysis contributes to characterizing the full spectrum of potential AI impacts.',
 'Incorporate RA-8 privacy impact assessment findings into overall AI impact characterization. Privacy harms — unauthorized disclosure, re-identification, discriminatory use — should be represented in the impact likelihood and magnitude analysis.',
 ARRAY['Privacy impact assessment', 'Impact characterization documentation']),

('MAP 5.1', 'ra-10', 'Supportive',
 'RA-10 threat hunting proactively identifies adversarial threats that could realize AI system impacts. Threat hunting findings provide empirical evidence for impact likelihood assessments.',
 'Apply RA-10 threat hunting to AI systems to identify active adversarial threats. Threat hunting findings should update AI impact likelihood assessments when active exploitation attempts are detected.',
 ARRAY['Threat hunting results', 'Likelihood update documentation']),

('MAP 5.2', 'ra-4', 'Supportive',
 'RA-4 risk assessment updates provide a mechanism for incorporating newly identified impacts from AI actor feedback into the risk picture. Updated assessments can reflect feedback from affected communities.',
 'Use RA-4 risk assessment updates to incorporate impact findings from AI actor engagement. When stakeholders identify previously uncharacterized impacts, update the risk assessment to reflect new findings.',
 ARRAY['Updated risk assessments', 'Feedback integration records', 'Assessment revision history']),

('MEASURE 2.6', 'ra-5', 'Partial',
 'RA-5 vulnerability monitoring and scanning identifies technical weaknesses that could lead to unsafe AI system behaviors. Vulnerability identification is a component of AI system safety examination.',
 'Apply RA-5 vulnerability monitoring to AI system infrastructure and model serving components. Include AI-specific vulnerability checks: adversarial input susceptibility, model extraction risks, and prompt injection vulnerabilities.',
 ARRAY['Vulnerability scan results', 'AI-specific vulnerability findings', 'Safety examination documentation']),

('MEASURE 2.7', 'ra-5', 'Strong',
 'RA-5 vulnerability monitoring and scanning is a primary mechanism for evaluating AI system security and identifying weaknesses that must be documented. Systematic vulnerability assessment directly addresses the security evaluation requirement.',
 'Conduct regular RA-5 vulnerability assessments of AI system components: model serving APIs, training data storage, model artifact repositories, and monitoring infrastructure. Document all findings and remediation status.',
 ARRAY['Vulnerability assessment reports', 'Security findings documentation', 'Remediation tracking']),

('MEASURE 2.10', 'ra-8', 'Direct',
 'RA-8 privacy impact assessments directly address examination of AI system privacy risks. Privacy impact assessment is the primary methodology for identifying and documenting privacy risks of AI systems processing personal information.',
 'Conduct RA-8 privacy impact assessments for AI systems that process personal data. Assess data collection practices, use limitations, retention, sharing, and access controls. Document privacy risks and required mitigations.',
 ARRAY['Privacy impact assessment', 'Privacy risk documentation', 'Mitigation requirements']),

('MEASURE 2.11', 'ra-3', 'Supportive',
 'RA-3 risk assessment can address fairness and bias as risk dimensions when scoped to include AI-specific harm categories. Risk assessment methodology provides a framework for evaluating bias as an organizational risk.',
 'Expand RA-3 AI risk assessments to include fairness and bias dimensions: identify potentially affected populations, assess likelihood and severity of discriminatory impacts, and document bias risk alongside other risk categories.',
 ARRAY['Bias risk assessment', 'Fairness risk documentation', 'Affected population analysis']),

('MEASURE 3.1', 'ra-3', 'Partial',
 'RA-3 risk assessments identify and document AI risks, establishing the inventory of risks to be tracked over time. Regular risk assessments create the temporal record needed for ongoing risk tracking.',
 'Conduct periodic RA-3 AI risk assessments and maintain risk registers that support longitudinal tracking. Track risk status changes between assessment cycles. Use assessment history to identify emerging trends.',
 ARRAY['Risk register', 'Periodic assessment records', 'Risk status tracking']),

('MEASURE 3.1', 'ra-4', 'Partial',
 'RA-4 risk assessment updates maintain the currency of AI risk tracking as conditions change. Regular updates ensure the risk inventory reflects current system state and operating environment.',
 'Establish RA-4 update triggers for AI systems: model updates, data distribution changes, new deployment contexts, and significant incidents. Document risk assessment updates and their rationale.',
 ARRAY['Risk assessment update records', 'Update trigger documentation', 'Change-driven reassessment log']),

('MEASURE 3.2', 'ra-4', 'Supportive',
 'RA-4 risk assessment updates support risk tracking in settings where initial metrics are unavailable by maintaining current risk understanding through periodic reassessment as measurement techniques mature.',
 'Use RA-4 updates to adapt AI risk tracking as measurement techniques evolve. When new metrics become available, update risk assessments to incorporate quantitative measures alongside previous qualitative approaches.',
 ARRAY['Methodology evolution records', 'Updated assessment documentation']),

('MANAGE 1.2', 'ra-3', 'Strong',
 'RA-3 risk assessment provides the likelihood and impact data needed to prioritize AI risk treatment. Risk prioritization is the direct output of risk assessment, informed by assessed probability and severity.',
 'Use RA-3 findings as the basis for AI risk treatment prioritization: rank risks by combined likelihood and impact score, consider available resources and remediation options, and document the prioritization rationale.',
 ARRAY['Risk priority rankings', 'Prioritization rationale', 'Treatment plan']),

('MANAGE 1.2', 'ra-9', 'Partial',
 'RA-9 criticality analysis provides additional input for risk treatment prioritization by identifying which AI system components and functions are most mission-critical, informing which risks most need treatment.',
 'Integrate RA-9 criticality findings into AI risk treatment prioritization: risks affecting high-criticality components should generally receive higher priority than equivalent risks in lower-criticality components.',
 ARRAY['Criticality analysis', 'Priority integration records']),

('MANAGE 1.3', 'ra-7', 'Direct',
 'RA-7 risk response is the explicit mechanism for developing and documenting planned responses to identified risks. Risk response planning directly produces the documented risk treatment plans required.',
 'Apply RA-7 to document AI risk response plans: for each prioritized risk, define the response approach, specific actions, responsible parties, timelines, and expected risk reduction. Include mitigate, transfer, avoid, and accept options.',
 ARRAY['Risk response plans', 'RA-7 risk response documentation', 'Treatment approach records']),

('MANAGE 1.3', 'ra-3', 'Partial',
 'RA-3 risk assessment findings inform the development of risk responses by characterizing what needs to be treated and why. Risk assessment is the prerequisite for meaningful risk response planning.',
 'Use RA-3 findings as the basis for risk response development: each identified risk should have a corresponding response plan. Ensure response plans address the specific risk characteristics identified in the assessment.',
 ARRAY['Risk assessment to response mapping', 'Response development records']),

('MANAGE 2.1', 'ra-3', 'Partial',
 'RA-3 risk assessments quantify the magnitude of risks, informing the resources needed to manage them. Resource requirements for AI risk management should be proportionate to assessed risk levels.',
 'Use RA-3 risk magnitude assessments to estimate resource requirements for AI risk management. Higher-risk AI systems should receive proportionally greater risk management resource allocation.',
 ARRAY['Resource allocation documentation', 'Risk-to-resource mapping', 'Budget planning records']),

('MANAGE 2.3', 'ra-7', 'Partial',
 'RA-7 risk response procedures include guidance for responding to newly discovered risks. The risk response framework established through RA-7 provides the procedural basis for handling previously unknown risks.',
 'Establish RA-7 procedures specifically for responding to previously unknown AI risks: detection-to-assessment pipeline, interim containment measures, full risk characterization process, and escalation to formal risk response planning.',
 ARRAY['Unknown risk response procedures', 'Incident-to-risk response workflow']),

('MANAGE 2.3', 'ra-4', 'Supportive',
 'RA-4 risk assessment updates provide the mechanism for formally incorporating newly discovered AI risks into the managed risk inventory. Unknown risks become tracked risks through the assessment update process.',
 'Trigger RA-4 risk assessment updates promptly when new AI risks are discovered. Formal assessment of newly identified risks enables their inclusion in the managed risk inventory and treatment planning process.',
 ARRAY['Triggered assessment updates', 'New risk incorporation records']);

-- Total rows inserted: 35
