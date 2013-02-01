create table users (
  id              int           not null auto_increment,
  name		  varchar(100)  not null,
  primary key (id)
);

create table articles (
  id              int           not null auto_increment,
  title		  varchar(100)  not null,
  primary key (id)
);


create table articles_users (
  article_id     int		not null,
  user_id   	 int		not null,
  when_read      datetime 	not null,
  constraint fk_cp_article     foreign key (article_id) references articles(id),
  constraint fk_cp_user        foreign key (user_id)  references users(id),
  primary key (article_id, user_id)
);

