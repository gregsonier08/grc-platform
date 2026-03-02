-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — SA Family Crosswalk Mappings
-- Source: NIST AI 100-1 × NIST SP 800-53 Rev 5
-- 34 individual control mappings
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES
('GOVERN 1.1', 'sa-1', 'Supportive',
 'SA-1 system and services acquisition policy can incorporate AI-specific procurement and development requirements that support broader AI governance policies. Acquisition policy provides governance guardrails for AI system procurement.',
 'Extend SA-1 policy to include AI-specific acquisition requirements: mandatory AI risk assessment before procurement, AI vendor security requirements, and AI development lifecycle standards. Align acquisition policy with broader AI governance framework.',
 ARRAY['Acquisition policy', 'AI procurement requirements']),

('GOVERN 3.1', 'sa-16', 'Supportive',
 'SA-16 developer-provided training communicates the nature and limitations of AI systems to operational staff, supporting risk-informed decision-making. Training conveys the risk profile of AI systems to those who operate them.',
 'Require AI system developers to provide training that communicates AI system risk characteristics: known limitations, failure modes, appropriate use boundaries, and escalation procedures. Training should enable operators to make risk-informed decisions.',
 ARRAY['Developer training materials', 'Training delivery records', 'Training effectiveness assessment']),

('GOVERN 4.1', 'sa-3', 'Partial',
 'SA-3 system development lifecycle processes can institutionalize safety-first design practices for AI systems. SDLC requirements that mandate safety analysis at each stage support a safety-first organizational culture.',
 'Integrate safety-first AI requirements into SA-3 SDLC processes: require AI safety analysis at requirements, design, and implementation stages; mandate safety review gates before lifecycle phase transitions.',
 ARRAY['AI-adapted SDLC documentation', 'Safety review records', 'Phase gate criteria']),

('GOVERN 4.2', 'sa-3', 'Partial',
 'SA-3 SDLC documentation requirements create the mechanism for teams to document AI risks at each development phase. SDLC-embedded documentation practices support comprehensive AI risk documentation.',
 'Require SA-3 SDLC documentation to include AI risk documentation at each phase: risk identification in requirements, risk analysis in design, risk validation in testing. Document risks and communicate impacts to affected stakeholders.',
 ARRAY['SDLC risk documentation', 'Phase-specific risk records']),

('GOVERN 5.2', 'sa-4', 'Partial',
 'SA-4 acquisition process can include requirements for AI vendors and developers to incorporate stakeholder feedback mechanisms into AI system design. Procurement requirements can mandate feedback integration capabilities.',
 'Include feedback integration requirements in SA-4 AI system acquisition: require vendors to provide mechanisms for end user feedback, demonstrate how feedback influenced system design, and commit to post-deployment feedback incorporation.',
 ARRAY['Acquisition requirements', 'Vendor feedback capability documentation', 'Feedback integration evidence']),

('MAP 1.1', 'sa-3', 'Strong',
 'SA-3 system development lifecycle documentation directly captures the intended purposes and deployment context of AI systems. SDLC requirements mandate documentation of system objectives, scope, and operating environment.',
 'Use SA-3 SDLC documentation requirements to capture AI system intended purposes, deployment contexts, and stakeholder needs at the requirements phase. Document the broader ecosystem implications and downstream impacts as part of system context.',
 ARRAY['System requirements documentation', 'Context and purpose records', 'SDLC phase documentation']),

('MAP 1.1', 'sa-4', 'Partial',
 'SA-4 acquisition process documentation captures the intended uses and requirements for AI systems being procured. Acquisition documentation establishes the purpose and context basis for third-party AI systems.',
 'Include AI system purpose and context documentation in SA-4 acquisition packages: intended use cases, prohibited uses, deployment environment constraints, and expected performance standards. Require vendors to confirm alignment with documented purpose.',
 ARRAY['Acquisition documentation', 'System purpose records', 'Vendor confirmation']),

('MAP 1.2', 'sa-21', 'Supportive',
 'SA-21 developer screening ensures that personnel developing AI systems have appropriate backgrounds, contributing to the interdisciplinary competency requirements for AI risk management. Screening validates the human capital contributing to AI development.',
 'Apply SA-21 screening to AI development personnel: verify credentials for claimed AI expertise, identify personnel with relevant domain expertise, and document the interdisciplinary composition of AI development teams.',
 ARRAY['Developer screening records', 'Team composition documentation', 'Expertise verification']),

