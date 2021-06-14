# README

* bin/rails db:create
* bin/rails db:schema:load
* bin/rails test

SEQUENCE OF SQL STATEMENTS
```
BEGIN
ALTER TABLE "ar_internal_metadata" DISABLE TRIGGER ALL;ALTER TABLE "schema_migrations" DISABLE TRIGGER ALL;ALTER TABLE "users" DISABLE TRIGGER ALL
COMMIT
BEGIN
DELETE FROM "users";
INSERT INTO "users" ("id", "name", "age", "created_at", "updated_at", "is_minor") VALUES (1065975101, 'John', 18, '2021-06-14 05:05:21.819396', '2021-06-14 05:05:21.819396', DEFAULT), (439284353, 'Jeff', 22, '2021-06-14 05:05:21.819396', '2021-06-14 05:05:21.819396', DEFAULT), (124551488, 'Amy', 1, '2021-06-14 05:05:21.819396', '2021-06-14 05:05:21.819396', DEFAULT)
ROLLBACK
```

```Error:
UserTest#test_users_age:
ActiveRecord::StatementInvalid: PG::SyntaxError: ERROR:  cannot insert into column "is_minor"
DETAIL:  Column "is_minor" is a generated column.```


* In fixtures/users.yml - delete two of the fixtures (minor and baby) so there is only one (adult) remaining.
* bin/rails test

SEQUENCE OF SQL STATEMENTS
```
BEGIN
ALTER TABLE "ar_internal_metadata" DISABLE TRIGGER ALL;ALTER TABLE "schema_migrations" DISABLE TRIGGER ALL;ALTER TABLE "users" DISABLE TRIGGER ALL
COMMIT
BEGIN
DELETE FROM "users";
INSERT INTO "users" ("id", "name", "age", "created_at", "updated_at") VALUES (439284353, 'Jeff', 22, '2021-06-14 05:04:32.530461', '2021-06-14 05:04:32.530461')
COMMIT
BEGIN
ALTER TABLE "ar_internal_metadata" ENABLE TRIGGER ALL;ALTER TABLE "schema_migrations" ENABLE TRIGGER ALL;ALTER TABLE "users" ENABLE TRIGGER ALL
COMMIT
BEGIN
ROLLBACK
```

TEST OUTPUT
```
Finished in 0.029992s, 33.3422 runs/s, 33.3422 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```
