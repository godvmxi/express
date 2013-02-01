drop table if exists bools;
drop table if exists media_products;
drop table if exists customers;
drop table if exists children;
drop table if exists parents;
drop table if exists counters;
drop table if exists purchases;
drop table if exists accounts;
drop table if exists categories_products;
drop table if exists categories;
drop table if exists users;
drop table if exists line_items;
drop table if exists orders;
drop table if exists invoices;
drop table if exists refunds;
drop table if exists payments;
drop table if exists products;
drop table if exists employees;
drop table if exists people;

/*START:employee*/
create table employees (
 id              int           not null auto_increment,
 name            varchar(200)  not null,
 manager_id      int,
 mentor_id       int,
 primary key (id),
 constraint fk_manager foreign key (manager_id) references employees(id),
 constraint fk_mentor  foreign key (mentor_id)  references employees(id)
);
/*END:employee*/




create table payments (
 id              int           not null auto_increment,
 primary key (id)
);

create table refunds (
 id              int           not null auto_increment,
 primary key (id)
);




create table users (
  id              int           not null auto_increment,
  name		  varchar(100)  not null,
  zipcode	  char(10)	not null,
  hashed_password char(40)      null,
  primary key (id)
);


/*START:join*/
create table categories_products (
  category_id     int	    not null,
  product_id	  int	    not null,
  constraint fk_cp_category foreign key (category_id) references categories(id),
  constraint fk_cp_product  foreign key (product_id)  references products(id),
  primary key (category_id, product_id)
);
/*END:join*/







/*START:bools*/
create table bools (
  id              int           not null auto_increment,
  flag	  	  bool,
  primary key (id)
);
/*END:bools*/

create table bad_books (
  isbn   varchar(50),
  title  varchar(200),
  primary key (isbn)
);


