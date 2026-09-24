-- Millican Agency Portal V6.0 — Lead Intake / Agency Inbox
-- Safe additive migration. This does NOT delete existing leads.

alter table public.leads
  add column if not exists lead_source text,
  add column if not exists campaign text,
  add column if not exists source_detail text;

-- Backfill existing records so old agency/co-op leads have a readable source.
update public.leads
set lead_source = case
  when lead_origin = 'agent' then 'Agent Generated'
  else 'Existing / Legacy'
end
where lead_source is null or btrim(lead_source) = '';

-- Useful index as the inbox grows.
create index if not exists leads_agency_inbox_idx
on public.leads (lead_origin, assigned_to, created_at desc);

-- No new public/anonymous INSERT policy is added here.
-- Meta/Form integrations will enter through a secure server-side intake endpoint later.
