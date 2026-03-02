-- AI RMF 1.0 × NIST SP 800-53 Rev 5 — AT Family Crosswalk Mappings
-- Source: NIST AI 100-1 (January 2023) mapped to SP 800-53 Rev 5 AT controls
-- Implementation guidance is environment-agnostic (no vendor-specific references)

INSERT INTO crosswalk_mappings
    (subcategory_id, control_id, coverage_level, rationale, guidance, evidence_types)
VALUES

-- AT-1: Policy and Procedures
('GOVERN 1.1', 'at-1', 'Partial',
 'AT-1 establishes the awareness and training policy framework that can incorporate AI literacy, responsible AI use, and AI risk awareness requirements. Addresses the policy layer for training but not the full scope of AI risk management policies.',
 'Extend AT-1 policy to require AI literacy training for all personnel and role-specific AI competency development for those who develop, deploy, or oversee AI systems. Include AI-specific training frequency and completion requirements.',
 ARRAY['Policy documents', 'GRC platform control evidence', 'Policy review records']),

-- AT-2: Literacy Training and Awareness
('GOVERN 2.2', 'at-2', 'Strong',
 'AT-2 literacy training directly supports AI risk management competency by ensuring all organizational personnel understand AI fundamentals, risks, and responsible use practices. Core control for building organization-wide AI awareness.',
 'Include AI risk awareness, responsible AI use guidelines, and AI system limitations in security and privacy literacy training. Cover topics such as recognizing AI-generated content, understanding AI decision-making limitations, and reporting AI system anomalies.',
 ARRAY['Training materials', 'Completion records', 'AI awareness curriculum documentation']),

('GOVERN 3.2', 'at-2', 'Strong',
 'AT-2 literacy training supports human-AI oversight by ensuring personnel who interact with AI systems understand their capabilities and limitations. Core awareness control for informed human oversight of AI operations.',
 'Train all personnel who interact with AI systems on when to trust and when to question AI outputs. Include practical guidance on recognizing AI hallucinations, understanding confidence scores, and knowing when to escalate AI system outputs for human review.',
 ARRAY['Training materials', 'AI interaction guidelines', 'Completion records']),

('GOVERN 2.1', 'at-2', 'Partial',
 'AT-2 literacy training supports AI risk management role awareness by building baseline understanding of AI risks across the organization. Addresses general awareness but not the specific definition of AI risk management roles.',
 'Build organizational awareness of AI capabilities, limitations, and governance responsibilities through literacy training. Ensure all staff understand their role in responsible AI use and who to contact with AI-related concerns.',
 ARRAY['Training records', 'Awareness assessment results', 'Contact information documentation']),

('GOVERN 4.1', 'at-2', 'Partial',
 'AT-2 literacy training supports a safety-first mindset for AI by educating personnel on potential negative impacts and responsible use practices. Addresses awareness but not the design-level safety practices.',
 'Include AI safety awareness in literacy training covering potential harms from AI misuse, importance of following AI acceptable use policies, and the organization''s commitment to responsible AI development and deployment.',
 ARRAY['Safety awareness materials', 'Training completion records']),

-- AT-3: Role-Based Training
('GOVERN 2.2', 'at-3', 'Strong',
 'AT-3 role-based training directly builds AI governance competencies by providing specialized training to personnel whose roles involve AI risk management responsibilities. Core competency development control for AI governance roles.',
 'Train AI governance roles on risk management frameworks, bias detection methods, fairness evaluation techniques, and ethical AI practices. Develop role-specific AI training tracks for data scientists, model reviewers, deployment engineers, and AI risk managers.',
 ARRAY['Role-based training curricula', 'Competency assessment records', 'Training completion records']),

('GOVERN 3.2', 'at-3', 'Strong',
 'AT-3 role-based training directly supports human-AI configuration by developing specialized competencies for personnel who oversee, operate, or maintain AI systems. Core training control for effective human oversight.',
 'Develop AI-specific training for roles that develop, deploy, or oversee AI systems including model monitoring techniques, output validation procedures, override protocols, and escalation criteria. Include hands-on exercises with AI system monitoring tools.',
 ARRAY['Training materials', 'Hands-on exercise documentation', 'Competency verification records']),

('MAP 3.4', 'at-3', 'Partial',
 'AT-3 role-based training supports operator and practitioner proficiency with AI systems by developing the technical competencies needed to operate AI systems effectively and safely. Addresses skill development but not certification standards.',
 'Train AI system operators on performance monitoring, troubleshooting AI output quality issues, and executing model fallback procedures. Include training on AI-specific tools and platforms used in the organization.',
 ARRAY['Operator training records', 'Proficiency assessment results', 'Tool-specific training documentation']),

