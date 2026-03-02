-- NIST AI Risk Management Framework 1.0 — Categories
-- Source: NIST AI 100-1 (January 2023)

INSERT INTO ai_rmf_categories (category_id, function_id, name, description) VALUES

-- GOVERN categories
('GOVERN 1', 'GOVERN', 'Policies, Processes, Procedures, and Practices',
 'Policies, processes, procedures, and practices across the organization related to the mapping, measuring, and managing of AI risks are in place, transparent, and implemented effectively.'),
('GOVERN 2', 'GOVERN', 'Accountability Structures',
 'Accountability structures are in place so that the appropriate teams and individuals are empowered, responsible, and trained for mapping, measuring, and managing AI risks.'),
('GOVERN 3', 'GOVERN', 'Workforce Diversity, Equity, Inclusion, and Accessibility',
 'Organizational teams are committed to a diverse, equitable, inclusive, and accessible workforce, and to the ongoing prioritization and improvement of workforce diversity, equity, inclusion, and accessibility for the AI lifecycle.'),
('GOVERN 4', 'GOVERN', 'Risk-Aware Organizational Culture',
 'Organizational teams are committed to a culture that fosters and values risk identification and management across the AI lifecycle.'),
('GOVERN 5', 'GOVERN', 'Engagement with AI Actors',
 'Organizational policies and practices are in place to collect, consider, prioritize, and integrate feedback from those external to the team that developed or deployed the AI system regarding the potential individual and societal impacts related to AI risks.'),
('GOVERN 6', 'GOVERN', 'Third-Party Software and Data Supply Chain',
 'Policies and procedures are in place to address AI risks and benefits arising from third-party software and data and other supply chain issues.'),

-- MAP categories
('MAP 1', 'MAP', 'Context Establishment',
 'Context is established for framing risks related to the AI system and its development and deployment.'),
('MAP 2', 'MAP', 'AI System Categorization',
 'Scientific understanding of the AI system''s capabilities and limitations is evaluated and communicated, including potential performance issues.'),
('MAP 3', 'MAP', 'Capabilities, Usage, and Benefits Assessment',
 'AI system risks and benefits are mapped to allow for cost-benefit tradeoffs and informed risk management decisions.'),
('MAP 4', 'MAP', 'Component Risk Mapping',
 'Risks and benefits are mapped across the AI system''s components and technical dependencies.'),
('MAP 5', 'MAP', 'Impact Characterization',
 'Likelihood and magnitude of each identified impact (both potentially beneficial and harmful) are characterized, evaluated, and documented.'),

-- MEASURE categories
('MEASURE 1', 'MEASURE', 'Methods and Metrics Selection',
 'Approaches and metrics for measuring the trustworthiness of AI systems, and risks associated with AI systems, are identified and appropriate given the context.'),
('MEASURE 2', 'MEASURE', 'Trustworthiness Evaluation',
 'AI system metrics are established, and measurement approaches are evaluated for measuring AI risks, impacts, and trustworthiness; and documentation of these is established.'),
('MEASURE 3', 'MEASURE', 'Risk Tracking Mechanisms',
 'AI system risks and trustworthiness characteristics are tracked, including risks to civil liberties and rights.'),
('MEASURE 4', 'MEASURE', 'Measurement Efficacy Feedback',
 'Feedback about efficacy of measurement is gathered and assessed.'),

-- MANAGE categories
('MANAGE 1', 'MANAGE', 'Risk Prioritization and Response',
 'A holistic, institutional approach to AI risk management is taken, which addresses the full AI system lifecycle and organizational priorities.'),
('MANAGE 2', 'MANAGE', 'Benefits Maximization and Impact Minimization',
 'Strategies to address risks by maximizing benefits and minimizing potential impacts are planned, prepared, implemented, documented, and informed by input from relevant AI actors.'),
('MANAGE 3', 'MANAGE', 'Third-Party Risk Management',
 'AI risks and benefits from third-party resources are managed.'),
('MANAGE 4', 'MANAGE', 'Risk Treatment Documentation and Monitoring',
 'Risk treatments, including response and recovery, and communication plans for the identified and residual risks are documented and monitored regularly.');
