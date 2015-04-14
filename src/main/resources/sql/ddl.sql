/*select current_user();
set password = password('testme'); */

use timesheet;

drop table if exists timesheet;
drop table if exists task_employee;
drop table if exists task;
drop table if exists employee;
drop table if exists manager;


create table `employee` (
  `id` int(11) not null auto_increment,
  `department` varchar(50) default null,
  `name` varchar(50) default null,
  primary key (`id`)
) engine=innodb auto_increment=5 default charset=latin1;

create table `manager` (
  `id` int(11) not null auto_increment,
  `name` varchar(50) default null,
  primary key (`id`)
) engine=innodb auto_increment=5 default charset=latin1;

create table `task` (
  `id` int(11) not null auto_increment,
  `completed` bit default false,  
  `description` varchar(50) default null,
  `manager_id` int(11) default null,
  foreign key (manager_id) references manager(id) on delete cascade,
  primary key (`id`)
) engine=innodb auto_increment=5 default charset=latin1;


create table `task_employee` (
 `task_id` int(11) not null auto_increment,
  `employee_id` int(11) default null,
  foreign key (task_id) references task(id) on delete cascade,
  foreign key (employee_id) references employee(id) on delete cascade,  
  primary key (`task_id`, `employee_id`)
) engine=innodb auto_increment=5 default charset=latin1;

create table `timesheet` (
  `id` int(11) not null auto_increment,
  `hours` int(11) default 0,  
  `task_id` int(11) not null,
  `employee_id` int(11) not null,
  primary key (`id`),
  foreign key (employee_id) references employee(id) on delete cascade,
  foreign key (task_id) references task(id) on delete cascade 
) engine=innodb auto_increment=5 default charset=latin1;