('MEASURE 1.3', 'at-3', 'Partial',
 'AT-3 role-based training supports involvement of internal experts in AI assessments by developing the specialized skills needed for independent AI system evaluation. Addresses skill development but not the assessment process itself.',
 'Train internal security and privacy assessors on AI-specific evaluation techniques including model security testing, fairness auditing, and privacy impact assessment for AI systems. Develop internal AI assessment expertise to reduce reliance on external specialists.',
 ARRAY['Assessor training records', 'AI evaluation skill documentation', 'Internal capability assessments']),

-- AT-4: Training Records
('GOVERN 3.2', 'at-4', 'Partial',
 'AT-4 training records support verification of human-AI oversight competency by documenting who has completed AI-specific training and their assessed proficiency levels. Addresses record-keeping but not the training content itself.',
 'Track completion of AI-specific training requirements for all personnel who interact with, develop, or oversee AI systems. Maintain proficiency records that demonstrate personnel are qualified for their AI-related responsibilities.',
 ARRAY['Training completion records', 'Proficiency tracking databases', 'Qualification verification records']),

('GOVERN 2.2', 'at-4', 'Partial',
 'AT-4 training records support AI workforce development by providing evidence that personnel have received required AI risk management training. Addresses training documentation but not curriculum design.',
 'Maintain training records that document AI-specific competency development including courses completed, certifications earned, and proficiency assessment results. Use training records to identify AI skill gaps and inform workforce development planning.',
 ARRAY['Training records', 'Certification tracking', 'Skill gap analysis documentation']),

-- AT-5: Contacts with Security Groups and Associations
('GOVERN 5.1', 'at-5', 'Partial',
 'AT-5 engagement with security groups supports collection of external feedback on AI risks by maintaining relationships with professional organizations focused on AI safety and governance. Addresses community participation but not structured feedback integration.',
 'Engage with AI safety, responsible AI, and AI governance professional organizations including research communities, industry consortia, and standards bodies. Participate in AI risk sharing forums to stay current on emerging threats and best practices.',
 ARRAY['Membership records', 'Meeting participation logs', 'Community engagement documentation']),

('GOVERN 5.2', 'at-5', 'Partial',
 'AT-5 professional contacts support incorporation of external AI expertise by providing channels for learning about evolving AI standards, regulatory requirements, and governance practices. Addresses external awareness but not feedback adjudication.',
 'Stay current on AI governance standards, regulatory developments, and best practices through professional association contacts. Monitor AI-related publications, conference proceedings, and working group outputs from relevant organizations.',
 ARRAY['Standards monitoring records', 'Publication tracking', 'Working group participation documentation']),

-- AT-6: Training Feedback
('GOVERN 5.2', 'at-6', 'Partial',
 'AT-6 training feedback supports mechanisms for incorporating feedback into AI training programs by collecting participant input on training effectiveness and relevance. Addresses training-level feedback but not broader system-level feedback integration.',
 'Collect and act on feedback from AI training programs to improve content relevance, delivery methods, and competency assessment approaches. Use feedback to identify emerging AI topics that should be added to training curricula.',
 ARRAY['Training feedback records', 'Curriculum improvement documentation', 'Feedback analysis reports']),

('MEASURE 4.1', 'at-6', 'Partial',
 'AT-6 training feedback supports measurement of AI program effectiveness by providing data on whether training achieves its learning objectives. Addresses training effectiveness measurement but not the broader AI risk management program measurement.',
 'Use training feedback to assess AI awareness and competency program effectiveness. Correlate training outcomes with operational metrics such as AI incident rates, policy compliance levels, and reported AI concerns to measure real-world impact.',
 ARRAY['Feedback analysis reports', 'Training-outcome correlation analysis', 'Program effectiveness assessments']),

('MEASURE 4.2', 'at-6', 'Partial',
 'AT-6 training feedback supports validation of AI measurement results by providing participant perspective on whether training metrics reflect actual competency development. Addresses training metric validation but not broader measurement validation.',
 'Validate AI training effectiveness metrics against participant feedback and observed competency improvements. Adjust training approaches and assessment methods based on feedback indicating disconnect between measured and actual AI competency levels.',
 ARRAY['Metric validation records', 'Competency observation reports', 'Training adjustment documentation'])

ON CONFLICT (subcategory_id, control_id) DO NOTHING;
