-- MyNotes schema for the shared MyDigital Supabase project.
-- Run once in the Supabase SQL Editor if setting up a fresh project.

create table if not exists public.notes (
  id uuid primary key default gen_random_uuid(),
  owner uuid not null references auth.users(id) on delete cascade,
  title text not null default '',
  content text not null default '',
  folder text not null default 'Allgemein',
  pinned boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.notes enable row level security;

create policy "Users can read their own notes" on public.notes
  for select to authenticated using ((select auth.uid()) = owner);

create policy "Users can create their own notes" on public.notes
  for insert to authenticated with check ((select auth.uid()) = owner);

create policy "Users can update their own notes" on public.notes
  for update to authenticated using ((select auth.uid()) = owner)
  with check ((select auth.uid()) = owner);

create policy "Users can delete their own notes" on public.notes
  for delete to authenticated using ((select auth.uid()) = owner);

grant select, insert, update, delete on public.notes to authenticated;

create index if not exists notes_owner_updated_idx
  on public.notes (owner, updated_at desc);