('MAP 1.2', 'sa-3', 'Supportive',
 'SA-3 SDLC processes can require identification and documentation of relevant stakeholder roles and interdisciplinary team composition. SDLC requirements can mandate broad participation in AI system development.',
 'Include interdisciplinary participation requirements in SA-3: require documentation of AI development team composition, identify gaps in domain expertise, and mandate engagement of domain specialists for high-impact AI systems.',
 ARRAY['Team composition documentation', 'Expertise gap analysis', 'Stakeholder engagement records']),

('MAP 1.3', 'sa-3', 'Partial',
 'SA-3 SDLC documentation captures the organizational mission context and strategic objectives that AI system development should align with. Mission alignment is a documented component of responsible SDLC practice.',
 'Require SA-3 documentation to include organizational mission alignment analysis: how the AI system supports mission objectives, which organizational goals it advances, and any mission conflicts or tensions. Document alignment rationale.',
 ARRAY['Mission alignment documentation', 'SDLC context records']),

('MAP 1.3', 'sa-4', 'Partial',
 'SA-4 acquisition process establishes the business requirements and organizational objectives that externally developed AI systems must meet. Acquisition documentation records the organizational context for third-party AI.',
 'Include organizational mission alignment requirements in SA-4 AI acquisitions: define how acquired AI systems must support organizational goals, require vendors to demonstrate alignment, and document mission fit in acquisition records.',
 ARRAY['Acquisition requirements', 'Mission alignment verification']),

('MAP 2.1', 'sa-5', 'Strong',
 'SA-5 system documentation requirements directly address documentation of AI system technical implementations, including the specific tasks, methods, and components. Comprehensive system documentation is the primary mechanism for capturing AI implementation specifics.',
 'Apply SA-5 documentation requirements specifically to AI system technical documentation: document model architecture, training methodology, inference infrastructure, data pipeline design, and component dependencies. Require documentation to capture AI-specific implementation choices.',
 ARRAY['System documentation', 'AI architecture documentation', 'Component specification records']),

('MAP 2.1', 'sa-3', 'Partial',
 'SA-3 SDLC processes require documentation of implementation decisions at each development phase. SDLC-phase documentation captures the specific methods and components chosen for AI system implementation.',
 'Integrate AI implementation documentation into SA-3 SDLC phases: capture model selection rationale at design phase, document implementation methodology at development phase, and record final implementation configuration at deployment.',
 ARRAY['SDLC phase documentation', 'Implementation decision records', 'Configuration documentation']),

('MAP 2.1', 'sa-10', 'Partial',
 'SA-10 developer configuration management maintains the authoritative record of AI system components and their configurations. Configuration management documentation captures the specific implementation at any point in time.',
 'Apply SA-10 configuration management to AI systems: maintain version-controlled records of model artifacts, hyperparameters, training data versions, and inference configuration. Configuration management provides the definitive record of AI system implementation.',
 ARRAY['Configuration management records', 'AI artifact versioning', 'Configuration baseline documentation']),

('MAP 2.1', 'sa-15', 'Partial',
 'SA-15 development process, standards, and tools documentation captures the methodology and tooling used to develop AI systems, which is a component of documenting the specific methods used to implement the AI system.',
 'Require SA-15 documentation to cover AI-specific development processes: data labeling methodology, model training procedures, evaluation frameworks, and deployment processes. Standards documentation should address AI development quality requirements.',
 ARRAY['Development process documentation', 'AI development standards', 'Tool inventory']),

('MAP 2.2', 'sa-5', 'Partial',
 'SA-5 system documentation requirements support documentation of AI system knowledge limits and operational restrictions. System documentation captures what the system can and cannot reliably do.',
 'Include AI system limitations documentation in SA-5 requirements: document known failure modes, performance boundaries, out-of-distribution behavior, and explicit use restrictions. System documentation should accurately characterize AI system limitations for operators.',
 ARRAY['System limitations documentation', 'Use restriction records', 'Known failure mode documentation']),

('MAP 2.2', 'sa-13', 'Partial',
 'SA-13 trustworthiness requirements specification documents the trustworthiness characteristics of AI systems, including their knowledge limits. Trustworthiness documentation captures the reliability boundaries of AI system capabilities.',
 'Apply SA-13 trustworthiness documentation to AI systems: specify confidence levels for AI outputs, document conditions under which trustworthiness claims do not hold, and characterize the basis for trustworthiness assertions.',
 ARRAY['Trustworthiness documentation', 'Confidence level specifications', 'Trustworthiness basis records']),

