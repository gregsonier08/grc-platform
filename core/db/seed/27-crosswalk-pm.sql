-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — PM Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 PM controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- PM-1: Information Security Program Plan
('GOVERN 1.1', 'pm-1', 'Strong',
 'PM-1 information security program plan directly establishes the organizational governance foundation for AI risk management by defining security requirements, roles, and processes. Core planning control that contextualizes AI within the broader security program.',
 'Integrate AI risk management requirements into the information security program plan including AI-specific risk categories, governance structures, and resource allocations. Reference AI RMF alignment as a program objective.',
 ARRAY['Security program plan', 'GRC platform control evidence', 'Program review records']),

('GOVERN 1.2', 'pm-1', 'Partial',
 'PM-1 program plan supports integration of trustworthy AI characteristics by providing the programmatic framework for incorporating AI-specific policies and practices. Addresses program structure but not the specific trustworthiness characteristics.',
 'Reference AI trustworthiness characteristics (validity, reliability, safety, security, privacy, fairness, explainability) in the security program plan. Identify which program elements address each characteristic and where gaps remain.',
 ARRAY['Security program plan', 'Trustworthiness mapping documentation']),

('GOVERN 1.3', 'pm-1', 'Partial',
 'PM-1 program plan establishes AI risk management processes within the broader security program lifecycle. Addresses programmatic process definition but not the specific determination of AI risk tolerance levels.',
 'Include AI lifecycle processes (development, testing, deployment, monitoring, decommissioning) in the security program plan. Define how AI risk management activities integrate with existing security program workflows.',
 ARRAY['Security program plan', 'AI lifecycle process documentation']),

-- PM-2: Information Security Program Leadership Role
('GOVERN 2.1', 'pm-2', 'Direct',
 'PM-2 security program leadership role directly maps to AI governance leadership by requiring a senior official with authority and accountability for the security program. Core control for establishing organizational AI risk management accountability.',
 'Designate a senior official responsible for AI risk oversight with appropriate authority, resources, and direct reporting to executive leadership. Define AI-specific responsibilities within the security program leadership role description.',
 ARRAY['Role descriptions', 'Organizational charts', 'Appointment documentation']),

('GOVERN 2.2', 'pm-2', 'Strong',
 'PM-2 program leadership supports AI competency by requiring the designated leader to have appropriate expertise and qualifications. Addresses leadership competency but not the broader workforce AI training requirements.',
 'Ensure the security program leader has AI risk management expertise or access to AI-specialized advisors. Include AI governance competency in leadership position qualifications and professional development plans.',
 ARRAY['Role descriptions', 'Qualification records', 'Professional development plans']),

('GOVERN 2.3', 'pm-2', 'Strong',
 'PM-2 program leadership directly supports executive responsibility for AI risk decisions by establishing clear accountability at the senior official level. Core control for ensuring AI deployment decisions have executive ownership.',
 'Ensure the designated security program leader has authority to approve or deny AI system deployments based on risk assessments. Establish clear escalation paths for AI risk decisions that exceed the leader''s risk acceptance authority.',
 ARRAY['Decision authority documentation', 'Escalation procedures', 'Approval records']),

-- PM-3: Information Security and Privacy Resources
('GOVERN 1.5', 'pm-3', 'Strong',
 'PM-3 resource allocation directly supports ongoing AI risk management by ensuring dedicated funding and personnel for AI governance activities. Core control for sustaining AI risk management program operations.',
 'Allocate dedicated resources for AI risk assessment, monitoring, and governance including personnel with AI expertise, tools for AI system evaluation, and budget for ongoing AI security and privacy activities.',
 ARRAY['Budget documents', 'Resource allocation records', 'Staffing plans']),

('GOVERN 1.7', 'pm-3', 'Strong',
 'PM-3 resource planning supports AI system decommissioning by ensuring long-term resource sustainability for the AI governance program including end-of-life activities. Addresses resource sustainability but not decommissioning process design.',
 'Plan multi-year resource allocation for AI governance maturation including resources for AI system decommissioning, post-deployment monitoring, and regulatory compliance as the AI portfolio grows.',
 ARRAY['Multi-year budget plans', 'Resource forecasting documents', 'Program maturation roadmaps']),

-- PM-4: Plan of Action and Milestones Process
('MANAGE 1.1', 'pm-4', 'Strong',
 'PM-4 POA&M process directly supports determination of AI risk treatment progress by providing a structured tracking mechanism for risk mitigations. Core control for ensuring AI risk responses are implemented systematically.',
 'Track AI-specific risk mitigations in the plan of action and milestones including model vulnerability remediation, bias correction actions, and privacy control implementations. Define completion criteria specific to AI risk items.',
 ARRAY['POA&M records', 'AI risk mitigation tracking', 'Completion criteria documentation']),

