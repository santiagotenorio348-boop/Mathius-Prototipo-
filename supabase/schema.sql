-- Esquema inicial de demostración. Revisar y endurecer RLS antes de producción.
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  created_at timestamptz not null default now()
);

create table if not exists public.progress (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  topic text not null,
  completed_lessons integer not null default 0 check (completed_lessons between 0 and 3),
  stars integer not null default 0,
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.progress enable row level security;

create policy "Users can read own profile" on public.profiles
  for select using (auth.uid() = id);
create policy "Users can update own profile" on public.profiles
  for update using (auth.uid() = id);

create policy "Users can read own progress" on public.progress
  for select using (auth.uid() = user_id);
create policy "Users can insert own progress" on public.progress
  for insert with check (auth.uid() = user_id);
create policy "Users can update own progress" on public.progress
  for update using (auth.uid() = user_id);
