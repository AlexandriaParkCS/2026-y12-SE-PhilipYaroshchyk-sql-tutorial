# SQL, ORM and NoSQL Comparison

**Student Name:** Philip Yaroshchyk
**Date:** 18 December 2025

## 1. SQL (Structured Query Language)
### What is it?
Structured Query Language (SQL) is a programming language that is used to interact and manage data in relational databases.

### Advantages
1. Performance - useful when need to use optimised queries
2. ACID transactions support
3. See exactly what is executed in the database
4. Universal - works everwhere

### Disadvantages
1. Manual connection handling
2. No autocomplete or type checking
3. Manual relationship handling

### When to use
When application uses structured data, needs custom queries and when performance is critical. When ACID support is required. 

### Example Query
```sql
SELECT 
    characters.name AS character_name,
    characters.species,
    planets.name AS homeworld_name,
    planets.climate
FROM characters 
INNER JOIN planets ON characters.homeworld_id = planets.id 
WHERE planet.name = 'Tatooine';
```

## 2. ORM (Object-Relational Mapping)
### What is it?
Object-Relational Mapping (ORM) is a technique that lets you interact with the database using objects that represent database tables.

### Advantages
1. Less code - could be simpler to understand
2. Object-oriented - works with Python objects
3. Database agnostic - same code can work with many database types
4. IDE support - autocomplete 
5. Relationship mapping - easier to join tables

### Disadvantages
1. Performance - can be less efficient than SQL
2. Complex queries - can be hard to create custom complex queries
3. Less control - hard to optimise queries

### When to use

When application does not need to use custom complex database logic, has to be developed fast, and might need to swith databases.

### Example Code

```python
characters = session.query(Character).join(Planet).filter(Planet.homeworld == 'Tatooine').all()
```

## 3. NoSQL (Document Database) 
### What is it?
Not Only SQL (NoSQL) is a non-relational database, which includes document databases, key-values stores, column-family stores and graph databases  

### Advantages
1. Flexible schema - can have different fields
2. All data in one place - no need to join tables
3. Scales horizontally
4. Fast access of large data


### Disadvantages
1. Lots of data duplication
2. Complex queries are not effecient
3. No ACID support


### When to use
1. Schema changes frequently
2. Large volume of data
3. Performance is critical
4. Unstructured or semi-structured data


### Example Document Structure

```json
{
    "_id": "0897879879878977",
    "homeworld": {
        "name": "Tatooine",
        "climate": "arid",
        "population": 20000
    },
    "vehicles": [
        {
            "name": "X-wing",
            "class": "Starfighter"
        }
    ]
}
```

## 4. My Recommendation

For the Star Wars Database project, I would choose:
ORM because:
1. It is easier to use with python and access records as python objects
2. Database is not very large and ORM performance is acceptable
3. ORM supports the queries required for the project


## 5. Real-World Example

**Application:** Social Media app  
**Best Choice:** NoSQL  
**Reasoning:**  
1. Support for changing schema/unstructured data
2. Support for large data volume
3. Horizontally scalable

## Reflection questions

1. **What surprised you most about ORMs?**
That you don't need to know SQL language to use databases

2. **Can you think of a situation where NoSQL would be better than SQL?**
When application needs to support huge volume of data and ACID properties 

3. **For a school project, which would you choose and why?**
For a school project I would likely choose ORM because I plan to use a relational database. The use of ORM should make it easier to use database with Python objects.