('MANAGE 1.2', 'pm-4', 'Strong',
 'PM-4 POA&M supports AI risk response prioritization by requiring milestones, responsible parties, and completion timelines for each risk item. Ensures AI risks are prioritized alongside other security and privacy risks.',
 'Prioritize AI risk items in POA&M based on impact to individuals, operational disruption potential, and regulatory exposure. Apply consistent prioritization criteria across AI and non-AI risk items for integrated risk management.',
 ARRAY['POA&M records', 'Prioritization criteria', 'Risk ranking documentation']),

('MANAGE 1.3', 'pm-4', 'Partial',
 'PM-4 POA&M tracks AI risk response progress through milestones and status reporting. Addresses progress tracking but not the development of risk response strategies.',
 'Include AI risk response milestones and completion criteria in POA&M entries. Track progress on AI-specific items such as model retraining, bias remediation, and privacy enhancement implementation.',
 ARRAY['POA&M status reports', 'Milestone tracking records']),

-- PM-5: System Inventory
('MAP 1.1', 'pm-5', 'Strong',
 'PM-5 system inventory directly supports AI system identification and context documentation by requiring a comprehensive catalog of organizational systems. Core control for AI system accountability throughout the lifecycle.',
 'Include all AI systems and components in the organizational system inventory with AI-specific metadata: model type, training data sources, deployment status, risk classification, and responsible owner. Track AI systems from development through decommissioning.',
 ARRAY['System inventory records', 'AI system registry', 'Lifecycle status tracking']),

('MAP 1.5', 'pm-5', 'Strong',
 'PM-5 inventory supports documentation of AI system purposes and potential impacts by requiring system characterization. Addresses system-level documentation but not the risk tolerance determination process.',
 'Document AI system purposes, stakeholder populations, potential individual and societal impacts, and business criticality in the system inventory. Annotate inventory entries with AI-specific risk ratings and impact assessments.',
 ARRAY['System inventory records', 'Impact documentation', 'Risk rating records']),

('MAP 5.1', 'pm-5', 'Partial',
 'PM-5 inventory supports documentation completeness for AI systems by providing a master list against which documentation coverage can be assessed. Addresses inventory but not impact magnitude assessment.',
 'Ensure all inventoried AI systems have complete documentation including model cards, data sheets, risk assessments, and operational procedures. Use inventory as a compliance checklist to identify AI systems with incomplete documentation.',
 ARRAY['Documentation coverage reports', 'Compliance checklists', 'Inventory completeness assessments']),

('GOVERN 1.6', 'pm-5', 'Strong',
 'PM-5 system inventory directly supports AI system inventory mechanisms by providing the organizational framework and tooling for tracking AI systems. Core enabler for AI accountability throughout the system lifecycle.',
 'Leverage the existing system inventory process to establish AI-specific inventory capabilities including automated discovery of AI components, classification of AI system types, and lifecycle status tracking from development through decommissioning.',
 ARRAY['System inventory procedures', 'AI discovery documentation', 'Lifecycle tracking records']),

-- PM-6: Measures of Performance
('MEASURE 4.1', 'pm-6', 'Strong',
 'PM-6 performance measures directly support connecting AI risk measurement approaches to organizational risk management by defining metrics for program effectiveness. Core control for evaluating whether AI risk management achieves its objectives.',
 'Define metrics to track AI risk management program effectiveness including coverage of AI systems assessed, time to remediate AI risks, stakeholder satisfaction with AI governance processes, and trend analysis of AI incidents.',
 ARRAY['Performance metric definitions', 'Program effectiveness reports', 'Trend analysis dashboards']),

('MEASURE 4.2', 'pm-6', 'Strong',
 'PM-6 performance measures support validation of AI measurement results by establishing feedback loops between measurement outcomes and program adjustments. Enables data-driven improvement of AI governance.',
 'Use performance metrics to identify AI governance improvements and validate whether measurement approaches produce actionable insights. Adjust AI risk metrics based on their correlation with actual risk outcomes.',
 ARRAY['Performance review records', 'Metric effectiveness analysis', 'Program adjustment documentation']),

-- PM-7: Enterprise Architecture
('GOVERN 1.1', 'pm-7', 'Partial',
 'PM-7 enterprise architecture supports AI governance by providing the organizational technology framework within which AI systems operate. Addresses architectural context but not AI-specific governance policies.',
 'Position AI systems within enterprise architecture documentation showing integration points, data flows, and dependency relationships. Use enterprise architecture to identify where AI systems introduce new risk pathways or modify existing ones.',
 ARRAY['Enterprise architecture documents', 'AI integration diagrams', 'Risk pathway analysis']),

