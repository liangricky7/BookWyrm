use library; 

CREATE TABLE IF NOT EXISTS Genre (
    genre VARCHAR(100) PRIMARY KEY,
    description TEXT
);

CREATE TABLE IF NOT EXISTS Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY ,
    title VARCHAR(255),
    summary TEXT,
    reading_age INT,
    dewey_decimal VARCHAR(10),
    series VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Prequel (
    book_id INT,
    prequel_id INT,
    PRIMARY KEY (book_id, prequel_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (prequel_id) REFERENCES Book(book_id)
);

CREATE TABLE IF NOT EXISTS Sequel (
    book_id INT,
    sequel_id INT,
    PRIMARY KEY (book_id, sequel_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (sequel_id) REFERENCES Book(book_id)
);

CREATE TABLE IF NOT EXISTS Author (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    biography TEXT,
    date_of_birth DATE,
    country_of_origin VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Narrator (
    narrator_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    biography TEXT,
    date_of_birth DATE,
    country_of_origin VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    status ENUM('Active', 'Inactive', 'Retired', 'Terminated'),
    position VARCHAR(100),
    hire_date DATE,
    leave_date DATE,
    date_of_birth DATE,
    street_number INT,
    street_name VARCHAR(100),
    apt_number INT,
    city VARCHAR(100),
    state CHAR(2),
    zip INT
);

CREATE TABLE IF NOT EXISTS Customer (
    card_number INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    status ENUM('Suspended', 'Overdue', 'Active', 'Expired'),
    registration_date DATE,
    street_number INT,
    street_name VARCHAR(100),
    apt_number INT,
    city VARCHAR(100),
    state CHAR(2),
    zip INT
);

CREATE TABLE IF NOT EXISTS Publication (
    publication_id INT PRIMARY KEY,
    edition VARCHAR(100),
    format ENUM('Hardcover', 'Paperback', 'Ebook', 'Audiobook'),
    language VARCHAR(50),
    publisher VARCHAR(255),
    copy_id INT,
    book_id INT,
    isbn VARCHAR(13),
    publication_date DATE,
    page_count INT,
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

CREATE TABLE IF NOT EXISTS Loan (
    loan_id INT PRIMARY KEY,
    employee_id INT,
    card_number INT,
    late_fee DECIMAL(5, 2),
    checkout_date DATE,
    due_date DATE,
    return_date DATE,
    renewal_count INT
);

CREATE TABLE IF NOT EXISTS Copy (
    copy_id INT PRIMARY KEY,
    condition_type ENUM('New', 'Good', 'Worn', 'Damaged'),
    price DECIMAL(10, 2),
    status ENUM('Available', 'Checked Out', 'Reserved', 'Processing'),
    location VARCHAR(255),
    reservations BOOLEAN,
    loan_id INT,
    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id)
);

-- Many-to-many relationships tables
CREATE TABLE IF NOT EXISTS Book_Genre (
    book_id INT,
    genre VARCHAR(100),
    PRIMARY KEY (book_id, genre),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (genre) REFERENCES Genre(genre)
);

CREATE TABLE IF NOT EXISTS Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

CREATE TABLE IF NOT EXISTS Publication_Narrator (
    publication_id INT,
    edition VARCHAR(100),
    format ENUM('Hardcover', 'Paperback', 'Ebook', 'Audiobook'),
    language VARCHAR(50),
    publisher VARCHAR(255),
    narrator_id INT,
    PRIMARY KEY (edition, format, language, publisher, narrator_id),
    FOREIGN KEY (publication_id) REFERENCES Publication(publication_id),
    FOREIGN KEY (narrator_id) REFERENCES Narrator(narrator_id)
);


INSERT INTO Genre (genre, description) VALUES
('Fantasy', 'Books that contain magical elements and fantastical creatures'),
('Science Fiction', 'Books based on futuristic technology or speculative science'),
('Mystery', 'Books focusing on solving a crime or unraveling a puzzle'),
('Romance', 'Books that explore love stories between characters'),
('Non-Fiction', 'Books that are based on real events or factual information'),
('Historical Fiction', 'Books set in a specific historical period'),
('Thriller', 'Books that are intense, suspenseful, and filled with excitement'),
('Horror', 'Books designed to evoke fear and suspense'),
('Adventure', 'Books focused on exciting and dangerous journeys or quests'),
('Biography', 'Books that tell the story of a persons life'),
('Poetry', 'Books containing written works in verse form'),
('Self-Help', 'Books offering advice or guidance on personal development'),
('Cookbook', 'Books with recipes and cooking tips'),
('Art', 'Books discussing different forms of art, artists, and techniques'),
('Philosophy', 'Books exploring fundamental questions about existence, knowledge, and ethics'),
('Drama', 'Books that focus on conflict and emotion through dialogue and performance');

INSERT INTO Book (book_id, title, summary, reading_age, dewey_decimal, series) VALUES
(1, 'The Last Wizard', 'A young wizard embarks on a quest to save his kingdom.', 12, '823.92', 'The Wizard''s Journey'),
(2, 'Space Adventures', 'A group of astronauts explores a distant planet.', 14, '520.92', 'Galactic Voyages'),
(3, 'The Silent Witness', 'A detective investigates a crime with no apparent clues.', 16, '364.15', 'The Detective Chronicles'),
(4, 'Love in the City', 'A love story set in the heart of New York City.', 18, '813.54', 'City of Hearts'),
(5, 'The Real World', 'A collection of true stories from around the world.', 18, '909.8', 'Stories of Our Time'),
(6, 'The Secret Diary', 'A young girl uncovers secrets hidden in her grandmother''s diary.', 12, '823.91', 'Family Mysteries'),
(7, 'The Haunted House', 'A group of friends spends the night in a haunted house.', 16, '813.55', 'Nightmare Series'),
(8, 'The Lost Kingdom', 'An ancient kingdom is rediscovered after centuries of being lost.', 14, '920.02', 'Legends of the Past'),
(9, 'The Dragon''s Flame', 'A young knight must defeat a dragon to save his kingdom.', 12, '823.92', 'The Knights'' Quest'),
(10, 'Moonlight Journey', 'A group of explorers venture to the moon in the 22nd century.', 14, '629.45', 'Beyond Earth'),
(11, 'Murder in Paris', 'A detective investigates a high-profile murder in Paris.', 18, '364.1', 'Mystery Abroad'),
(12, 'The Perfect Match', 'A couple struggles to make their relationship work while facing challenges.', 18, '813.54', 'Heartstrings'),
(13, 'The Secret of the Lost City', 'An archaeologist uncovers an ancient city hidden in the jungle.', 16, '932.02', 'Secrets of the Past'),
(14, 'The Time Traveler''s Journal', 'A time traveler documents their adventures through history.', 14, '909.3', 'Chronicles of Time'),
(15, 'Poems of the Soul', 'A collection of heartfelt and personal poetry by a renowned poet.', 18, '811.54', 'Writings of a Dreamer'),
(16, 'How to Cook Like a Chef', 'Step-by-step guide to cooking delicious meals from scratch.', 14, '641.5', 'Cooking Mastery'),
(17, 'The Artist''s Vision', 'An exploration of different art techniques from classical to modern.', 16, '701.1', 'The Art Series'),
(18, 'The Great Minds', 'A look at the lives of the greatest philosophers throughout history.', 18, '180.9', 'Philosophical Thoughts'),
(19, 'A Night in the Theatre', 'A play set in a grand theatre, unraveling a tale of suspense.', 18, '822.33', 'Theatrical Tales'),
(20, 'Life Behind Bars', 'A biography of an individual who served time in prison and rebuilt their life.', 18, '920.02', 'True Stories of Transformation'),
(21, 'The Ocean''s Secret', 'An adventure story about a mysterious island and hidden treasures.', 14, '813.54', 'Adventures of the Sea'),
(22, 'The Spy Who Knew Too Much', 'A spy is forced to confront their past as they get deeper into a covert operation.', 16, '355.02', 'Spies and Shadows'),
(23, 'Walking with Giants', 'The biography of an influential political leader in the 20th century.', 18, '920.02', 'Historical Leaders'),
(24, 'The Snowy Mountain', 'A family embarks on a journey to find their missing father in the Himalayas.', 12, '923.91', 'Family Adventures'),
(25, 'The Martian Chronicles', 'A journey to Mars where humans must adjust to life on an alien planet.', 15, '813.54', 'Mars Expedition'),
(26, 'Wizards and Wands', 'A young wizard goes on a quest to stop an evil sorcerer from taking over the world.', 14, '823.92', 'The Magic Wars'),
(27, 'The Forgotten Kingdom', 'A lost kingdom is rediscovered, and its secrets must be unlocked to save the world.', 16, '933.02', 'The Lost Realms'),
(28, 'Love in Paris', 'A romantic journey through Paris, filled with twists and turns in a blossoming love story.', 18, '843.91', 'Parisian Romance'),
(29, 'The Clockmaker''s Secret', 'A clockmaker is caught up in an intricate mystery involving stolen timepieces and murder.', 16, '364.15', 'Secrets of the Clockmaker'),
(30, 'The Haunting of Hawthorn Manor', 'A chilling tale of a haunted mansion and the dark past it hides.', 18, '813.54', 'Spine-Chilling Tales'),
(31, 'The Escape Plan', 'A thrilling story about a group of prisoners plotting an escape from an inescapable prison.', 16, '813.54', 'Escaping Darkness'),
(32, 'The Ghost Ship', 'A chilling tale of a haunted ship that appears only once every hundred years.', 14, '823.92', 'Ghostly Legends'),
(33, 'The Case of the Missing Heiress', 'A detective investigates the disappearance of a young woman from a wealthy family.', 16, '364.15', 'Mystery Chronicles'),
(34, 'Magic in the Air', 'A fantastical story of a young girl who discovers she has the ability to control the wind.', 14, '823.92', 'The Elemental Magic Series'),
(35, 'The Robot Rebellion', 'In a futuristic world, robots rise against their human creators and the struggle for survival begins.', 15, '629.8', 'Robot Wars'),
(36, 'The Shadow of the Dragon', 'A young hero faces his greatest challenge when an ancient dragon awakens from its slumber.', 14, '823.92', 'Dragons of the North'),
(37, 'The Secret of Atlantis', 'A team of researchers discovers the location of Atlantis and uncovers secrets that could change history.', 18, '938.04', 'Lost Civilizations'),
(38, 'The Silent Killer', 'A medical thriller where a deadly virus threatens to wipe out humanity.', 18, '614.5', 'Virus Outbreak'),
(39, 'The Last Prophecy', 'A young girl must fulfill a prophecy that will determine the fate of the world.', 16, '823.92', 'Prophecies of Destiny'),
(40, 'The City Beneath the Sea', 'An underwater city is discovered, and its inhabitants face an ancient curse.', 14, '999.9', 'Mysteries of the Deep');

INSERT INTO Author (author_id, first_name, last_name, biography, date_of_birth, country_of_origin) VALUES
(1, 'J.K.', 'Rowling', 'Author of the Harry Potter series and other fantasy works.', '1965-07-31', 'United Kingdom'),
(2, 'Isaac', 'Asimov', 'Author known for his works in science fiction and popular science.', '1920-01-02', 'United States'),
(3, 'Agatha', 'Christie', 'Known for her detective novels and short stories.', '1890-09-15', 'United Kingdom'),
(4, 'Nicholas', 'Sparks', 'Author of romantic novels, many of which have been adapted into films.', '1965-12-31', 'United States'),
(5, 'Malcolm', 'Gladwell', 'Journalist and author of books on sociology and psychology.', '1963-09-03', 'United States'),
(6, 'Stephen', 'King', 'Master of horror fiction, with many books turned into movies.', '1947-09-21', 'United States'),
(7, 'J.R.R.', 'Tolkien', 'Author of The Lord of the Rings and other fantasy works.', '1892-01-03', 'United Kingdom'),
(8, 'Dan', 'Brown', 'Author known for his Robert Langdon novels like The Da Vinci Code.', '1964-06-22', 'United States'),
(9, 'Mark', 'Twain', 'Famous author and humorist, best known for "The Adventures of Tom Sawyer."', '1835-11-30', 'United States'),
(10, 'Jane', 'Austen', 'Author of romantic novels, including "Pride and Prejudice."', '1775-12-16', 'United Kingdom'),
(11, 'George', 'Orwell', 'Known for his works on social injustice, including "1984" and "Animal Farm."', '1903-06-25', 'United Kingdom'),
(12, 'Emily', 'Dickinson', 'Reclusive poet known for her unique style of writing and her exploration of death and immortality.', '1830-12-10', 'United States'),
(13, 'Charles', 'Dickens', 'Famous Victorian novelist and social critic, best known for "A Tale of Two Cities" and "Oliver Twist.".', '1812-02-07', 'United Kingdom'),
(14, 'Leo', 'Tolstoy', 'Russian author, most famous for "War and Peace" and "Anna Karenina."', '1828-09-09', 'Russia'),
(15, 'Virginia', 'Woolf', 'Author and modernist, best known for "Mrs Dalloway" and "To the Lighthouse."', '1882-01-25', 'United Kingdom'),
(16, 'William', 'Shakespeare', 'The greatest playwright in English literature, author of "Hamlet" and "Macbeth."', '1564-04-23', 'United Kingdom'),
(17, 'Ernest', 'Hemingway', 'American novelist, journalist, and short story writer, known for "The Old Man and the Sea."', '1899-07-21', 'United States'),
(18, 'F. Scott', 'Fitzgerald', 'Author of "The Great Gatsby," exploring themes of the American Dream.', '1896-09-24', 'United States'),
(19, 'Harper', 'Lee', 'Author of the Pulitzer Prize-winning novel "To Kill a Mockingbird."', '1926-04-28', 'United States'),
(20, 'J.R.R.', 'Tolkien', 'Author of "The Hobbit" and "The Lord of the Rings" series.', '1892-01-03', 'United Kingdom'),
(21, 'H.G.', 'Wells', 'Pioneering author in science fiction, best known for "The War of the Worlds."', '1866-09-21', 'United Kingdom'),
(22, 'Agatha', 'Christie', 'Best-selling mystery author, known for creating Hercule Poirot and Miss Marple.', '1890-09-15', 'United Kingdom'),
(23, 'J.K.', 'Rowling', 'Author of the internationally famous Harry Potter series.', '1965-07-31', 'United Kingdom'),
(24, 'Isaac', 'Asimov', 'Renowned for his works in science fiction, especially the Foundation series.', '1920-01-02', 'United States'),
(25, 'George', 'R.R. Martin', 'Author of "A Song of Ice and Fire," the inspiration for the "Game of Thrones" series.', '1948-09-20', 'United States'),
(26, 'Stephen', 'King', 'The master of horror, with bestselling books like "The Shining" and "It."', '1947-09-21', 'United States'),
(27, 'Agatha', 'Christie', 'Best-selling author known for her detective novels and the creation of Hercule Poirot.', '1890-09-15', 'United Kingdom'),
(28, 'J.R.R.', 'Tolkien', 'Author of "The Hobbit" and "The Lord of the Rings," foundational works of fantasy.', '1892-01-03', 'United Kingdom'),
(29, 'C.S.', 'Lewis', 'Author of "The Chronicles of Narnia" and other works blending fantasy and Christian themes.', '1898-11-29', 'United Kingdom'),
(30, 'Haruki', 'Murakami', 'Author of surreal novels, including "Norwegian Wood" and "Kafka on the Shore."', '1949-01-12', 'Japan'),
(31, 'Dan', 'Brown', 'Author of the Robert Langdon series, including "The Da Vinci Code." and "Angels and Demons."', '1964-06-22', 'United States'),
(32, 'Margaret', 'Atwood', 'Author of dystopian fiction, including "The Handmaid''s Tale" and "Oryx and Crake."', '1939-11-18', 'Canada');

INSERT INTO Narrator (narrator_id, first_name, last_name, biography, date_of_birth, country_of_origin) VALUES
(1, 'Jim', 'Dale', 'Award-winning narrator known for his work on Harry Potter audiobooks.', '1948-08-15', 'United States'),
(2, 'Kate', 'Reading', 'Narrator of many fantasy and science fiction audiobooks.', '1962-10-17', 'United States'),
(3, 'David', 'Tennant', 'Famous for narrating a variety of audiobooks, including mystery novels.', '1971-04-18', 'United Kingdom'),
(4, 'Morgan', 'Freeman', 'Narrator with a distinct voice, known for his work in films and audiobooks.', '1937-06-01', 'United States'),
(5, 'Tiffany', 'Doyon', 'Narrator specializing in romance and young adult fiction.', '1985-09-21', 'United States'),
(6, 'Simon', 'Vance', 'Experienced audiobook narrator with a diverse range of genres.', '1957-04-24', 'United Kingdom'),
(7, 'Barbara', 'Rosenblat', 'Known for narrating historical fiction and memoirs.', '1946-03-01', 'United States'),
(8, 'George', 'Guidall', 'Veteran narrator known for his deep voice and work on mystery novels.', '1949-03-15', 'United States'),
(9, 'Kate', 'Reading', 'Narrator of many fantasy audiobooks, known for her voice acting skills.', '1962-10-17', 'United States'),
(10, 'David', 'Tennant', 'Known for narrating detective and mystery audiobooks with his signature voice.', '1971-04-18', 'United Kingdom'),
(11, 'Michael', 'Beck', 'Narrator who has worked on a variety of genres, including thriller and drama.', '1951-02-04', 'United States'),
(12, 'Sarah', 'Baker', 'Renowned for her performances in children''s audiobooks and family-friendly content.', '1980-11-09', 'United States'),
(13, 'Simon', 'Vance', 'Narrator with decades of experience in audiobooks, known for his work in historical fiction.', '1957-04-24', 'United Kingdom'),
(14, 'Barbara', 'Rosenblat', 'Voice actress known for her work on memoirs and literary works.', '1946-03-01', 'United States'),
(15, 'George', 'Guidall', 'Narrator with decades of experience in mystery and thriller books.', '1949-03-15', 'United States'),
(16, 'Jim', 'Dale', 'Famous for narrating the Harry Potter series in audiobook form.', '1948-08-15', 'United States'),
(17, 'Miri', 'Ben-Ari', 'Narrator known for narrating fantasy novels and works with strong female leads.', '1991-06-07', 'United States'),
(18, 'Derek', 'Jacobi', 'Voice actor and narrator known for his distinguished British accent in historical fiction audiobooks.', '1938-10-22', 'United Kingdom'),
(19, 'Tanya', 'Eby', 'Narrator known for her work in romance novels and contemporary fiction.', '1973-04-13', 'United States'),
(20, 'Stephen', 'Fry', 'Narrator with a distinct voice, best known for reading the Harry Potter series in the UK.', '1957-08-24', 'United Kingdom'),
(21, 'LeVar', 'Burton', 'Actor and narrator who is well-known for his role in "Reading Rainbow" and narrating sci-fi audiobooks.', '1957-02-16', 'United States'),
(22, 'Rosalyn', 'Landor', 'A versatile narrator with a vast catalog, particularly known for literary and historical fiction.', '1945-05-06', 'United States');

INSERT INTO Employee (employee_id, first_name, last_name, email, phone_number, status, position, hire_date, leave_date, date_of_birth, street_number, street_name, apt_number, city, state, zip) VALUES
(1, 'John', 'Doe', 'johndoe@library.com', '555-1234', 'Active', 'Librarian', '2020-05-10', NULL, '1985-03-12', 101, 'Main St', 0, 'Los Angeles', 'CA', 90001),
(2, 'Jane', 'Smith', 'janesmith@library.com', '555-5678', 'Active', 'Assistant Librarian', '2021-06-15', NULL, '1990-07-20', 202, 'Broadway', 1, 'New York', 'NY', 10001),
(3, 'Michael', 'Johnson', 'michaelj@library.com', '555-9876', 'Retired', 'Library Manager', '2015-03-25', '2023-03-15', '1970-01-30', 303, 'First Ave', 2, 'Chicago', 'IL', 60601),
(4, 'Emily', 'Jones', 'emilyjones@library.com', '555-4321', 'Inactive', 'Senior Librarian', '2018-08-01', '2024-02-25', '1980-05-10', 404, 'Sunset Blvd', 3, 'Seattle', 'WA', 98101),
(5, 'Andrew', 'Lee', 'andrewlee@library.com', '555-8765', 'Active', 'Library Assistant', '2022-09-25', NULL, '1995-04-15', 505, 'Oakwood St', 8, 'Chicago', 'IL', 60611),
(6, 'Sarah', 'Martinez', 'sarahmartinez@library.com', '555-2345', 'Retired', 'Librarian', '2010-07-20', '2023-12-15', '1972-11-11', 606, 'River Rd', 12, 'Miami', 'FL', 33103),
(7, 'Rebecca', 'Taylor', 'rebeccataylor@library.com', '555-3456', 'Active', 'Assistant Librarian', '2022-05-10', NULL, '1994-08-22', 657, 'Pine St', 4, 'Portland', 'OR', 97201),
(8, 'John', 'Mitchell', 'johnmitchell@library.com', '555-8765', 'Active', 'Library Technician', '2023-01-15', NULL, '1986-02-10', 809, 'Cedar Ln', 7, 'Austin', 'TX', 73301),
(9, 'Katherine', 'Harris', 'katherineharris@library.com', '555-5432', 'Inactive', 'Senior Librarian', '2015-11-02', '2024-02-10', '1980-06-09', 156, 'Sunset Blvd', 15, 'San Diego', 'CA', 92101);

INSERT INTO Customer (card_number, first_name, last_name, email, phone_number, status, registration_date, street_number, street_name, apt_number, city, state, zip) VALUES
(1001, 'Alice', 'Brown', 'alicebrown@example.com', '555-1001', 'Active', '2022-01-10', 100, 'Park Ave', 5, 'Los Angeles', 'CA', 90005),
(1002, 'Bob', 'White', 'bobwhite@example.com', '555-1002', 'Suspended', '2023-03-12', 200, 'Maple St', 10, 'San Francisco', 'CA', 94110),
(1003, 'Charlie', 'Davis', 'charliedavis@example.com', '555-1003', 'Overdue', '2021-08-01', 300, 'Oak St', 7, 'Miami', 'FL', 33101),
(1004, 'Emily', 'Clark', 'emilyclark@example.com', '555-2003', 'Active', '2023-03-30', 101, 'Maple St', NULL, 'Portland', 'OR', 97205),
(1005, 'Daniel', 'Green', 'danielgreen@example.com', '555-3049', 'Suspended', '2023-08-22', 212, 'Birch Rd', NULL, 'Los Angeles', 'CA', 90001),
(1006, 'Sophia', 'Lopez', 'sophialopez@example.com', '555-9786', 'Active', '2024-01-15', 333, 'Pine Ave', NULL, 'Dallas', 'TX', 75201),
(1007, 'Rachel', 'White', 'rachelwhite@example.com', '555-6542', 'Expired', '2022-04-14', 987, 'Cedar Ln', NULL, 'Boston', 'MA', 02115),
(1008, 'James', 'Brown', 'jamesbrown@example.com', '555-7890', 'Overdue', '2023-10-01', 234, 'Elm St', NULL, 'San Francisco', 'CA', 94102),
(1009, 'Brian', 'Morris', 'brianmorris@example.com', '555-2222', 'Suspended', '2023-09-10', 1001, 'River St', NULL, 'Chicago', 'IL', 60614),
(1010, 'Charlotte', 'Baker', 'charlottebaker@example.com', '555-3022', 'Active', '2024-01-25', 202, 'Maple Ave', NULL, 'Dallas', 'TX', 75202),
(1011, 'Michael', 'Adams', 'michaeladams@example.com', '555-5003', 'Active', '2023-12-15', 322, 'Redwood Rd', NULL, 'Miami', 'FL', 33101);

INSERT INTO Publication (publication_id, edition, format, language, publisher, copy_id, book_id, isbn, publication_date, page_count) VALUES
(1, 'First Edition', 'Hardcover', 'English', 'Penguin Books', 1, 1, '9780143127741', '2023-06-01', 350),
(2, 'Second Edition', 'Paperback', 'English', 'Harper Collins', 2, 2, '9780061995753', '2022-03-15', 420),
(3, 'Audiobook', 'Audiobook', 'English', 'Audible', 3, 3, '9781491582739', '2023-05-10', 600),
(4, 'Audiobook', 'Audiobook', 'English', 'Not Audible But Another Company', 6, 6, '9781491186427', '2023-05-10', 600),
(5, 'First Edition', 'Hardcover', 'English', 'New York Times', 10, 12, '9780393037231', '2024-05-15', 350),
(6, 'Fourth Edition', 'Hardcover', 'English', 'Da Press', 11, 13, '9780143327741', '2024-05-15', 350),
(7, 'Third Edition', 'Hardcover', 'English', 'Penguin Books', 12, 15, '9780125682613', '2024-05-15', 350),
(8, 'Second Edition', 'Paperback', 'English', 'Redstone Publishing', 13, 16, '9740143139621', '2023-11-05', 280),
(9, 'Third Edition', 'Ebook', 'English', 'Seabreeze Publications', 14, 17, NULL, '2024-02-10', 180),
(10, 'Fourth Edition', 'Hardcover', 'English', 'Pine Hill Books', 18, 20, '9781918765432', '2024-07-08', 420),
(11, 'Fifth Edition', 'Ebook', 'English', 'Skyline Publishers', 19, 21, '9780193489235', '2024-08-10', 330),
(12, 'Sixth Edition', 'Paperback', 'English', 'Seaside Publications', 20, 22, '9780153428963', '2024-09-01', 290),
(13, 'Fifth Edition', 'Ebook', 'English', 'Kim Publishers', 15, 31, '9780193080625', '2024-08-10', 330);

INSERT INTO Loan (loan_id, employee_id, card_number, late_fee, checkout_date, due_date, return_date, renewal_count) VALUES
(1, 1, 1001, 0.00, '2024-01-10', '2024-02-10', '2024-02-05', 0),
(2, 4, 1003, 0.00, '2024-11-28', '2024-12-12', NULL, 0),
(3, 5, 1004, 2.50, '2024-11-20', '2024-12-04', NULL, 1),
(4, 6, 1006, 0.00, '2024-11-30', '2024-12-14', NULL, 0),
(5, 6, 1005, 0.00, '2024-11-15', '2024-11-29', NULL, 0),
(6, 5, 1008, 5.00, '2024-11-25', '2024-12-09', NULL, 1),
(7, 4, 1011, 2.50, '2024-11-28', '2024-12-12', NULL, 0),
(8, 5, 1011, 2.50, '2024-12-2', '2024-12-16', NULL, 0);

INSERT INTO Copy (copy_id, condition_type, price, status, location, reservations, loan_id) VALUES
(1, 'New', 25.99, 'Available', 'Shelf A1', FALSE, NULL),
(2, 'Good', 15.99, 'Available', 'Shelf B1', TRUE, NULL),
(3, 'Worn', 10.99, 'Checked Out', 'Shelf C1', FALSE, 3),
(4, 'Good', 15.99, 'Available', 'Aisle 3', FALSE, NULL),
(5, 'New', 20.00, 'Available', 'Aisle 1', TRUE, NULL),
(6, 'Worn', 7.99, 'Checked Out', 'Aisle 5', FALSE, 5),
(7, 'Good', 18.50, 'Available', 'Aisle 2', FALSE, NULL),
(8, 'Damaged', 5.50, 'Reserved', 'Aisle 6', TRUE, NULL),
(9, 'Good', 12.00, 'Available', 'Aisle 4', TRUE, NULL),
(10, 'Worn', 10.99, 'Checked Out', 'Shelf B1', FALSE, 1),
(11, 'Good', 15.99, 'Checked Out', 'Shelf C2', FALSE, 2),
(12, 'New', 20.99, 'Checked Out', 'Shelf C3', FALSE, 4),
(13, 'Damaged', 11.99, 'Checked Out', 'Shelf A1', FALSE, 6),
(14, 'Worn', 6.99, 'Checked Out', 'Shelf B2', FALSE, 7),
(15, 'Worn', 12.99, 'Checked Out', 'Shelf B3', FALSE, 8);

INSERT INTO Book_Genre (book_id, genre) VALUES
(1, 'Fantasy'),
(2, 'Science Fiction'),
(3, 'Mystery'),
(4, 'Romance'),
(5, 'Non-Fiction'),
(6, 'Mystery'),
(7, 'Horror'),
(8, 'Adventure'),
(9, 'Fantasy'),
(10, 'Science Fiction'),
(11, 'Mystery'),
(12, 'Romance'),
(13, 'Adventure'),
(14, 'Science Fiction'),
(15, 'Poetry'),
(16, 'Cookbook'),
(17, 'Art'),
(18, 'Philosophy'),
(19, 'Drama'),
(20, 'Biography'),
(21, 'Adventure'),
(22, 'Thriller'),
(23, 'Biography'),
(24, 'Adventure'),
(25, 'Science Fiction'),
(26, 'Fantasy'),
(27, 'Fantasy'),
(28, 'Romance'),
(29, 'Mystery'),
(30, 'Horror'),
(31, 'Thriller'),
(32, 'Horror'),
(33, 'Mystery'),
(34, 'Fantasy'),
(35, 'Science Fiction'),
(36, 'Fantasy'),
(37, 'Adventure'),
(38, 'Thriller'),
(39, 'Fantasy'),
(40, 'Adventure');

INSERT INTO Book_Author (book_id, author_id) VALUES
(1, 1),  -- J.K. Rowling
(2, 2),  -- Isaac Asimov
(3, 3),  -- Agatha Christie
(4, 4),  -- Nicholas Sparks
(5, 5),  -- Malcolm Gladwell
(6, 6),  -- Stephen King
(7, 6),  -- Stephen King
(8, 7),  -- J.R.R. Tolkien
(9, 7),  -- J.R.R. Tolkien
(10, 8), -- Dan Brown
(11, 3), -- Agatha Christie
(12, 4), -- Nicholas Sparks
(13, 8), -- Dan Brown
(14, 9), -- Mark Twain
(15, 10),-- Jane Austen
(16, 11),-- George Orwell
(17, 12),-- Emily Dickinson
(18, 13),-- Charles Dickens
(19, 16),-- William Shakespeare
(20, 14),-- Leo Tolstoy
(21, 15),-- Virginia Woolf
(22, 17),-- Ernest Hemingway
(23, 18),-- F. Scott Fitzgerald
(24, 19),-- Harper Lee
(25, 20),-- J.R.R. Tolkien
(26, 21),-- H.G. Wells
(27, 22),-- Agatha Christie
(28, 23),-- J.K. Rowling
(29, 24),-- Isaac Asimov
(30, 25),-- George R.R. Martin
(31, 26),-- Stephen King
(32, 27),-- Agatha Christie
(33, 28),-- J.R.R. Tolkien
(34, 29),-- C.S. Lewis
(35, 30),-- Haruki Murakami
(36, 31),-- Dan Brown
(37, 32);-- Margaret Atwood

INSERT INTO Publication_Narrator (edition, format, language, publisher, narrator_id) VALUES
('First Edition', 'Hardcover', 'English', 'Penguin Books', 1),  -- Jim Dale
('Second Edition', 'Paperback', 'English', 'HarperCollins', 2), -- Kate Reading
('Audiobook', 'Audiobook', 'English', 'Audible', 3),            -- David Tennant
('First Edition', 'Hardcover', 'English', 'Greenleaf Press', 4),-- Morgan Freeman
('Second Edition', 'Paperback', 'English', 'Redstone Publishing', 5), -- Tiffany Doyon
('Third Edition', 'Ebook', 'English', 'Seabreeze Publications', 6),   -- Simon Vance
('Fourth Edition', 'Hardcover', 'English', 'Pine Hill Books', 7),     -- Barbara Rosenblat
('Fifth Edition', 'Ebook', 'English', 'Skyline Publishers', 8),       -- George Guidall
('Sixth Edition', 'Paperback', 'English', 'Seaside Publications', 9); -- Kate Reading