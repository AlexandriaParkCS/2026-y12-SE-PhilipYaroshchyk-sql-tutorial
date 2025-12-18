import sqlite3
import sys
from pathlib import Path

SQLITE_DB = Path('runtime/db/StarWars.db')

def query_characters():
    """
    Query characters using context manager
    Context managers automatically handle connection closing and commits
    """
    try:
        with sqlite3.connect(SQLITE_DB) as conn:
            print(f"Connected to database")
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM characters LIMIT 5")
            results = cursor.fetchall()
            for row in results:
                print(row)
    except sqlite3.Error as e:
        print(f"Error as {e}")


def test_connection():
    """Test database connection using context manager"""            
    try:
        with sqlite3.connect(SQLITE_DB) as conn:
            print("/ Connection successful!")
            print(f"/ SQLite version: {sqlite3.sqlite_version}")
        print("/ Connection automatically closed")
    except sqlite3.Error as e:
        print(f"X Connection failed: {e}")

# Run the test if __name__ == "__main__":
test_connection()

def get_all_characters():
    """Retrieve all characters from the database"""
    try:
        with sqlite3.connect(SQLITE_DB) as conn:
            # Create cursor
            cursor = conn.cursor()

            # Execute query
            cursor.execute("SELECT id, name, species, homeworld FROM characters")

            # fetch all results
            characters = cursor.fetchall()
        
            # Display results
            print("\n=== All Characters ===")
            for char in characters:
                print(f"ID:{char[0]}, Name: {char[1]}, Species: {char[2]}, Homeworld: {char[3]}")

                print(f"\nTotal characters: {len(characters)}")
            # Connection automatically closes here
    except sqlite3.Error as e:
        print(f"X Error executing query: {e}")

def demonstrate_fetch_methods():
    """Show different ways to fetch data""" 
    try:
        with sqlite3. connect(SQLITE_DB) as conn:
            cursor = conn.cursor()


            # Method 1: fetchone() - Get one row at a time
            print("\n=== fetchone() Demo ===")
            cursor.execute("SELECT name, species FROM characters LIMIT 3")
            row = cursor. fetchone()
            while row:
                print(f"Name: {row[0]}, Species: {row[1]}")
                row = cursor. fetchone()

            # Method 2: fetchmany() - Get specified number of rows
            print("\n=== fetchmany() Demo ===")
            cursor.execute("SELECT name, species FROM characters")
            rows = cursor.fetchmany(5) # Fetch 5 rows
            for row in rows:
                print(f"Name: {row[0]}, Species: {row[1]}")
                # Method 3: fetchall() - Get all remaining rows

            print("\n=== fetchall() Demo ===")
            cursor.execute("SELECT name, height FROM characters WHERE height IS NOT NULL ORDER BY height DESC LIMIT 3")
            all_rows = cursor.fetchall()
            print("Top 3 Tallest Characters:")
            for row in all_rows:
                print(f"{row[0]}: {row[1]}cm")
            # Connection automatically closes here

    except sqlite3. Error as e:
        print(f"X Error: {e}")

def get_characters_as_dict():
    """Get results as dictionaries instead of tuples""" 
    try:
        with sqlite3.connect(SQLITE_DB) as conn:
            # Set row factory to return dictionary-like objects
            conn. row_factory = sqlite3.Row
            cursor = conn. cursor()

            cursor.execute("SELECT name, species, height FROM characters WHERE height IS NOT NULL ORDER BY height DESC LIMIT 5")
            characters = cursor.fetchall()

            print("\n=== Characters as Dictionaries ===")
            for char in characters:
                # Access by column name instead of index!
                print(f"{char['name']} ({char['species']}): {char['height']}cm")
            # Connection automatically closes here


    except sqlite3.Error as e:
        print(f"X Error: {e}")

def search_character_safe (name):
    """SAFE: Uses parameterised query""" 
    try:
        with sqlite3.connect(SQLITE_DB) as conn:
            conn.row_factory = sqlite3.Row
            cursor = conn.cursor()
            
            # Use ? placeholder and pass parameters as tuple
            cursor.execute("SELECT name, species, homeworld FROM characters WHERE name = ?", (name,))

            results = cursor.fetchallo
            return results
            # Connection automatically closes here
    
    except sqlite3. Error as e:
        print(f"X Error: {e}")
        return []