-- PM-9: Risk Management Strategy
('GOVERN 1.1', 'pm-9', 'Strong',
 'PM-9 risk management strategy directly establishes the organizational approach to AI risk management including risk tolerance, assumptions, and constraints. Core strategic control that frames all AI risk management activities.',
 'Include AI-specific risk categories, threat assumptions, and acceptance criteria in the organizational risk management strategy. Define how AI risks are identified, assessed, and treated within the broader risk management framework.',
 ARRAY['Risk management strategy', 'AI risk category definitions', 'Risk acceptance criteria']),

('GOVERN 1.3', 'pm-9', 'Strong',
 'PM-9 risk strategy directly defines AI risk tolerance and acceptance criteria by establishing organizational risk appetite for different categories of AI deployment. Core control for consistent AI risk decision-making.',
 'Define risk appetite for AI system deployment across different use cases: higher tolerance for internal analytics, lower tolerance for customer-facing decisions, minimal tolerance for safety-critical applications. Document acceptance criteria for each AI risk level.',
 ARRAY['Risk tolerance documentation', 'Risk appetite statements', 'Acceptance criteria records']),

('MAP 1.4', 'pm-9', 'Strong',
 'PM-9 risk strategy provides the framework for AI risk identification scope by defining what risks the organization considers, how they are categorized, and what assumptions underlie risk assessments. Core context for AI risk scoping.',
 'Use the risk management strategy to scope AI risk assessments including which risk categories to evaluate, what threat assumptions to apply, and what residual risk levels are acceptable. Align AI risk identification with organizational risk framing.',
 ARRAY['Risk assessment scoping documentation', 'Threat assumption records', 'Risk framing alignment']),

-- PM-10: Authorization Process
('GOVERN 4.1', 'pm-10', 'Strong',
 'PM-10 authorization process directly supports a safety-first mindset by requiring formal approval before AI systems are deployed. Core governance gate that ensures AI risks are evaluated and accepted before operation begins.',
 'Require formal authorization for AI system deployment including review of risk assessments, testing results, and compliance with organizational AI policies. Establish authorization criteria specific to AI systems covering accuracy, fairness, safety, and privacy requirements.',
 ARRAY['Authorization decision records', 'AI deployment approval logs', 'Risk acceptance documentation']),

('GOVERN 4.2', 'pm-10', 'Strong',
 'PM-10 authorization process supports documentation of AI risks and impacts by requiring risk assessment as a prerequisite for deployment authorization. Ensures AI risk documentation is complete before systems become operational.',
 'Define authorization criteria specific to AI system risks including minimum test coverage, fairness evaluation results, privacy impact assessment completion, and safety validation evidence. Require documentation of known AI risks and accepted residual risks as part of authorization.',
 ARRAY['Authorization criteria documentation', 'Risk assessment prerequisites', 'Residual risk acceptance records']),

-- PM-11: Mission and Business Process Definition
('GOVERN 1.1', 'pm-11', 'Partial',
 'PM-11 business process definition contextualizes AI systems within organizational mission by identifying where AI supports or transforms business processes. Addresses organizational context but not AI-specific governance policies.',
 'Identify where AI systems support, augment, or replace mission and business processes. Document the role of AI in each business process to understand dependencies and potential impacts of AI system changes or failures.',
 ARRAY['Business process documentation', 'AI role mapping', 'Dependency analysis']),

('MAP 1.6', 'pm-11', 'Strong',
 'PM-11 business process definition directly supports AI system requirements elicitation by defining the mission context in which AI systems operate. Core control for ensuring AI design decisions account for sociotechnical implications.',
 'Map AI systems to affected mission and business processes to understand stakeholder expectations, performance requirements, and sociotechnical implications. Use business process context to inform AI system requirements and design trade-offs.',
 ARRAY['Business process-AI mapping', 'Requirements traceability', 'Sociotechnical analysis documentation']),

-- PM-12: Insider Threat Program
('MANAGE 2.4', 'pm-12', 'Partial',
 'PM-12 insider threat program supports AI system protection by identifying and mitigating risks from authorized personnel who may misuse or tamper with AI systems. Addresses insider threat detection but not AI-specific disengagement criteria.',
 'Extend the insider threat program to cover AI-specific risks including unauthorized model modification, training data manipulation, and misuse of AI system capabilities by authorized users. Monitor for anomalous AI system access patterns that may indicate insider threats.',
 ARRAY['Insider threat program documentation', 'AI access monitoring configurations', 'Behavioral analysis records']),

