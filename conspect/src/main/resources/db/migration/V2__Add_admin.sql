insert into usr (id, username, password,email, active)
    values (1, 'admin', 'bazinga', "nastassia.shaypak@mail.ru", true);

insert into user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN');