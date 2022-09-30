create table if not exists user_follows
(
    id          bigint generated by default as identity,
    created_at  timestamptz not null default current_timestamp,
    follower_id bigint      not null references users (id) on delete cascade,
    followee_id bigint      not null references users (id) on delete cascade
);

alter table user_follows
    add constraint user_follows_id_pk primary key (id);