-- PM-13: Security and Privacy Workforce
('GOVERN 2.1', 'pm-13', 'Strong',
 'PM-13 workforce development directly supports AI risk management role definition by establishing competency requirements and development programs for security and privacy personnel. Core control for building organizational AI governance capability.',
 'Include AI risk management competencies in security and privacy workforce development plans. Define role-specific AI knowledge requirements for security analysts, privacy officers, risk managers, and compliance personnel.',
 ARRAY['Workforce development plans', 'Competency framework documentation', 'Role-specific requirements']),

('GOVERN 2.2', 'pm-13', 'Strong',
 'PM-13 workforce planning directly addresses AI skill requirements by ensuring the organization can recruit, develop, and retain personnel with AI risk management expertise. Addresses workforce capability but not specific training content.',
 'Identify AI-specific competencies needed in the security and privacy workforce including machine learning fundamentals, AI bias assessment, AI security testing, and AI privacy engineering. Develop career pathways that include AI specialization tracks.',
 ARRAY['Workforce plans', 'AI competency definitions', 'Career pathway documentation']),

('GOVERN 3.2', 'pm-13', 'Strong',
 'PM-13 workforce development directly supports establishment of roles for human-AI oversight by training personnel to understand and oversee AI system operations. Core control for building human oversight capability.',
 'Develop AI literacy and AI risk management training curricula for personnel who oversee AI systems. Include training on AI system monitoring, output interpretation, override procedures, and escalation criteria for AI system anomalies.',
 ARRAY['Training curricula', 'AI literacy programs', 'Oversight training records']),

-- PM-14: Testing, Training, and Monitoring
('MEASURE 1.1', 'pm-14', 'Strong',
 'PM-14 testing and monitoring directly supports selection of AI measurement approaches by establishing the organizational framework for testing and continuous monitoring activities. Core control for AI TEVV program structure.',
 'Include AI system testing in the organizational testing strategy covering accuracy evaluation, fairness assessment, adversarial robustness testing, and privacy compliance verification. Define AI-specific test types and their required frequency.',
 ARRAY['Testing strategy documents', 'AI test type definitions', 'Test schedule records']),

('MEASURE 1.2', 'pm-14', 'Strong',
 'PM-14 testing programs validate AI measurement methods by providing the framework for evaluating whether AI-specific tests produce meaningful and actionable results. Addresses testing program effectiveness but not specific metric definitions.',
 'Test AI-specific measurement tools and evaluation processes for accuracy and reliability. Validate that AI fairness metrics, accuracy benchmarks, and safety tests produce results that correlate with real-world AI system performance.',
 ARRAY['Test validation reports', 'Measurement tool assessments', 'Correlation analysis records']),

('MEASURE 1.3', 'pm-14', 'Partial',
 'PM-14 monitoring supports ongoing AI measurement through the organizational continuous monitoring framework. Addresses monitoring infrastructure but not the specific involvement of independent assessors.',
 'Include AI performance metrics, fairness indicators, and safety measures in continuous monitoring programs. Define monitoring thresholds and alerting criteria specific to AI system operational requirements.',
 ARRAY['Monitoring configuration records', 'AI metric definitions', 'Threshold documentation']),

('MEASURE 4.1', 'pm-14', 'Strong',
 'PM-14 testing validates AI measurement program effectiveness by providing empirical evidence of whether measurement approaches detect actual AI risks. Core verification mechanism for AI governance programs.',
 'Assess whether AI testing achieves measurement objectives by correlating test findings with post-deployment performance observations. Evaluate whether AI monitoring alerts correspond to genuine risk events or produce excessive false positives.',
 ARRAY['Test effectiveness reports', 'False positive analysis', 'Measurement-outcome correlation records']),

-- PM-15: Security and Privacy Groups and Associations
('GOVERN 5.1', 'pm-15', 'Partial',
 'PM-15 engagement with security groups supports collection of external feedback on AI risks by connecting the organization with professional communities and standards bodies. Addresses community engagement but not structured feedback integration.',
 'Participate in AI safety, governance, and responsible AI professional communities to stay current on emerging AI risks, best practices, and regulatory developments. Share organizational AI governance experiences with peer organizations.',
 ARRAY['Membership records', 'Meeting participation logs', 'Community engagement documentation']),

('GOVERN 5.2', 'pm-15', 'Partial',
 'PM-15 professional associations support incorporation of external AI expertise by maintaining relationships with standards organizations and industry groups. Addresses external awareness but not structured feedback adjudication.',
 'Monitor AI governance standards, guidelines, and frameworks from industry groups, standards bodies, and regulatory agencies. Integrate relevant external guidance into organizational AI risk management practices.',
 ARRAY['Standards monitoring records', 'Guidance adoption documentation', 'External input tracking']),