('MAP 2.2', 'sa-17', 'Partial',
 'SA-17 developer security and privacy architecture documentation captures design-level constraints that reflect AI system knowledge limits and operational boundaries. Architecture documentation includes the design decisions that define system scope.',
 'Require SA-17 to document AI system architectural boundaries that reflect knowledge limits: input domain constraints, output validity ranges, deployment context restrictions, and architectural decisions that limit system scope.',
 ARRAY['Architecture documentation', 'Design boundary records', 'Constraint documentation']),

('MAP 2.3', 'sa-11', 'Partial',
 'SA-11 developer testing and evaluation applies scientific methods to characterize AI system capabilities and limitations, which is foundational to considering scientific findings in TEVV. Developer testing produces empirical evidence about AI system behavior.',
 'Apply SA-11 developer testing to characterize AI system capabilities and limitations scientifically: conduct systematic performance benchmarking, edge case analysis, and capability boundary testing. Document findings as empirical evidence for TEVV considerations.',
 ARRAY['Developer test reports', 'Capability characterization', 'Benchmark results']),

('MAP 2.3', 'sa-13', 'Partial',
 'SA-13 trustworthiness analysis incorporates scientific understanding of AI system capabilities into trustworthiness claims. Trustworthiness documentation reflects the scientific basis for confidence in AI system performance.',
 'Require SA-13 trustworthiness claims to be grounded in scientific evidence: cite test results, validation studies, and empirical performance data as the basis for trustworthiness assertions. Document TEVV considerations that inform trustworthiness.',
 ARRAY['Evidence-based trustworthiness documentation', 'TEVV-grounded claims', 'Scientific basis records']),

('MAP 3.1', 'sa-3', 'Supportive',
 'SA-3 SDLC processes include benefit analysis and justification for system development that contributes to examining potential benefits of AI functionality. SDLC feasibility and justification documentation captures expected benefits.',
 'Include AI benefit analysis in SA-3 SDLC documentation: document expected functional benefits, performance improvements, and value creation. Benefit examination should be proportionate to investment and risk level.',
 ARRAY['Benefit analysis documentation', 'SDLC justification records']),

('MAP 3.4', 'sa-5', 'Partial',
 'SA-5 system documentation provides the reference materials needed for operator and practitioner proficiency with AI systems. Comprehensive documentation supports the training and operational procedures that build proficiency.',
 'Ensure SA-5 documentation for AI systems includes operator-focused content: operational procedures, performance interpretation guidance, anomaly recognition, and escalation procedures. Documentation should support practitioner proficiency development.',
 ARRAY['Operator documentation', 'Proficiency support materials', 'Training reference documentation']),

('MAP 3.4', 'sa-16', 'Partial',
 'SA-16 developer-provided training directly supports operator and practitioner proficiency with AI system performance. Developer training addresses the technical aspects of AI system operation that practitioners must understand.',
 'Require SA-16 training for AI systems to cover: system capabilities and limitations, performance interpretation, confidence level understanding, appropriate escalation, and known failure modes. Training should develop practitioner proficiency with AI-specific behaviors.',
 ARRAY['Developer training program', 'Proficiency training records', 'Training completion documentation']),

('MAP 3.5', 'sa-8', 'Partial',
 'SA-8 security and privacy engineering principles include design considerations for human oversight and control that support AI human oversight requirements. Engineering principles can mandate human-in-the-loop design patterns.',
 'Apply SA-8 engineering principles to AI human oversight design: require override capabilities, audit trails for AI decisions, human review checkpoints for high-consequence outputs, and graceful degradation to human decision-making.',
 ARRAY['Engineering principles documentation', 'Human oversight design records', 'Override capability specifications']),

('MAP 3.5', 'sa-17', 'Partial',
 'SA-17 developer security and privacy architecture documentation should capture the architectural design of human oversight mechanisms for AI systems. Architecture documentation specifies how human control is implemented.',
 'Require SA-17 to document AI human oversight architecture: human review workflow design, override mechanism architecture, monitoring dashboard design for human operators, and audit trail architecture for human accountability.',
 ARRAY['Architecture documentation', 'Human oversight architecture', 'Control mechanism design records']),

