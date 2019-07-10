/*
 Navicat Premium Data Transfer

 Source Server         : vgw
 Source Server Type    : PostgreSQL
 Source Server Version : 110004
 Source Host           : localhost:5432
 Source Catalog        : pmker
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110004
 File Encoding         : 65001

 Date: 10/07/2019 18:34:44
*/


-- ----------------------------
-- Sequence structure for dex_orders_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dex_orders_id_seq";
CREATE SEQUENCE "public"."dex_orders_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."dex_orders_id_seq" OWNER TO "pmker";

-- ----------------------------
-- Sequence structure for dex_tasktxs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dex_tasktxs_id_seq";
CREATE SEQUENCE "public"."dex_tasktxs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."dex_tasktxs_id_seq" OWNER TO "pmker";

-- ----------------------------
-- Sequence structure for ethaddress_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ethaddress_id_seq";
CREATE SEQUENCE "public"."ethaddress_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."ethaddress_id_seq" OWNER TO "pmker";

-- ----------------------------
-- Sequence structure for launch_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launch_logs_id_seq";
CREATE SEQUENCE "public"."launch_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."launch_logs_id_seq" OWNER TO "pmker";

-- ----------------------------
-- Sequence structure for orders_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."orders_id_seq";
CREATE SEQUENCE "public"."orders_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."orders_id_seq" OWNER TO "pmker";

-- ----------------------------
-- Sequence structure for trades_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trades_id_seq";
CREATE SEQUENCE "public"."trades_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."trades_id_seq" OWNER TO "pmker";

-- ----------------------------
-- Sequence structure for transactions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."transactions_id_seq";
CREATE SEQUENCE "public"."transactions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."transactions_id_seq" OWNER TO "pmker";

-- ----------------------------
-- Sequence structure for vite_tokens_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."vite_tokens_id_seq";
CREATE SEQUENCE "public"."vite_tokens_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."vite_tokens_id_seq" OWNER TO "pmker";

-- ----------------------------
-- Sequence structure for vitetokens_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."vitetokens_id_seq";
CREATE SEQUENCE "public"."vitetokens_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."vitetokens_id_seq" OWNER TO "pmker";

-- ----------------------------
-- Sequence structure for wallets_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wallets_id_seq";
CREATE SEQUENCE "public"."wallets_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."wallets_id_seq" OWNER TO "pmker";

-- ----------------------------
-- Table structure for SequelizeMeta
-- ----------------------------
DROP TABLE IF EXISTS "public"."SequelizeMeta";
CREATE TABLE "public"."SequelizeMeta" (
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."SequelizeMeta" OWNER TO "pmker";

-- ----------------------------
-- Records of SequelizeMeta
-- ----------------------------
BEGIN;
INSERT INTO "public"."SequelizeMeta" VALUES ('20190706092331-token.js');
INSERT INTO "public"."SequelizeMeta" VALUES ('20190706100753-address.js');
INSERT INTO "public"."SequelizeMeta" VALUES ('20190706100753-wallet.js');
INSERT INTO "public"."SequelizeMeta" VALUES ('20190706135406-tasktx.js');
INSERT INTO "public"."SequelizeMeta" VALUES ('20190706135406-txs.js');
COMMIT;

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS "public"."channels";
CREATE TABLE "public"."channels" (
  "id" int4 NOT NULL,
  "name" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL,
  "maxseq" int8 DEFAULT 0,
  "maxmsgs" int4 DEFAULT 0,
  "maxbytes" int8 DEFAULT 0,
  "maxage" int8 DEFAULT 0,
  "deleted" bool DEFAULT false
)
;
ALTER TABLE "public"."channels" OWNER TO "pmker";

-- ----------------------------
-- Table structure for clients
-- ----------------------------
DROP TABLE IF EXISTS "public"."clients";
CREATE TABLE "public"."clients" (
  "id" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL,
  "hbinbox" text COLLATE "pg_catalog"."default",
  "proto" bytea
)
;
ALTER TABLE "public"."clients" OWNER TO "pmker";

-- ----------------------------
-- Table structure for dex_orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."dex_orders";
CREATE TABLE "public"."dex_orders" (
  "id" int4 NOT NULL DEFAULT nextval('dex_orders_id_seq'::regclass),
  "walletAddress" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tokenId" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "inTxHash" varchar(250) COLLATE "pg_catalog"."default",
  "outTxHash" varchar(250) COLLATE "pg_catalog"."default",
  "amount" varchar(250) COLLATE "pg_catalog"."default",
  "fee" varchar(250) COLLATE "pg_catalog"."default",
  "state" varchar(250) COLLATE "pg_catalog"."default",
  "dateTime" varchar(250) COLLATE "pg_catalog"."default",
  "type" int4 DEFAULT 0,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6)
)
;
ALTER TABLE "public"."dex_orders" OWNER TO "pmker";