-- PM-16: Threat Awareness Program
('MAP 3.1', 'pm-16', 'Partial',
 'PM-16 threat awareness supports examination of AI system benefits and risks by maintaining organizational awareness of the current threat landscape. Addresses threat context but not AI-specific benefit analysis.',
 'Include AI-specific threats in the threat awareness program such as adversarial ML attacks, model inversion, data poisoning, and prompt injection. Maintain awareness of evolving AI attack techniques and their relevance to organizational AI deployments.',
 ARRAY['Threat awareness briefings', 'AI threat intelligence reports', 'Attack technique documentation']),

('MAP 3.3', 'pm-16', 'Partial',
 'PM-16 threat awareness supports AI application scope specification by providing context on what threats the organization faces when deploying AI systems. Addresses threat context but not scope determination decisions.',
 'Disseminate AI attack technique information to stakeholders including development teams, operations staff, and business owners. Use threat awareness to inform decisions about AI system scope and deployment boundaries.',
 ARRAY['Threat dissemination records', 'Stakeholder briefings', 'Scope decision documentation']),

-- PM-18: Privacy Program Plan
('GOVERN 1.1', 'pm-18', 'Partial',
 'PM-18 privacy program plan supports AI risk management policies by establishing the organizational privacy framework within which AI data handling practices operate. Addresses privacy program structure but not AI-specific risk management.',
 'Reference AI data handling requirements in the privacy program plan including training data privacy, inference data protection, and AI-generated personal data governance. Ensure AI privacy practices align with the broader organizational privacy program.',
 ARRAY['Privacy program plan', 'AI privacy practice documentation']),

('MEASURE 2.10', 'pm-18', 'Partial',
 'PM-18 privacy program plan supports AI privacy risk examination by establishing the organizational framework for privacy risk management. Addresses program-level privacy planning but not AI-specific privacy risk assessment methodology.',
 'Integrate AI privacy risk assessment into the privacy program plan. Define how AI-specific privacy risks (training data exposure, model memorization, inference privacy) are identified, assessed, and mitigated within the privacy program.',
 ARRAY['Privacy program plan', 'AI privacy risk integration documentation']),

-- PM-19: Privacy Program Leadership Role
('GOVERN 2.1', 'pm-19', 'Partial',
 'PM-19 privacy program leadership supports AI governance accountability by establishing a designated official responsible for privacy who can oversee AI privacy practices. Addresses privacy leadership but not the full breadth of AI risk management roles.',
 'Ensure the designated privacy official has visibility into and authority over AI data handling practices. Include AI privacy oversight in the privacy program leadership role responsibilities.',
 ARRAY['Role descriptions', 'Privacy leadership appointment documentation']),

-- PM-20: Dissemination of Privacy Program Information
('GOVERN 5.1', 'pm-20', 'Strong',
 'PM-20 privacy information dissemination directly supports collection of external feedback by communicating AI data processing practices to the public. Core transparency control that enables stakeholder awareness and feedback on AI privacy practices.',
 'Communicate AI data processing practices to stakeholders and the public including what personal data AI systems collect, how it is used for training and inference, and what privacy protections are in place. Provide accessible privacy information for AI-affected individuals.',
 ARRAY['Privacy notices', 'AI data processing disclosures', 'Public communication records']),

('MANAGE 4.3', 'pm-20', 'Strong',
 'PM-20 privacy dissemination directly supports AI accountability reporting by requiring publication of privacy program information including AI-related data practices. Ensures affected communities can understand how AI systems handle their data.',
 'Publish AI system privacy impact information including data collection scope, processing purposes, retention periods, and individual rights mechanisms. Maintain accessible channels for affected communities to learn about and respond to AI data practices.',
 ARRAY['Privacy impact publications', 'Community information channels', 'Accessibility documentation']),

-- PM-21: Accounting of Disclosures
('GOVERN 1.4', 'pm-21', 'Partial',
 'PM-21 accounting of disclosures supports transparent AI data governance by tracking when and how personal data processed by AI systems is shared with external parties. Addresses disclosure tracking but not comprehensive AI risk management documentation.',
 'Track disclosures of personal data processed by AI systems to external parties including data sharing for model training, inference results shared with partners, and AI-generated personal data provided to third parties.',
 ARRAY['Disclosure accounting records', 'AI data sharing logs', 'Third-party transfer documentation']),

-- PM-22: PII Quality Management
('MAP 1.1', 'pm-22', 'Strong',
 'PM-22 PII quality management directly supports understanding of AI training data context by ensuring personal data used in AI systems is accurate, relevant, timely, and complete. Core data quality control for AI systems that process personal data.',
 'Ensure PII accuracy in datasets used for AI training and evaluation through systematic quality assessment processes. Implement data quality pipelines that validate PII fields before incorporation into AI training sets.',
 ARRAY['Data quality assessment reports', 'PII validation records', 'Quality pipeline configurations']),

