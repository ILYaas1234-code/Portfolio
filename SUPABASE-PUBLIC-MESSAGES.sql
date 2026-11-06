-- Run once in Supabase SQL Editor. Does not delete existing messages.
-- Public visitors can read ONLY approved message fields; email is not selected by the website.

create policy "Anyone can view approved messages"
on public.messages
for select
to anon, authenticated
using (is_approved = true);

-- Admin can update approval/read status. The admin identity is checked by the signed-in JWT email.
create policy "Admin can update messages"
on public.messages
for update
to authenticated
using ((auth.jwt() ->> 'email') = 'ilyaasyaxye11@gmail.com')
with check ((auth.jwt() ->> 'email') = 'ilyaasyaxye11@gmail.com');
