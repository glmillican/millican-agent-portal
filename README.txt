Millican Insurance Agency Portal V4

V4 milestone:
- Real Supabase authentication
- Real leads loaded from public.leads
- Dashboard lead counts use Supabase data
- Recent Leads and All Leads use Supabase data
- Add/Edit Lead writes to Supabase
- Assign Lead writes to Supabase
- Agent names come from public.profiles

Expected current test:
Gary logs in as admin and should see TEST-001 / Test Client from Supabase.

Training and Carrier Center remain prototype/local data for now.
Do not enter real Medicare/PII data until agent-level RLS testing is completed.