('MEASURE 2.1', 'pm-22', 'Strong',
 'PM-22 PII quality supports AI fairness and bias measurement by ensuring the underlying personal data is reliable enough to detect and measure discriminatory patterns. Data quality issues in PII can mask or introduce bias in AI systems.',
 'Assess whether PII quality issues affect AI model fairness by correlating data quality metrics with fairness evaluation outcomes. Track PII quality improvements and measure their impact on AI model bias reduction over time.',
 ARRAY['Fairness-quality correlation reports', 'Bias assessment records', 'Quality improvement tracking']),

-- PM-23: Data Governance Body
('GOVERN 2.1', 'pm-23', 'Strong',
 'PM-23 data governance body directly supports AI risk management role definition by establishing an organizational body responsible for data governance decisions that affect AI systems. Core governance structure for AI data oversight.',
 'Include AI data governance in the data governance body''s charter covering training data approval, data quality standards for AI use, and data retention policies for AI artifacts. Ensure the body includes members with AI expertise.',
 ARRAY['Data governance charter', 'Body membership records', 'AI data governance decisions']),

('GOVERN 2.3', 'pm-23', 'Partial',
 'PM-23 data governance body supports executive responsibility for AI data decisions by establishing a formal body that can escalate data governance issues affecting AI systems to leadership. Addresses governance structure but not individual executive accountability.',
 'Ensure the data governance body has escalation authority to executive leadership for AI data decisions with significant risk implications. Define decision thresholds that require executive-level approval for AI training data sourcing and use.',
 ARRAY['Escalation procedures', 'Decision threshold documentation', 'Executive engagement records']),

-- PM-24: Data Integrity Board
('MEASURE 2.1', 'pm-24', 'Partial',
 'PM-24 data integrity board supports AI TEVV documentation by providing organizational oversight of data matching and integrity activities that affect AI training data quality. Addresses data integrity oversight but not the full TEVV process.',
 'Engage the data integrity board in review of AI training data matching, linking, and augmentation activities. Ensure data integrity standards are applied to AI data preparation pipelines where personal data is combined or enriched.',
 ARRAY['Data integrity board records', 'AI data review documentation', 'Integrity standard application records']),

-- PM-25: Minimization of PII in Testing, Training, and Research
('MAP 1.1', 'pm-25', 'Strong',
 'PM-25 PII minimization directly applies to AI training data by requiring organizations to minimize the use of personal data in testing, training, and research activities. Core privacy-by-design control for AI data preparation.',
 'Minimize PII in AI training, testing, and research datasets by applying de-identification, synthetic data generation, and data subsetting techniques. Use the minimum personal data necessary to achieve AI model performance objectives.',
 ARRAY['Data minimization records', 'De-identification documentation', 'Synthetic data usage records']),

('GOVERN 1.4', 'pm-25', 'Partial',
 'PM-25 PII minimization supports transparent AI privacy governance by requiring documented policies for minimizing personal data in AI development activities. Addresses privacy documentation but not comprehensive AI risk transparency.',
 'Reference data minimization requirements in AI data governance policies. Document minimization decisions including what techniques were applied, what data remains, and why the retained data is necessary for AI model effectiveness.',
 ARRAY['Minimization policy documents', 'Decision documentation', 'Necessity justification records']),

('MEASURE 2.10', 'pm-25', 'Strong',
 'PM-25 PII minimization directly addresses AI privacy risk by reducing the volume of personal data exposed through AI systems. Core privacy risk reduction control for AI development and evaluation activities.',
 'Evaluate PII minimization effectiveness as a primary privacy risk metric for AI development activities. Measure the ratio of personal to non-personal data in AI training sets and track minimization improvement over model development iterations.',
 ARRAY['Minimization effectiveness reports', 'Privacy risk metrics', 'Iteration tracking records']),

-- PM-26: Complaint Management
('MANAGE 4.2', 'pm-26', 'Strong',
 'PM-26 complaint management directly supports continual AI improvement by providing a structured process for receiving, tracking, and resolving complaints about AI system behavior. Core feedback mechanism for AI accountability.',
 'Include AI-related complaints in the organizational complaint management process covering discriminatory outputs, privacy violations, inaccurate predictions, and other AI system harms. Define AI-specific complaint categories and routing procedures.',
 ARRAY['Complaint tracking records', 'AI complaint category definitions', 'Resolution documentation']),