-- ----------------------------
-- Records of dex_orders
-- ----------------------------
BEGIN;
INSERT INTO "public"."dex_orders" VALUES (1, '1', '1', '2abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (2, '1', '1', '3abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (3, '1', '1', '4abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (4, '1', '1', '5abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (5, '1', '1', '6abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (6, '1', '1', '7abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (7, '1', '1', '8abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (8, '1', '1', '9abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (9, '1', '1', '10abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (10, '1', '1', '11abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (11, '1', '1', '12abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (12, '1', '1', '13abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (13, '1', '1', '14abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (14, '1', '1', '15abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (15, '1', '1', '16abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (16, '1', '1', '17abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (17, '1', '1', '18abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (18, '1', '1', '19abc', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (19, '1', '1', '1abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (20, '1', '1', '2abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (21, '1', '1', '3abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (22, '1', '1', '4abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (23, '1', '1', '5abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (24, '1', '1', '6abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (25, '1', '1', '7abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (26, '1', '1', '8abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (27, '1', '1', '9abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (28, '1', '1', '10abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (29, '1', '1', '11abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (30, '1', '1', '12abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (31, '1', '1', '13abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (32, '1', '1', '14abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (33, '1', '1', '15abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (34, '1', '1', '16abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (35, '1', '1', '17abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."dex_orders" VALUES (36, '1', '1', '18abc', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for dex_tasktxs
-- ----------------------------
DROP TABLE IF EXISTS "public"."dex_tasktxs";
CREATE TABLE "public"."dex_tasktxs" (
  "id" int4 NOT NULL DEFAULT nextval('dex_tasktxs_id_seq'::regclass),
  "transaction_hash" varchar(250) COLLATE "pg_catalog"."default",
  "status" varchar(250) COLLATE "pg_catalog"."default",
  "from" varchar(250) COLLATE "pg_catalog"."default",
  "to" varchar(250) COLLATE "pg_catalog"."default",
  "amount" varchar(250) COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6)
)
;
ALTER TABLE "public"."dex_tasktxs" OWNER TO "pmker";

-- ----------------------------
-- Table structure for ethaddress
-- ----------------------------
DROP TABLE IF EXISTS "public"."ethaddress";
CREATE TABLE "public"."ethaddress" (
  "id" int4 NOT NULL DEFAULT nextval('ethaddress_id_seq'::regclass),
  "erc20Address" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "index" int4 DEFAULT 0,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6)
)
;
ALTER TABLE "public"."ethaddress" OWNER TO "pmker";

-- ----------------------------
-- Table structure for launch_logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_logs";
CREATE TABLE "public"."launch_logs" (
  "id" int4 NOT NULL DEFAULT nextval('launch_logs_id_seq'::regclass),
  "item_type" text COLLATE "pg_catalog"."default" NOT NULL,
  "item_id" int4 NOT NULL,
  "status" text COLLATE "pg_catalog"."default" NOT NULL,
  "transaction_hash" text COLLATE "pg_catalog"."default",
  "block_number" int4,
  "t_from" text COLLATE "pg_catalog"."default" NOT NULL,
  "t_to" text COLLATE "pg_catalog"."default" NOT NULL,
  "value" numeric(32,18),
  "gas_limit" int4,
  "gas_used" int4,
  "gas_price" numeric(32,18),
  "nonce" int4,
  "data" text COLLATE "pg_catalog"."default" NOT NULL,
  "executed_at" timestamp(6),
  "updated_at" timestamp(6),
  "created_at" timestamp(6)
)
;
ALTER TABLE "public"."launch_logs" OWNER TO "pmker";

-- ----------------------------
-- Table structure for markets
-- ----------------------------
DROP TABLE IF EXISTS "public"."markets";
CREATE TABLE "public"."markets" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "base_token_address" text COLLATE "pg_catalog"."default" NOT NULL,
  "base_token_decimals" text COLLATE "pg_catalog"."default" NOT NULL,
  "base_token_symbol" text COLLATE "pg_catalog"."default" NOT NULL,
  "base_token_name" text COLLATE "pg_catalog"."default" NOT NULL,
  "quote_token_address" text COLLATE "pg_catalog"."default" NOT NULL,
  "quote_token_decimals" text COLLATE "pg_catalog"."default" NOT NULL,
  "quote_token_symbol" text COLLATE "pg_catalog"."default" NOT NULL,
  "quote_token_name" text COLLATE "pg_catalog"."default" NOT NULL,
  "min_order_size" numeric(32,18) NOT NULL,
  "maker_fee_rate" numeric(10,5) NOT NULL,
  "taker_fee_rate" numeric(10,5) NOT NULL,
  "price_precision" int4 NOT NULL,
  "price_decimals" int4 NOT NULL,
  "amount_decimals" int4 NOT NULL,
  "gas_used_estimation" int4 NOT NULL,
  "is_published" bool NOT NULL DEFAULT true,
  "updated_at" timestamp(6),
  "created_at" timestamp(6)
)
;
ALTER TABLE "public"."markets" OWNER TO "pmker";

-- ----------------------------
-- Records of markets
-- ----------------------------
BEGIN;
INSERT INTO "public"."markets" VALUES ('HOT-DAI', '0xd586fefc58865884d1ba69646c9ed587ce9dd0e6', '18', 'HOT', 'HOT', '0x20318bbD21aD4b0c26c0BD4F3e376DD12B703D16', '18', 'DAI', 'DAI', 0.001000000000000000, 0.00100, 0.00300, 5, 5, 5, 1, 't', NULL, '2019-07-08 03:32:53.874066');
INSERT INTO "public"."markets" VALUES ('WETH-DAI', '0xc778417e063141139fce010982780140aa0cd5ab', '18', 'WETH', 'WETH', '0x20318bbD21aD4b0c26c0BD4F3e376DD12B703D16', '18', 'DAI', 'DAI', 0.001000000000000000, 0.00100, 0.00300, 5, 5, 5, 1, 't', NULL, '2019-07-08 03:32:53.887889');
INSERT INTO "public"."markets" VALUES ('HOT-WETH', '0xd586fefc58865884d1ba69646c9ed587ce9dd0e6', '18', 'HOT', 'HOT', '0xc778417e063141139fce010982780140aa0cd5ab', '18', 'WETH', 'WETH', 0.001000000000000000, 0.00100, 0.00300, 5, 5, 5, 1, 't', NULL, '2019-07-08 03:32:53.888956');
INSERT INTO "public"."markets" VALUES ('WETH-AEUR', '0xc778417e063141139fce010982780140aa0cd5ab', '18', 'WETH', 'WETH', '0x79065a165Ec09E6A89D584a14872802717FE12a3', '2', 'AEUR', 'Augmint EUR', 0.001000000000000000, 0.00100, 0.00300, 2, 2, 5, 1, 't', NULL, '2019-07-08 03:32:53.889658');
COMMIT;

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS "public"."messages";
CREATE TABLE "public"."messages" (
  "id" int4 NOT NULL,
  "seq" int8 NOT NULL,
  "timestamp" int8,
  "size" int4,
  "data" bytea
)
;
ALTER TABLE "public"."messages" OWNER TO "pmker";

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."orders";
CREATE TABLE "public"."orders" (
  "id" int4 NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
  "walletAddress" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tokenId" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "inTxHash" varchar(250) COLLATE "pg_catalog"."default",
  "outTxHash" varchar(250) COLLATE "pg_catalog"."default",
  "amount" varchar(250) COLLATE "pg_catalog"."default",
  "fee" varchar(250) COLLATE "pg_catalog"."default",
  "state" varchar(250) COLLATE "pg_catalog"."default",
  "dateTime" varchar(250) COLLATE "pg_catalog"."default",
  "type" int4 DEFAULT 0,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6)
)
;
ALTER TABLE "public"."orders" OWNER TO "pmker";

-- ----------------------------
-- Table structure for serverinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."serverinfo";
CREATE TABLE "public"."serverinfo" (
  "uniquerow" int4 NOT NULL DEFAULT 1,
  "id" varchar(1024) COLLATE "pg_catalog"."default",
  "proto" bytea,
  "version" int4
)
;
ALTER TABLE "public"."serverinfo" OWNER TO "pmker";

-- ----------------------------
-- Table structure for storelock
-- ----------------------------
DROP TABLE IF EXISTS "public"."storelock";
CREATE TABLE "public"."storelock" (
  "id" varchar(30) COLLATE "pg_catalog"."default",
  "tick" int8 DEFAULT 0
)
;
ALTER TABLE "public"."storelock" OWNER TO "pmker";

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
DROP TABLE IF EXISTS "public"."subscriptions";
CREATE TABLE "public"."subscriptions" (
  "id" int4 NOT NULL,
  "subid" int8 NOT NULL,
  "lastsent" int8 DEFAULT 0,
  "proto" bytea,
  "deleted" bool DEFAULT false
)
;
ALTER TABLE "public"."subscriptions" OWNER TO "pmker";

-- ----------------------------
-- Table structure for subspending
-- ----------------------------
DROP TABLE IF EXISTS "public"."subspending";
CREATE TABLE "public"."subspending" (
  "subid" int8 NOT NULL,
  "row" int8 NOT NULL,
  "seq" int8 DEFAULT 0,
  "lastsent" int8 DEFAULT 0,
  "pending" bytea,
  "acks" bytea
)
;
ALTER TABLE "public"."subspending" OWNER TO "pmker";

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."tokens";
CREATE TABLE "public"."tokens" (
  "symbol" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "address" text COLLATE "pg_catalog"."default" NOT NULL,
  "decimals" int4 NOT NULL,
  "updated_at" timestamp(6),
  "created_at" timestamp(6)
)
;
ALTER TABLE "public"."tokens" OWNER TO "pmker";

-- ----------------------------
-- Records of tokens
-- ----------------------------
BEGIN;
INSERT INTO "public"."tokens" VALUES ('HOT', 'HOT', '0xd586fefc58865884d1ba69646c9ed587ce9dd0e6', 18, NULL, NULL);
INSERT INTO "public"."tokens" VALUES ('DAI', 'DAI', '0x20318bbD21aD4b0c26c0BD4F3e376DD12B703D16', 18, NULL, NULL);
INSERT INTO "public"."tokens" VALUES ('WETH', 'WETH', '0xc778417e063141139fce010982780140aa0cd5ab', 18, NULL, NULL);
INSERT INTO "public"."tokens" VALUES ('AEUR', 'Augmint EUR', '0x79065a165Ec09E6A89D584a14872802717FE12a3', 2, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for trades
-- ----------------------------
DROP TABLE IF EXISTS "public"."trades";
CREATE TABLE "public"."trades" (
  "id" int4 NOT NULL DEFAULT nextval('trades_id_seq'::regclass),
  "transaction_id" int4 NOT NULL,
  "transaction_hash" text COLLATE "pg_catalog"."default",
  "status" text COLLATE "pg_catalog"."default" NOT NULL,
  "market_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "maker" text COLLATE "pg_catalog"."default" NOT NULL,
  "taker" text COLLATE "pg_catalog"."default" NOT NULL,
  "price" numeric(32,18) NOT NULL,
  "amount" numeric(32,18) NOT NULL,
  "taker_side" text COLLATE "pg_catalog"."default" NOT NULL,
  "maker_order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "taker_order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "sequence" int4 NOT NULL DEFAULT 0,
  "executed_at" timestamp(6),
  "updated_at" timestamp(6),
  "created_at" timestamp(6)
)
;
ALTER TABLE "public"."trades" OWNER TO "pmker";

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS "public"."transactions";
CREATE TABLE "public"."transactions" (
  "id" int4 NOT NULL DEFAULT nextval('transactions_id_seq'::regclass),
  "transaction_hash" text COLLATE "pg_catalog"."default",
  "market_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" text COLLATE "pg_catalog"."default" NOT NULL,
  "executed_at" timestamp(6),
  "updated_at" timestamp(6),
  "created_at" timestamp(6)
)
;
ALTER TABLE "public"."transactions" OWNER TO "pmker";

-- ----------------------------
-- Table structure for vite_tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."vite_tokens";
CREATE TABLE "public"."vite_tokens" (
  "id" int4 NOT NULL DEFAULT nextval('vite_tokens_id_seq'::regclass),
  "tokenId" varchar(255) COLLATE "pg_catalog"."default",
  "tokenSymbol" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "type" int4 DEFAULT 0,
  "depositState" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'OPEN'::character varying,
  "withdrawState" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'OPEN'::character varying,
  "depositAddress" varchar(50) COLLATE "pg_catalog"."default",
  "labelName" varchar(32) COLLATE "pg_catalog"."default",
  "label" varchar(32) COLLATE "pg_catalog"."default",
  "minimumDepositAmount" int4 DEFAULT 1,
  "confirmationCount" int4 DEFAULT 20,
  "noticeMsg" varchar(255) COLLATE "pg_catalog"."default",
  "minimumWithdrawAmount" varchar(255) COLLATE "pg_catalog"."default",
  "maximumWithdrawAmount" varchar(255) COLLATE "pg_catalog"."default",
  "gatewayAddress" varchar(255) COLLATE "pg_catalog"."default",
  "fee" int4 DEFAULT 2,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6)
)
;
ALTER TABLE "public"."vite_tokens" OWNER TO "pmker";

-- ----------------------------
-- Records of vite_tokens
-- ----------------------------
BEGIN;
INSERT INTO "public"."vite_tokens" VALUES (1, '1', 'AK47-001', 0, 'OPEN', 'OPEN', '', '', '', 100, 10, 'ADF', NULL, NULL, NULL, 2, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for vitetokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."vitetokens";
CREATE TABLE "public"."vitetokens" (
  "id" int4 NOT NULL DEFAULT nextval('vitetokens_id_seq'::regclass),
  "tokenId" varchar(255) COLLATE "pg_catalog"."default",
  "tokenSymbol" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "type" int4 DEFAULT 0,
  "depositState" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'OPEN'::character varying,
  "withdrawState" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'OPEN'::character varying,
  "depositAddress" varchar(50) COLLATE "pg_catalog"."default",
  "labelName" varchar(32) COLLATE "pg_catalog"."default",
  "label" varchar(32) COLLATE "pg_catalog"."default",
  "minimumDepositAmount" int4 DEFAULT 1,
  "confirmationCount" int4 DEFAULT 20,
  "noticeMsg" varchar(255) COLLATE "pg_catalog"."default",
  "minimumWithdrawAmount" varchar(255) COLLATE "pg_catalog"."default",
  "maximumWithdrawAmount" varchar(255) COLLATE "pg_catalog"."default",
  "gatewayAddress" varchar(255) COLLATE "pg_catalog"."default",
  "fee" int4 DEFAULT 2,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6)
)
;
ALTER TABLE "public"."vitetokens" OWNER TO "pmker";

-- ----------------------------
-- Table structure for wallets
-- ----------------------------
DROP TABLE IF EXISTS "public"."wallets";
CREATE TABLE "public"."wallets" (
  "id" int4 NOT NULL DEFAULT nextval('wallets_id_seq'::regclass),
  "eth_address" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "vite_address" varchar(255) COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6)
)
;
ALTER TABLE "public"."wallets" OWNER TO "pmker";

-- ----------------------------
-- Records of wallets
-- ----------------------------
BEGIN;
INSERT INTO "public"."wallets" VALUES (1, '0x1daC3ba96a2d6CB8a4C50022d3e103De1E9F6d8B', '0', NULL, NULL);
INSERT INTO "public"."wallets" VALUES (2, '0x1560cB7d3a6fcA7b969BEBB70d7b8dF9221D94a6', '1', NULL, NULL);
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dex_orders_id_seq"
OWNED BY "public"."dex_orders"."id";
SELECT setval('"public"."dex_orders_id_seq"', 37, true);
ALTER SEQUENCE "public"."dex_tasktxs_id_seq"
OWNED BY "public"."dex_tasktxs"."id";
SELECT setval('"public"."dex_tasktxs_id_seq"', 2, false);
ALTER SEQUENCE "public"."ethaddress_id_seq"
OWNED BY "public"."ethaddress"."id";
SELECT setval('"public"."ethaddress_id_seq"', 2, false);
ALTER SEQUENCE "public"."launch_logs_id_seq"
OWNED BY "public"."launch_logs"."id";
SELECT setval('"public"."launch_logs_id_seq"', 2, false);
ALTER SEQUENCE "public"."orders_id_seq"
OWNED BY "public"."orders"."id";
SELECT setval('"public"."orders_id_seq"', 2, false);
ALTER SEQUENCE "public"."trades_id_seq"
OWNED BY "public"."trades"."id";
SELECT setval('"public"."trades_id_seq"', 2, false);
ALTER SEQUENCE "public"."transactions_id_seq"
OWNED BY "public"."transactions"."id";
SELECT setval('"public"."transactions_id_seq"', 2, false);
ALTER SEQUENCE "public"."vite_tokens_id_seq"
OWNED BY "public"."vite_tokens"."id";
SELECT setval('"public"."vite_tokens_id_seq"', 2, true);
ALTER SEQUENCE "public"."vitetokens_id_seq"
OWNED BY "public"."vitetokens"."id";
SELECT setval('"public"."vitetokens_id_seq"', 2, false);
ALTER SEQUENCE "public"."wallets_id_seq"
OWNED BY "public"."wallets"."id";
SELECT setval('"public"."wallets_id_seq"', 3, true);

-- ----------------------------
-- Primary Key structure for table SequelizeMeta
-- ----------------------------
ALTER TABLE "public"."SequelizeMeta" ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY ("name");

-- ----------------------------
-- Indexes structure for table channels
-- ----------------------------
CREATE INDEX "idx_channelsname" ON "public"."channels" USING btree (
  (256::name) "pg_catalog"."name_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table channels
-- ----------------------------
ALTER TABLE "public"."channels" ADD CONSTRAINT "channels_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table clients
-- ----------------------------
ALTER TABLE "public"."clients" ADD CONSTRAINT "clients_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table dex_orders
-- ----------------------------
ALTER TABLE "public"."dex_orders" ADD CONSTRAINT "dex_orders_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table dex_tasktxs
-- ----------------------------
ALTER TABLE "public"."dex_tasktxs" ADD CONSTRAINT "dex_tasktxs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table ethaddress
-- ----------------------------
ALTER TABLE "public"."ethaddress" ADD CONSTRAINT "ethaddress_erc20Address_key" UNIQUE ("erc20Address");

-- ----------------------------
-- Primary Key structure for table ethaddress
-- ----------------------------
ALTER TABLE "public"."ethaddress" ADD CONSTRAINT "ethaddress_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table launch_logs
-- ----------------------------
CREATE INDEX "idx_created_at" ON "public"."launch_logs" USING btree (
  "created_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_launch_logs_nonce" ON "public"."launch_logs" USING btree (
  "nonce" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "idx_launch_logs_transaction_hash" ON "public"."launch_logs" USING btree (
  "transaction_hash" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table launch_logs
-- ----------------------------
ALTER TABLE "public"."launch_logs" ADD CONSTRAINT "launch_logs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table markets
-- ----------------------------
ALTER TABLE "public"."markets" ADD CONSTRAINT "markets_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table messages
-- ----------------------------
CREATE INDEX "idx_msgstimestamp" ON "public"."messages" USING btree (
  "timestamp" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table messages
-- ----------------------------
ALTER TABLE "public"."messages" ADD CONSTRAINT "pk_msgkey" PRIMARY KEY ("id", "seq");

-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table serverinfo
-- ----------------------------
ALTER TABLE "public"."serverinfo" ADD CONSTRAINT "serverinfo_pkey" PRIMARY KEY ("uniquerow");

-- ----------------------------
-- Primary Key structure for table subscriptions
-- ----------------------------
ALTER TABLE "public"."subscriptions" ADD CONSTRAINT "pk_subkey" PRIMARY KEY ("id", "subid");

-- ----------------------------
-- Indexes structure for table subspending
-- ----------------------------
CREATE INDEX "idx_subspendingseq" ON "public"."subspending" USING btree (
  "seq" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table subspending
-- ----------------------------
ALTER TABLE "public"."subspending" ADD CONSTRAINT "pk_msgpendingkey" PRIMARY KEY ("subid", "row");

-- ----------------------------
-- Indexes structure for table tokens
-- ----------------------------
CREATE UNIQUE INDEX "idx_tokens_address" ON "public"."tokens" USING btree (
  "address" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tokens
-- ----------------------------
ALTER TABLE "public"."tokens" ADD CONSTRAINT "tokens_pkey" PRIMARY KEY ("symbol");

-- ----------------------------
-- Indexes structure for table trades
-- ----------------------------
CREATE INDEX "idx_market_id_status_executed_at" ON "public"."trades" USING btree (
  "market_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "executed_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_trades_maker" ON "public"."trades" USING btree (
  "maker" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "market_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_trades_taker" ON "public"."trades" USING btree (
  "taker" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "market_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_trades_transaction_hash" ON "public"."trades" USING btree (
  "transaction_hash" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table trades
-- ----------------------------
ALTER TABLE "public"."trades" ADD CONSTRAINT "trades_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table transactions
-- ----------------------------
CREATE UNIQUE INDEX "idx_transactions_transaction_hash" ON "public"."transactions" USING btree (
  "transaction_hash" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table transactions
-- ----------------------------
ALTER TABLE "public"."transactions" ADD CONSTRAINT "transactions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table vite_tokens
-- ----------------------------
ALTER TABLE "public"."vite_tokens" ADD CONSTRAINT "vite_tokens_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table vitetokens
-- ----------------------------
ALTER TABLE "public"."vitetokens" ADD CONSTRAINT "vitetokens_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table wallets
-- ----------------------------
ALTER TABLE "public"."wallets" ADD CONSTRAINT "wallets_eth_address_key" UNIQUE ("eth_address");
ALTER TABLE "public"."wallets" ADD CONSTRAINT "wallets_vite_address_key" UNIQUE ("vite_address");

-- ----------------------------
-- Primary Key structure for table wallets
-- ----------------------------
ALTER TABLE "public"."wallets" ADD CONSTRAINT "wallets_pkey" PRIMARY KEY ("id");
