CREATE TABLE IF NOT EXISTS `product_category` (
  `id` BINARY(16) NOT NULL,
  `created` DATETIME(6) NOT NULL,
  `updated` DATETIME(6) NOT NULL,
  `version` BIGINT NOT NULL ,
  `category` VARCHAR(255) NOT NULL,
  `sub_category` VARCHAR(255) NULL,
  `product_size` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UQ_product_category_category` (`category` ASC) VISIBLE
);

CREATE TABLE IF NOT EXISTS `product` (
  `id` BINARY(16) NOT NULL,
  `created` DATETIME(6) NOT NULL,
  `updated` DATETIME(6) NOT NULL,
  `version` BIGINT NOT NULL ,
  `category_id` binary(6) NOT NULL,
  `short_name` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `short_description` VARCHAR(255) NOT NULL,
  `description` text NOT NULL,
  `material` VARCHAR(255) NOT NULL,
  `discount_percentage` VARCHAR(10) DEFAULT NULL,
  `max_discount_amount` BIGINT DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UQ_product_short_name` (`short_name` ASC) VISIBLE,
  UNIQUE INDEX `UQ_product_name` (`name` ASC) VISIBLE,
  FOREIGN KEY `FK_product_product_category` (category_id) REFERENCES product_category(id)
  );

CREATE TABLE IF NOT EXISTS `product_price` (
  `id` BINARY(16) NOT NULL,
  `created` DATETIME(6) NOT NULL,
  `updated` DATETIME(6) NOT NULL,
  `version` BIGINT NOT NULL,
  `product_id` binary(6) NOT NULL,
  `cost_price` DECIMAL(18,2) NOT NULL,
  `logistic_expenses` DECIMAL(18,2) DEFAULT 0,
  `additional_cost` DECIMAL(18,2)  DEFAULT 0,
  `unit_price` DECIMAL(18,2) NOT NULL,
  `sell_price` DECIMAL(18,2) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY `FK_product_price_product` (product_id) REFERENCES product(id));

CREATE TABLE IF NOT EXISTS `stock` (
  `id` BINARY(16) NOT NULL,
  `created` DATETIME(6) NOT NULL,
  `updated` DATETIME(6) NOT NULL,
  `version` BIGINT NOT NULL ,
  `product_id` binary(6) NOT NULL,
  `quantity` BIGINT DEFAULT 0,
  PRIMARY KEY (`id`),
  FOREIGN KEY `FK_stock_product` (product_id) REFERENCES product(id));

CREATE TABLE IF NOT EXISTS `stock_audit` (
  `id` BINARY(16) NOT NULL,
  `created` DATETIME(6) NOT NULL,
  `updated` DATETIME(6) NOT NULL,
  `version` BIGINT NOT NULL,
  `product_id` binary(6) NOT NULL,
  `quantity` BIGINT DEFAULT 0,
  `operation_type` VARCHAR(50) NOT NULL,
  `operated_by` VARCHAR(50) NOT NULL,
  `transaction_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY `FK_stock_audit_product` (product_id) REFERENCES product(id));

CREATE TABLE IF NOT EXISTS `sales_details` (
  `id` BINARY(16) NOT NULL,
  `created` DATETIME(6) NOT NULL,
  `updated` DATETIME(6) NOT NULL,
  `version` BIGINT NOT NULL ,
  `product_id` binary(6) NOT NULL,
  `quantity` BIGINT NOT NULL,
  `unit_price` DECIMAL(18,2) NOT NULL,
  `discount_amount` DECIMAL(18,2) DEFAULT 0,
  `total_price` DECIMAL(18,2) NOT NULL,
  `payment_mode`  VARCHAR(50) NOT NULL,
  `transaction_id` VARCHAR(255) DEFAULT NULL,
  `sold_by` VARCHAR(50) NOT NULL,
  `sold_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY `FK_sales_details_audit_product` (product_id) REFERENCES product(id));