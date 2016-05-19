
# PROTO_SPACE

## TABLES

**prototypes**  
**users**  
**comments**  
**images**  
**likes**  

## ASOSSIATIONS

- prototypes
    - has_many :images
    - has_many :comments
    - has_many :likes
    - belongs_to :user

- users
    - has_many :prototypes
    - has_many :comments
    - has_many :likes

- comments
    - belongs_to :prototype
    - belongs_to :user

- images
    - belongs_to :prototype

- likes
    - belongs_to :prototype
    - belongs_to :user

## COLUMNS

**prototypes_table**

|id|title|catch_copy|concept|user_id|
|----|----|----|----|----|
|integer|string|text|text|integer|

**users_table**

|id|name|email|password|avatar|member|works|profile|
|----|----|----|----|----|----|----|----|
|integer|string|string|string|text|string|text|text|

**comments_table**

|id|text|prototype_id|user_id|
|----|----|----|----|
|integer|text|integer|integer|

**images_table**

|id|image|prototype_id|role|
|----|----|----|----|
|integer|text|integer|integer|

**likes_table**

|id|prototype_id|user_id|
|----|----|----|
|integer|integer|integer|
