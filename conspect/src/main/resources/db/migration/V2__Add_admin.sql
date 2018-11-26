insert into usr (id, username, password,email, active)
    values (1, 'admin', '$2a$08$FWO9P13x5EyC1JT4Pfl4OePGB/jbZyAeTud1UDXsLN.gw9B4wEUkm', "nastassia.shaypak@mail.ru", true);

insert into user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN');