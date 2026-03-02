-- NIST AI Risk Management Framework 1.0 — Subcategories (72 total)
-- Source: NIST AI 100-1 (January 2023)

INSERT INTO ai_rmf_subcategories (subcategory_id, category_id, description) VALUES

-- GOVERN 1 (7 subcategories)
('GOVERN 1.1', 'GOVERN 1',
 'Policies, processes, procedures, and practices across the organization related to the mapping, measuring, and managing of AI risks are in place, transparent, and implemented effectively.'),
('GOVERN 1.2', 'GOVERN 1',
 'The characteristics of trustworthy AI are integrated into organizational policies, processes, procedures, and practices.'),
('GOVERN 1.3', 'GOVERN 1',
 'Organizational risk management policies and procedures are established; organizational risk tolerance is determined and communicated through organizational policies.'),
('GOVERN 1.4', 'GOVERN 1',
 'Organizational teams document the risk management process and its outcomes through policies, processes, and procedures established at the organizational level.'),
('GOVERN 1.5', 'GOVERN 1',
 'Ongoing monitoring and periodic review of the risk management process and its outcomes are planned and organizational roles and responsibilities clearly defined, including determinations about whether the AI system should be modified, retrained, continue current operations, or be decommissioned.'),
('GOVERN 1.6', 'GOVERN 1',
 'Mechanisms to inventory AI systems are in place and include accountability for the AI system throughout its lifecycle.'),
('GOVERN 1.7', 'GOVERN 1',
 'Processes and procedures are in place for decommissioning and phasing out AI systems safely and in a manner that does not create downstream risks or harms.'),

-- GOVERN 2 (3 subcategories)
('GOVERN 2.1', 'GOVERN 2',
 'Roles and responsibilities and organizational accountabilities for AI risk management are documented and clearly communicated.'),
('GOVERN 2.2', 'GOVERN 2',
 'The organization''s personnel and partners receive AI risk management training to enable them to perform their duties and responsibilities consistent with related policies, procedures, norms, and organizational risk tolerance.'),
('GOVERN 2.3', 'GOVERN 2',
 'Executive leadership of the organization takes responsibility for decisions about risks associated with AI system development and deployment.'),

-- GOVERN 3 (2 subcategories)
('GOVERN 3.1', 'GOVERN 3',
 'AI risk management activities and documentation convey the level and nature of risk to all relevant organizational personnel to support risk-informed decisions and better equip them to act on those decisions.'),
('GOVERN 3.2', 'GOVERN 3',
 'Policies and procedures are in place to define and differentiate roles and responsibilities for human-AI configurations, and for oversight of AI systems.'),

-- GOVERN 4 (3 subcategories)
('GOVERN 4.1', 'GOVERN 4',
 'Organizational policies and practices are in place to foster a critical thinking and safety-first mindset in the design, development, deployment, and uses of AI systems to minimize potential negative impacts.'),
('GOVERN 4.2', 'GOVERN 4',
 'Organizational teams document the risks and potential impacts of the AI technology they design, develop, deploy, evaluate, and use, and communicate about the impacts more broadly.'),
('GOVERN 4.3', 'GOVERN 4',
 'Organizational practices are in place to enable AI testing, identification of incidents, and information sharing.'),

-- GOVERN 5 (2 subcategories)
('GOVERN 5.1', 'GOVERN 5',
 'Organizational policies and practices are in place to collect, consider, prioritize, and integrate feedback from those external to the team that developed or deployed the AI system regarding the potential individual and societal impacts related to AI risks.'),
('GOVERN 5.2', 'GOVERN 5',
 'Mechanisms are established to enable the team that developed or deployed AI systems to regularly incorporate adjudicated feedback from relevant AI actors into system design and implementation.'),

-- GOVERN 6 (2 subcategories)
('GOVERN 6.1', 'GOVERN 6',
 'Policies and procedures are in place that address AI risks associated with third-party entities, including risks of infringement of a third-party''s intellectual property or other rights.'),
('GOVERN 6.2', 'GOVERN 6',
 'Contingency processes are in place to handle failures or disruptions in third-party data or AI systems deemed to be high-risk.'),

-- MAP 1 (6 subcategories)
('MAP 1.1', 'MAP 1',
 'Intended purposes, potentially beneficial uses, context-specific laws, norms and expectations, and prospective settings in which the AI system will be deployed are understood and documented. Consideration is given to the broader downstream ecosystem including deployment context and potential impacts on individuals, groups, communities, organizations, and society.'),
('MAP 1.2', 'MAP 1',
 'Interdisciplinary AI actors, competencies, skills, and capacities for establishing context reflect demographic diversity and broad domain and user experience expertise, and their participation is documented. Opportunities for interdisciplinary collaboration are prioritized.'),
('MAP 1.3', 'MAP 1',
 'The organization''s mission and relevant goals and priorities are understood and documented. Consideration is given to how AI system development aligns with these goals and priorities.'),