def search_by_species(species):
    """Search characters by species using parameterised query""" 
    try:
        with sqlite3.connect(SQLITE_DB) as conn:
            conn.row_factory = sqlite3.Row
            cursor = conn.cursor()
            
            # Multiple parameters
            cursor.execute("""
                SELECT name, species, height
                FROM characters
                WHERE species = ? AND height IS NOT NULL
                ORDER BY height DESC
                """, (species,))

            results = cursor.fetchall()
                
            print(f"\n=== {species} Characters ===")
            for char in results:
                print(f"{char['name']}: {char['height']}cm")
            # Connection automatically closes here

    except sqlite3. Error as e:
        print(f"X Error: {e}")

def add_character(name, species, homeworld_id, height=None):
    """"
    Create: Add a new character to the database
    """      
    try:
        with sqlite3. connect(SQLITE_DB) as conn:
            cursor = conn.cursor()
            cursor.execute("""
                INSERT INTO characters (name, species, homeworld_id, height)
                VALUES (?, ?, ?, ?)
            """, (name, species, homeworld_id, height))
        
            # Commit happens automatically with context manager!
            print(f"/ Added character: {name}")
            return True

    except sqlite3. Error as e:
        print(f"X Error adding character: {e}")
        return False
        # Rollback happens automatically
                        
def update_character_height(name, new_height):
    """
    Update: Change a character's height
    """
    try:
        with sqlite3. connect(SQLITE_DB) as conn:
            cursor = conn.cursor()



            cursor.execute("""
                UPDATE characters
                SET height = ?
                WHERE name = ?
            """, (new_height, name))
            
            # Commit happens automatically

            if cursor. rowcount > 0:
                print(f"/ Updated {cursor.rowcount} character(s)")
                return True
            else:
                print(f"X No character found with name: {name}")
                return False

    except sqlite3. Error as e:
        print(f"X Error updating character: {e}")
        return False
        # Rollback happens automatically

def delete_character(name) :
    """
    Delete: Remove a character from the database
    """
    try:
        with sqlite3. connect(SQLITE_DB) as conn:
            cursor = conn.cursor()
            cursor.execute("DELETE FROM characters WHERE name = ?", (name, ))
            
            # Commit happens automatically
            
            if cursor.rowcount > 0:
                print(f"/ Deleted character: {name}")
                return True
            else:
                print(f"X No character found with name: {name}")
                return False
    
    except sqlite3. Error as e:
        print(f"X Error deleting character: {e}")
        return False
        # Rollback happens automatically


def get_character_statistics():
    """
    Read: Get database statistics
    """
    try:
        with sqlite3. connect(SQLITE_DB) as conn:
            cursor = conn.cursor()

            # Get counts
            cursor.execute("SELECT COUNT(*) FROM characters")
            total_chars = cursor.fetchone()[0]
            
            cursor.execute("SELECT COUNT(DISTINCT species) FROM characters")
            total_species = cursor.fetchone()[0]

            cursor.execute("SELECT AVG(height) FROM characters WHERE height IS NOT NULL")
            avg_height = cursor.fetchone()[0]
            
            print("\n=== Database Statistics ===")
            print(f"Total Characters: {total_chars}")
            print(f"Different Species: {total_species}")
            print(f"Average Height: {avg_height:.1f}cm")
            # Connection automatically closes here
            
            
    except sqlite3. Error as e:
        print(f"X Error: {e}")

def main():
    """Main program menu"""
    print("=" * 50)
    print("STAR WARS DATABASE - PYTHON INTERFACE")
    print("=" * 50)
    
    # Run demonstrations
    print("\n--- Testing Connection ---")
    test_connection()
    
    print("\n--- All Characters ---")
    get_all_characters()


    print("\n-- Fetch Methods ---")
    demonstrate_fetch_methods()

    print("\n--- Dictionary Access —--")
    get_characters_as_dict()

    print("|n--- Search by Species ---")
    search_by_species ("Human")

    print("\n--- Database Statistics --")
    get_character_statistics()
    
    print("\n--- CRUD Operations Demo ---")
    
    
    # Add a test character
    add_character("Test Character", "Test Species", 1, 175)
    
    # Update the character
    update_character_height("Test Character", 180)

    # Delete the character
    delete_character("Test Character")

    print("\n" + "=" * 50)
    print("Demo complete!")
    print("=" * 50)

if __name__ == "__main__":
    main()

