create table "user" (
"created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"name" character varying not null,
"address" character varying not null,
"phone_number" character varying not null,
"email" character varying not null,
"password" character varying not null,
constraint "PK_3c2bc72f03fd5abbbc5ac169411" primary key ("id")
);

create table "product" (
"created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"name" character varying not null,
"description" character varying,
"price" float not null,
"sku" integer not null,
"product_category" character varying,
constraint "PK_3c2bc72f03fd5abbbc5ac169412" primary key ("id")
);

create table "order" (
"created_at" TIMESTAMP not null default now(),
"updated_at" TIMESTAMP not null default now(),
"deleted_at" TIMESTAMP,
"id" uuid not null default uuid_generate_v4(),
"order_address" character varying not null,
"price" float not null,
"user_id" uuid not null,
constraint "PK_3c2bc72f03fd5abbbc5ac169413" primary key ("id")
);

create table "order_product" (
	"order_id" uuid not null,
	"product_id" uuid not null,
	"quantity" integer not null,
	"price" float not null
);

insert into "e-commerce-app"."user"
("name", address, phone_number, email, "password")
values
('Jithin A P', 'KeyValue Systems', '+91 8078 171 539', 'jithinap009@gmail.com', 'password123'),
('Barath Chandran', 'KeyValue Systems', '+91 8078 171 980', 'bharath@gmail.com', 'password123'),
('Sahal Mohammed', 'IBM ISL', '+91 8078 171 888', 'sahal@gmail.com', 'pass123');

insert into "e-commerce-app"."product"
("name", description, price, sku, product_category)
values
('Redmi 9 Note', 'A smartphone', 9999.99, 4234, 'Smartphone'),
('Dell Latitude 5591', 'A good workstation laptop', 125222.99, 4578, 'Laptop'),
('Apple Macbook Air M2', 'A good laptop', 149999.99, 4678, 'Laptop'),
('Oneplus Nord Buds', 'A good pair of TWS', 4999.99, 4768, 'Headphones');

insert into "e-commerce-app"."order"
(id, order_address, price, user_id)
values
(uuid_generate_v4(), 'KeyValue Systems', 17999.99,'917436f0-248f-413c-9464-6a2ea8e61ae1'),
(uuid_generate_v4(), 'Kothamangalam', 139999.99,'95bfa283-0ba5-4921-8145-59955d995d3e');

insert into "e-commerce-app"."order_product"
(order_id, product_id, quantity, price)
values
('ddd03f47-f0ca-48f6-86ab-9f2738d96c64', 'b35093a6-dba9-4b57-9d7c-bb38ac274c2b', 1, 8999.99),
('ddd03f47-f0ca-48f6-86ab-9f2738d96c64', '9ec24af6-805f-48e3-975f-71c78f6ddc32', 2, 4499.99),
('faf58e3b-16c9-4c21-8e7e-949ccdc5b3c1', '5b8515ec-d5be-4420-85b9-113bc7369bac', 1, 13999.99);

create index "product_name"
on "product" ("name");

create index "product_category"
on "product" ("product_category");

create index "product_price"
on "product" ("price");

select * from "user" u
left join "order" o on u.id = o.user_id 
left join "order_product" op on op.order_id = o.id
left join "product" p on op.product_id = p.id;