('MAP 1.4', 'MAP 1',
 'The business value or context in which the AI system will be used is clearly defined or, if not, the potential for adverse consequences is communicated to relevant organizational risk management personnel and documented.'),
('MAP 1.5', 'MAP 1',
 'Organizational risk tolerances are determined and documented.'),
('MAP 1.6', 'MAP 1',
 'System requirements (e.g., target demographics, stakeholder feedback, system use) are elicited and understood. Design decisions take sociotechnical implications into account to address AI risks.'),

-- MAP 2 (3 subcategories)
('MAP 2.1', 'MAP 2',
 'The specific tasks and methods used to implement the AI system (e.g., classifier, language model, recommender system, agent) and its components (e.g., computer vision, NLP, planning, ML) are documented.'),
('MAP 2.2', 'MAP 2',
 'Scientific understanding of the AI system''s knowledge limits and how system outputs may be affected is documented. Restrictions on system use are identified.'),
('MAP 2.3', 'MAP 2',
 'Scientific findings and established knowledge about AI system''s capabilities and limitations are taken into account, and AI system TEVV (Test, Evaluation, Validation, and Verification) considerations are identified.'),

-- MAP 3 (5 subcategories)
('MAP 3.1', 'MAP 3',
 'Potential benefits of intended AI system functionality and performance are examined and documented.'),
('MAP 3.2', 'MAP 3',
 'Potential costs, including non-monetary costs, associated with AI system failures, errors, and suboptimal performance are examined and documented.'),
('MAP 3.3', 'MAP 3',
 'Targeted application scope is specified and documented based on the system''s capabilities, established limitations, and organizational risk tolerance.'),
('MAP 3.4', 'MAP 3',
 'Processes for operator and practitioner proficiency with AI system performance and trustworthiness — and relevant technical standards and certifications — are in place, followed, and documented.'),
('MAP 3.5', 'MAP 3',
 'Processes for human oversight are defined, and artificial intelligence human oversight is implemented based on the defined processes for human oversight of AI and per organizational policies.'),

-- MAP 4 (2 subcategories)
('MAP 4.1', 'MAP 4',
 'Approaches for mapping AI technology and legal risks of its components — including the use of third-party data or software — are in place, followed, and documented, as are risks of infringement of a third-party''s intellectual property or other rights.'),
('MAP 4.2', 'MAP 4',
 'Internal risk controls for components of the AI system, including third-party AI technologies, are identified and documented.'),

-- MAP 5 (2 subcategories)
('MAP 5.1', 'MAP 5',
 'Likelihood and magnitude of each identified impact (both potentially beneficial and harmful) based on expected use, past uses of AI systems in similar contexts, public incident reports, feedback from those external to the team that developed or deployed the AI system, or other data are identified and documented.'),
('MAP 5.2', 'MAP 5',
 'Practices and personnel for supporting regular engagement with relevant AI actors and integrating feedback about positive, negative, and unanticipated impacts are in place and documented.'),

-- MEASURE 1 (3 subcategories)
('MEASURE 1.1', 'MEASURE 1',
 'Approaches and metrics for measurement of AI risks are selected for implementation starting with the most significant AI risks. The risks or trustworthiness characteristics that will not — or cannot — be measured are properly documented.'),
('MEASURE 1.2', 'MEASURE 1',
 'Appropriateness of AI metrics and effectiveness of existing controls are regularly assessed and updated, including reports of errors and impacts on affected communities.'),
('MEASURE 1.3', 'MEASURE 1',
 'Internal experts who did not serve as front-line developers for the system and/or independent assessors are involved in regular assessments and updates. Domain experts, users, and potentially affected communities are consulted in support of assessments as feasible.'),

-- MEASURE 2 (13 subcategories)
('MEASURE 2.1', 'MEASURE 2',
 'Test sets, metrics, and details about the tools used during test, evaluation, validation, and verification (TEVV) are documented.'),
('MEASURE 2.2', 'MEASURE 2',
 'Evaluations involving human subjects meet applicable requirements (e.g., informed consent) and are representative of the relevant population.'),
('MEASURE 2.3', 'MEASURE 2',
 'AI system performance or assurance criteria are measured qualitatively or quantitatively and demonstrated for conditions similar to deployment setting(s). Measures are documented.'),
('MEASURE 2.4', 'MEASURE 2',
 'The functionality and behavior of the AI system and its components — as identified in the MAP function — are monitored when in production.'),
('MEASURE 2.5', 'MEASURE 2',
 'The AI system to be deployed either (1) has been demonstrated to be valid and reliable through systematic TEVV activities, or (2) is being deployed in a manner that reduces risk if the AI system does not perform as intended. Limitations of the AI system identified in TEVV are documented.'),
('MEASURE 2.6', 'MEASURE 2',
 'The risk or impact associated with the AI system being safe is examined and evaluated, and the AI system is demonstrated to be safe.'),