('MANAGE 4.3', 'pm-26', 'Strong',
 'PM-26 complaint management directly supports AI accountability by ensuring incidents and errors reported by affected communities are tracked, investigated, and resolved. Core control for community-responsive AI governance.',
 'Report AI complaint trends, resolution rates, and corrective actions to stakeholders and affected communities. Use complaint data to identify systemic AI issues that require system-level remediation rather than case-by-case resolution.',
 ARRAY['Complaint trend reports', 'Systemic issue documentation', 'Corrective action records']),

('MEASURE 3.3', 'pm-26', 'Strong',
 'PM-26 complaint management directly supports establishment of feedback processes for end users to report problems and appeal AI system outcomes. Core mechanism for community feedback integration into AI evaluation.',
 'Establish accessible complaint channels for AI system users and affected individuals including online forms, phone lines, and in-person options. Integrate complaint data into AI system evaluation metrics to measure real-world impact.',
 ARRAY['Complaint channel documentation', 'Evaluation integration records', 'Accessibility assessments']),

-- PM-27: Privacy Reporting
('GOVERN 5.2', 'pm-27', 'Strong',
 'PM-27 privacy reporting directly supports mechanisms for incorporating feedback into AI governance by providing structured reporting on privacy program activities including AI data practices. Core transparency control for AI privacy accountability.',
 'Include AI system privacy metrics in organizational privacy reporting covering AI data processing volumes, privacy incident counts, de-identification effectiveness, and compliance status. Report on AI-specific privacy improvements and remaining gaps.',
 ARRAY['Privacy reports', 'AI privacy metric dashboards', 'Improvement tracking records']),

('MANAGE 4.3', 'pm-27', 'Strong',
 'PM-27 privacy reporting directly supports AI accountability by requiring periodic reporting on privacy program activities including AI-related privacy incidents and mitigations. Ensures organizational transparency about AI privacy practices.',
 'Report AI-related privacy incidents, investigation outcomes, and remediation actions through organizational privacy reporting channels. Include AI-specific privacy risk trends in reports to enable informed governance decisions.',
 ARRAY['Privacy incident reports', 'Trend analysis documentation', 'Governance decision records']),

-- PM-28: Risk Framing
('GOVERN 1.1', 'pm-28', 'Direct',
 'PM-28 risk framing directly establishes the organizational context for AI risk management by defining assumptions, constraints, risk tolerances, and priorities that guide all AI risk decisions. Core strategic control that shapes the AI risk management approach.',
 'Frame AI risks within organizational risk tolerance and assumptions including acceptable levels of AI prediction error, fairness thresholds, privacy exposure limits, and safety requirements. Define constraints that bound AI risk acceptance decisions.',
 ARRAY['Risk framing documentation', 'AI risk tolerance definitions', 'Constraint specifications']),

('MAP 1.4', 'pm-28', 'Direct',
 'PM-28 risk framing directly supports definition of AI business value and context by establishing the organizational risk perspective within which AI investments and deployments are evaluated. Core control for contextualizing AI benefits and risks.',
 'Use risk framing to scope AI risk assessments and define priorities for AI governance investment. Establish risk categories specific to AI systems and their relative importance within the organizational risk hierarchy.',
 ARRAY['Risk framing documentation', 'AI risk category definitions', 'Priority ranking records']),

('MAP 1.5', 'pm-28', 'Partial',
 'PM-28 risk framing supports documentation of organizational risk tolerances for AI by establishing the broader risk context within which AI-specific tolerances are set. Addresses framing but not the specific tolerance determination.',
 'Frame AI benefits and risks in organizational context to support balanced risk tolerance decisions. Use risk framing to ensure AI risk acceptance decisions account for both potential benefits and potential harms across stakeholder groups.',
 ARRAY['Risk framing documentation', 'Benefit-risk analysis records', 'Stakeholder impact assessments']),

-- PM-29: Risk Management Program Leadership Roles
('GOVERN 2.1', 'pm-29', 'Strong',
 'PM-29 risk management leadership directly supports AI governance role definition by establishing senior leadership positions with explicit risk management responsibilities. Core control for ensuring AI risk management has executive sponsorship.',
 'Include AI risk management in senior leadership responsibilities with clear authority for AI risk decisions. Define how AI risk management leadership roles interact with security, privacy, and business leadership.',
 ARRAY['Leadership role descriptions', 'Organizational charts', 'Responsibility matrices']),

('GOVERN 2.3', 'pm-29', 'Strong',
 'PM-29 risk management roles directly support executive accountability for AI risk decisions by establishing clear leadership ownership. Ensures AI deployment and operational risk decisions have identifiable executive owners.',
 'Define accountability for AI risk management decisions at the executive level including who approves AI deployment, who accepts AI residual risks, and who is responsible for AI incident response authority. Document decision delegation limits.',
 ARRAY['Accountability documentation', 'Decision authority records', 'Delegation documentation']),

