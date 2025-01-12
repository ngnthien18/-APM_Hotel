create database KhachSan
use KhachSan

create table tbl_room_type(
	room_type_id int constraint pk_room_type_id  primary key identity (1,1),
	room_name nvarchar(50)not null,
	description nvarchar(255) not null,
	room_price decimal(18,2) constraint df_room_price default(3000),
	room_capacity tinyint not null
)

create table tbl_payment_type(
	payment_type_id int constraint pk_payment_type_id  primary key identity (1,1),
	payment_type nvarchar(50) not null
)

create table tbl_payment(
	payment_id int constraint pk_payment_id  primary key identity (1,1),
	booking_id tinyint not null,
	payment_type_id int not null,
	payment_amount decimal(18,2) not null,
	Is_Active  bit default(0)
)
alter table tbl_payment add constraint fk_payment_type foreign key(payment_type_id) references tbl_payment_type(payment_type_id) on delete cascade ON UPDATE CASCADE

create table tbl_booking_status(
	booking_status_id int constraint pk_booking_status_id  primary key identity (1,1),
	booking_status nvarchar(250) not null
)

create table tbl_room(
	room_id int constraint pk_room_id  primary key identity (1,1),
	room_number nvarchar(50) not null,
	room_type_id int not null ,
	booking_status_id int not null,
	is_Active bit default(0)
)

alter table tbl_room add constraint fk_room_type foreign key(room_type_id) references tbl_room_type(room_type_id) on delete cascade ON UPDATE CASCADE
alter table tbl_room add constraint FK_booking_status  foreign key (booking_status_id) references tbl_booking_status (booking_status_id) on delete cascade ON UPDATE CASCADE

create table tbl_customer(
	cus_id int constraint pk_customer_id  primary key identity (1,1),
	cusname nvarchar(255) not null,
	emailcus nvarchar(255) not null,
	cus_password nvarchar(255)not null
)
create table tbl_booking(
	booking_id int constraint pk_booking_id  primary key identity (1,1),
	customer_address nvarchar(550) not null,
	customer_email nvarchar(550) not null,
	customer_phone_no nvarchar(50) not null,
	booking_from date not null,
	booking_to date not null,
	payment_type int not null CONSTRAINT FK_paytyp_pay_Id foreign key references  tbl_payment_type(payment_type_id) on delete cascade ON UPDATE CASCADE ,
	assigned_room int not null CONSTRAINT FK_ass_room_Id foreign key references  tbl_room(room_id) on delete cascade ON UPDATE CASCADE ,
	no_of_members tinyint  default(2),
	total_amount decimal(18,2) default(2000),
	cus_id int not null CONSTRAINT FK_cus_Id foreign key references  tbl_customer(cus_id) on delete cascade ON UPDATE CASCADE
)
                 
create table tbl_user(
	userid int constraint pk_user_id  primary key identity (1,1),
	username nvarchar(255) not null,
	email nvarchar(255) not null,
	user_password nvarchar(255)not null,
	user_level int not null
)

create table tbl_user_level(
	user_level_id int constraint pk_user_level_id  primary key identity (1,1),
	user_type  nvarchar(255)not null
)


alter table tbl_user add constraint FK_usr_level_no  foreign key (user_level) references tbl_user_level (user_level_id) on delete cascade ON UPDATE CASCADE

insert into tbl_user_level values ('Admin')
insert into tbl_user values ('Thi�n','athien@gmail.com','123456',1)
