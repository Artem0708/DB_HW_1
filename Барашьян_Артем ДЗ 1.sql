CREATE TABLE "transactions" (
  "transaction_id" int PRIMARY KEY NOT NULL,
  "product_id" int,
  "customer_id" int,
  "transaction_date" date,
  "online_order" bool,
  "order_status" varchar,
  "list_price" float
);

CREATE TABLE "products" (
  "product_id" int PRIMARY KEY NOT NULL,
  "brand" varchar,
  "product_line" varchar,
  "product_class" varchar,
  "product_size" varchar,
  "standard_cost" float
);

CREATE TABLE "customers" (
  "customer_id" int PRIMARY KEY NOT NULL,
  "first_name" varchar,
  "last_name" varchar,
  "gender" varchar,
  "DOB" date,
  "job_industry_category" varchar,
  "job_title" varchar,
  "wealth_segment" varchar,
  "deceased_indicator" varchar,
  "owns_car" varchar,
  "address" varchar
);

CREATE TABLE "customer_addresses" (
  "address_id" int PRIMARY KEY NOT NULL,
  "country" varchar,
  "state" varchar,
  "postcode" int,
  "address" varchar,
  "property_valuation" int
);

CREATE TABLE "master" (
  "row_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
  "transaction_id" int,
  "product_id" int,
  "customer_id" int,
  "address_id" int
);

ALTER TABLE "master" ADD FOREIGN KEY ("transaction_id") REFERENCES "transactions" ("transaction_id");

ALTER TABLE "master" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id");

ALTER TABLE "master" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "master" ADD FOREIGN KEY ("address_id") REFERENCES "customer_addresses" ("address_id");
