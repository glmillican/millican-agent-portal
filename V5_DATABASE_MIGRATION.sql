-- Millican Portal V5 migration - run once in Supabase SQL Editor
alter table public.profiles add column if not exists coop_active boolean not null default false;
update public.profiles set coop_active=true where email in ('gary@millican.agency','sandy@millican.agency');

alter table public.leads
 add column if not exists lead_origin text not null default 'agency' check (lead_origin in ('agency','agent')),
 add column if not exists created_by uuid references public.profiles(id),
 add column if not exists owner_id uuid references public.profiles(id),
 add column if not exists assignment_state text not null default 'Assigned' check (assignment_state in ('Assigned','Returned','Unassigned')),
 add column if not exists return_reason text,
 add column if not exists return_note text,
 add column if not exists returned_at timestamptz;

drop policy if exists "agents insert own personal leads" on public.leads;
create policy "agents insert own personal leads" on public.leads for insert to authenticated
with check (
 public.is_admin()
 or (lead_origin='agent' and created_by=auth.uid() and owner_id=auth.uid() and assigned_to=auth.uid())
);

create or replace function public.protect_lead_ownership()
returns trigger language plpgsql security definer set search_path=public as $$
begin
 if not public.is_admin() and tg_op='UPDATE' and (
   new.lead_origin is distinct from old.lead_origin or
   new.created_by is distinct from old.created_by or
   new.owner_id is distinct from old.owner_id
 ) then raise exception 'Lead ownership fields cannot be changed by agents';
 end if;
 return new;
end; $$;

drop trigger if exists protect_lead_ownership_trigger on public.leads;
create trigger protect_lead_ownership_trigger before update on public.leads
for each row execute function public.protect_lead_ownership();
