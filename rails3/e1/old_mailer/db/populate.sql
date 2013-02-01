insert into products values(1, "Programming Ruby, 2nd Edition", "",
"", 44.95, now());
insert into products values(2, "Pragmatic Project Automation", "",
"", 29.95, now());

insert into orders values(1, "Dave Thomas", "dave@pragprog.com", "", "", null);

insert into line_items values(1, 1, 1, 1, 44.95);
insert into line_items values(2, 2, 1, 2, 44.95);