('MEASURE 2.7', 'MEASURE 2',
 'AI system security and resilience — as identified in the MAP function — are evaluated and documented.'),
('MEASURE 2.8', 'MEASURE 2',
 'Risks associated with transparency and accountability — as identified in the MAP function — are examined and documented.'),
('MEASURE 2.9', 'MEASURE 2',
 'The AI model is explained, validated, and documented, and AI system output is interpreted within its context — as identified in the MAP function — to inform responsible use and governance.'),
('MEASURE 2.10', 'MEASURE 2',
 'Privacy risk of the AI system — as identified in the MAP function — is examined and documented.'),
('MEASURE 2.11', 'MEASURE 2',
 'Fairness and bias — as identified in the MAP function — are evaluated or documented.'),
('MEASURE 2.12', 'MEASURE 2',
 'Environmental impact and sustainability of AI model training and management activities — as identified in the MAP function — are assessed and documented.'),
('MEASURE 2.13', 'MEASURE 2',
 'Effectiveness of the employed TEVV metrics and processes in the MEASURE function are evaluated and documented.'),

-- MEASURE 3 (3 subcategories)
('MEASURE 3.1', 'MEASURE 3',
 'Approaches for identifying and tracking existing, unanticipated, and emergent AI risks are in place.'),
('MEASURE 3.2', 'MEASURE 3',
 'Risk tracking approaches are considered for settings where AI risks are difficult to assess using currently available measurement techniques or where metrics are not yet available.'),
('MEASURE 3.3', 'MEASURE 3',
 'Feedback processes for end users and impacted communities to report problems and appeal system outcomes are established and integrated into AI system evaluation metrics.'),

-- MEASURE 4 (3 subcategories)
('MEASURE 4.1', 'MEASURE 4',
 'Measurement approaches for identifying AI risks are connected to organizational risk management policies and processes and informed by organizational risk tolerance.'),
('MEASURE 4.2', 'MEASURE 4',
 'Measurement results regarding AI system trustworthiness in deployment context(s) and across the AI lifecycle are informed by input from domain experts and relevant AI actors to validate whether intended performance is achieved.'),
('MEASURE 4.3', 'MEASURE 4',
 'Measurable performance improvements or declines based on consultations with relevant AI actors including affected communities, and the resulting decisions, are identified and documented.'),

-- MANAGE 1 (4 subcategories)
('MANAGE 1.1', 'MANAGE 1',
 'A determination is made as to whether the AI system achieves its intended purposes and stated objectives and whether its development or deployment should proceed.'),
('MANAGE 1.2', 'MANAGE 1',
 'Treatment of documented AI risks is prioritized based on assessed likelihood, risk impact, and available resources or methods.'),
('MANAGE 1.3', 'MANAGE 1',
 'Responses to the identified and prioritized risks are developed, planned, and documented. Risk response options can include mitigating, transferring, avoiding, or accepting.'),
('MANAGE 1.4', 'MANAGE 1',
 'Negative residual risks (defined as the sum of all unmitigated risks) to both downstream acquirers of AI systems and end users are documented.'),

-- MANAGE 2 (4 subcategories)
('MANAGE 2.1', 'MANAGE 2',
 'Resources required to manage AI risks are taken into account — along with viable non-AI alternative systems, approaches, or methods — to reduce the magnitude or likelihood of potential impacts.'),
('MANAGE 2.2', 'MANAGE 2',
 'Mechanisms are in place and applied to sustain the value of deployed AI systems.'),
('MANAGE 2.3', 'MANAGE 2',
 'Procedures are followed to respond to and recover from any previously unknown risk that is identified.'),
('MANAGE 2.4', 'MANAGE 2',
 'Mechanisms are in place and applied, and responsibilities are assigned and understood, to supersede, disengage, or deactivate AI systems that demonstrate performance or outcomes inconsistent with intended use.'),

-- MANAGE 3 (2 subcategories)
('MANAGE 3.1', 'MANAGE 3',
 'AI risks and benefits from third-party resources are regularly monitored, and risk controls are applied and documented.'),
('MANAGE 3.2', 'MANAGE 3',
 'Pre-trained models which are used for development are monitored as part of AI system regular maintenance and assessments.'),

-- MANAGE 4 (3 subcategories)
('MANAGE 4.1', 'MANAGE 4',
 'Post-deployment AI system monitoring plans are implemented, including mechanisms for capturing and evaluating input from users and other relevant AI actors, appeal and override, decommissioning, incident response, recovery, and change management.'),
('MANAGE 4.2', 'MANAGE 4',
 'Measurable activities for continual improvements are integrated into AI system updates and include regular engagement with interested parties, including relevant AI actors.'),
('MANAGE 4.3', 'MANAGE 4',
 'Incidents and errors are communicated to relevant AI actors, including affected communities. Processes for tracking, responding to, and recovering from incidents and errors are followed and documented.');