('MEASURE 2.1', 'sa-11', 'Strong',
 'SA-11 developer testing and evaluation directly addresses documentation of test sets, metrics, and evaluation tools used during TEVV. Developer testing is the primary process for creating and documenting AI system evaluation evidence.',
 'Apply SA-11 requirements to AI TEVV documentation: require developers to document all test sets with provenance, metrics with definitions and rationale, evaluation tools with versions and configurations, and test results with full traceability.',
 ARRAY['Developer test plan', 'Test set documentation', 'Metric specifications', 'Evaluation tool inventory', 'Test results']),

('MEASURE 2.3', 'sa-11', 'Strong',
 'SA-11 developer testing and evaluation is the mechanism for measuring AI system performance under conditions similar to deployment settings and demonstrating that performance meets assurance criteria.',
 'Require SA-11 testing to include deployment-representative conditions: test with data representative of production distribution, evaluate performance across the deployment environment range, and demonstrate performance against defined assurance criteria.',
 ARRAY['Deployment-representative test results', 'Assurance criteria verification', 'Performance measurement records']),

('MEASURE 2.5', 'sa-11', 'Strong',
 'SA-11 developer testing and evaluation produces the systematic TEVV evidence needed to demonstrate AI system validity and reliability. Developer testing is the core TEVV process that generates validity and reliability demonstrations.',
 'Structure SA-11 testing to systematically demonstrate AI system validity and reliability: conduct repeated testing for reliability estimation, test on held-out validation sets for validity, and document confidence bounds on performance claims.',
 ARRAY['Validity demonstration records', 'Reliability testing results', 'TEVV evidence package']),

('MEASURE 2.5', 'sa-13', 'Partial',
 'SA-13 trustworthiness requirements specify the reliability and validity criteria that AI systems must demonstrate, providing the standards against which SA-11 TEVV results are evaluated.',
 'Define SA-13 trustworthiness requirements that specify validity and reliability thresholds: minimum performance levels, acceptable confidence ranges, and validation conditions. Use these requirements as the criteria for SA-11 TEVV evaluation.',
 ARRAY['Trustworthiness requirements', 'Validity and reliability criteria', 'Requirements verification records']),

('MEASURE 2.9', 'sa-5', 'Partial',
 'SA-5 system documentation supports model explanation by providing the technical documentation needed to understand and interpret AI model behavior. Comprehensive documentation is a prerequisite for meaningful model explanation.',
 'Include model explanation documentation in SA-5 requirements: document model architecture decisions that affect interpretability, feature importance or contribution methods used, explanation interfaces available to operators, and known explanation limitations.',
 ARRAY['Model explanation documentation', 'Interpretability documentation', 'Explanation interface specification']),

('MEASURE 2.9', 'sa-17', 'Partial',
 'SA-17 developer architecture documentation captures the architectural choices that affect AI model explainability. Architecture documentation provides the foundation for understanding and explaining AI system design decisions.',
 'Require SA-17 to document AI model architecture decisions with explainability implications: model type selection rationale (interpretable vs. black-box tradeoffs), explanation mechanisms built into the architecture, and architectural constraints on explanation.',
 ARRAY['Architecture documentation', 'Explainability architecture', 'Design rationale records']),

('MANAGE 3.2', 'sa-10', 'Partial',
 'SA-10 developer configuration management maintains the version records for pre-trained models used in AI development, enabling monitoring of model dependencies as part of regular maintenance.',
 'Apply SA-10 configuration management to pre-trained model dependencies: track model versions, provider release notes, known issues, and update history. Configuration management records provide the basis for monitoring pre-trained model changes.',
 ARRAY['Model dependency records', 'Pre-trained model version tracking', 'Update history']),

('MANAGE 3.2', 'sa-22', 'Partial',
 'SA-22 unsupported system components requirements address the risk of pre-trained models that are no longer supported by their providers. Managing end-of-support for AI model dependencies is a component of ongoing monitoring.',
 'Apply SA-22 requirements to pre-trained model dependencies: identify models approaching end-of-support, assess risks of continued use, plan migration to supported alternatives, and document support status monitoring procedures.',
 ARRAY['Model support status records', 'End-of-support planning', 'Migration documentation']),

('MANAGE 4.3', 'sa-15', 'Supportive',
 'SA-15 development process documentation captures the processes for communicating development issues, which can include incident communication processes. Development process standards can mandate incident communication requirements.',
 'Include incident communication requirements in SA-15 development process standards for AI systems: define what constitutes a reportable incident, communication channels to relevant AI actors, response timelines, and documentation requirements.',
 ARRAY['Development process documentation', 'Incident communication standards', 'Communication procedure records']);

-- Total rows inserted: 34
