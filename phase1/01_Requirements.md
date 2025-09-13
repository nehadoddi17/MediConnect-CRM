#phase 1-Requirements (MediConnect)

## Project Summary
MediConnect: Patient Engagement & Health Tracking CRM for clinics/hospitals.
Goals: automate booking & reminders, manage patient records, enable patient-doctor engagement, track follow-ups, provide admin dashboards.

##Scope

In scope: Patient registration, appointment scheduling, reminders (SMS/email), chronic health tracking, doctor notes, admin dashboards.
Out of scope (Phase 1): Full EMR integrations, billing/payments.

## Functional requirements
1. Capture patient inquiries (web form, walk-ins, referrals).
2. Online appointment booking with doctor specialization lookup.
3. SMS/email reminders for appointments, tests, follow-ups.
4. Patient health record: diagnoses, meds, allergies, lab reports.
5. Chronic-condition workflows (scheduled reminders).
6. Treatment notes and follow-up tracking.
7. Dashboards: daily visits per doctor, chronic vs new patient, basic revenue.

## Non-Functional requirements
- Data privacy & encryption at rest/in transit.
- Audit trail for patient record modifications.
- High availability during clinic hours.
- Usability for non-technical staff.

## Acceptance criteria (examples)
- Reminder SMS sent 24 hours before appointment.
- Doctor can access last 12 months of notes in <5 seconds.
- Admin dashboard displays daily visits correctly.