-- PM-30: Supply Chain Risk Management Strategy
('MAP 3.4', 'pm-30', 'Direct',
 'PM-30 supply chain risk management strategy directly applies to AI supply chain governance by establishing the organizational approach to identifying, assessing, and managing supply chain risks for AI components. Core strategic control for AI procurement and vendor management.',
 'Address AI model and data supply chain risks in the SCRM strategy including foundation model provider dependencies, training data sourcing risks, and open-source ML library vulnerability management. Define supply chain risk acceptance criteria specific to AI components.',
 ARRAY['SCRM strategy documents', 'AI supply chain risk assessments', 'Acceptance criteria records']),

('MAP 3.5', 'pm-30', 'Strong',
 'PM-30 SCRM strategy supports AI third-party risk management by providing the strategic framework for managing risks from external AI components and services. Addresses strategic planning but not operational control implementation.',
 'Include AI vendor and model provider risks in supply chain strategy covering single-source dependency, vendor lock-in, model deprecation, and data provider reliability. Define strategic approaches for managing AI supply chain concentration risk.',
 ARRAY['SCRM strategy documents', 'Vendor risk analysis', 'Concentration risk assessments']),

-- PM-31: Continuous Monitoring Strategy
('MEASURE 3.1', 'pm-31', 'Strong',
 'PM-31 continuous monitoring strategy directly supports identification and tracking of AI risks by establishing the organizational framework for ongoing system observation. Core strategic control for AI operational monitoring.',
 'Include AI system metrics in the continuous monitoring strategy covering model performance indicators, fairness metrics, safety measures, and security telemetry. Define monitoring frequency, thresholds, and response procedures specific to AI systems.',
 ARRAY['Monitoring strategy documents', 'AI metric definitions', 'Response procedure documentation']),

('MEASURE 3.2', 'pm-31', 'Strong',
 'PM-31 monitoring strategy supports AI risk tracking where measurement techniques are limited by establishing continuous observation as an alternative to formal measurement. Addresses monitoring-based risk tracking for emerging AI risks.',
 'Define continuous monitoring triggers for AI measurement recalibration including model retraining events, data distribution changes, and regulatory requirement updates. Use monitoring data to identify when AI risk measurement approaches need updating.',
 ARRAY['Recalibration trigger definitions', 'Monitoring-measurement linkage documentation']),

('MANAGE 4.1', 'pm-31', 'Strong',
 'PM-31 continuous monitoring directly supports post-deployment AI monitoring by providing the organizational strategy and infrastructure for ongoing system observation. Core enabler for AI incident detection and performance tracking.',
 'Configure AI-specific continuous monitoring indicators including model accuracy trends, prediction confidence distributions, input data quality scores, and adversarial detection alerts. Integrate AI monitoring into the organizational monitoring architecture.',
 ARRAY['Monitoring configuration records', 'AI indicator definitions', 'Architecture integration documentation']),

-- PM-32: Purposing
('MAP 2.1', 'pm-32', 'Direct',
 'PM-32 purposing directly defines intended AI system uses by requiring documentation of authorized processing purposes for personal data and system components. Core control for ensuring AI systems are used only for documented and approved purposes.',
 'Document authorized purposes for AI system deployment and use including specific use cases, approved data processing activities, and prohibited applications. Maintain purpose specifications that clearly define the boundaries of AI system operation.',
 ARRAY['Purpose specification documents', 'Authorized use documentation', 'Boundary definitions']),

('MAP 2.2', 'pm-32', 'Direct',
 'PM-32 purposing directly supports documentation of AI system knowledge limits by defining the scope within which AI systems are authorized to operate. Core control for establishing and communicating AI system boundaries.',
 'Define boundaries for AI system operation and decision-making scope based on documented purposes. Communicate purpose limitations to users and stakeholders to ensure AI systems are not relied upon for unauthorized or out-of-scope applications.',
 ARRAY['Purpose boundary documentation', 'User communication records', 'Scope limitation disclosures']),

('MAP 3.3', 'pm-32', 'Partial',
 'PM-32 purposing supports targeted application scope specification by providing the policy basis for limiting AI system use to documented purposes. Addresses purpose documentation but not the technical enforcement of scope restrictions.',
 'Align AI system purpose specifications with documented capabilities and validated performance ranges. Use purposing documentation to define the boundaries within which AI system outputs should be trusted and acted upon.',
 ARRAY['Purpose-capability alignment records', 'Performance validation documentation'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
