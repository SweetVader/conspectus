create table conmments (
  id bigint not null auto_increment,
  text varchar(255) not null,
  user_id bigint not null references usr,
  message_id bigint not null references message,
  primary key (id)
)