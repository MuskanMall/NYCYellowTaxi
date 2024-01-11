# NYCYellowTaxi

### Phase 1: Data Preparation and Database Implementation

Utilizing a Kaggle dataset, I implemented a robust database system using PostgreSQL and MongoDB for NYC taxi data. Employing data cleaning, item mining, and query analysis, I derived valuable insights, aiding decision-making and analysis.

This project utilizes 3 out of the 4 data files from the following link:
[https://www.kaggle.com/datasets/elemento/nyc-yellow-taxi-trip-data?resource=download&select=yellow_tripdata_2016-01.csv](https://www.kaggle.com/datasets/elemento/nyc-yellow-taxi-trip-data?resource=download&select=yellow_tripdata_2016-01.csv)

Files used:
- `yellow_tripdata_2016-01.csv`
- `yellow_tripdata_2016-02.csv`
- `yellow_tripdata_2016-03.csv`

The file `yellow_tripdata_2015-01.csv` was discarded and is not utilized in this project since we are only loading our database with taxi trip data from 2016.

#### Database Setup Steps
1. **File Path Configuration**
   
   Make sure file paths in `cctables.sql` are accurate for each data file:
   
   - `yellow_tripdata_2016-01.csv`
   - `yellow_tripdata_2016-02.csv`
   - `yellow_tripdata_2016-03.csv`
   
2. **Database Loading**
   
   To load the database and execute queries, run the loader script in the terminal with:
   python loader.py
   
**Specify the file paths on your local system to the following SQL files in `loader.py`:**
- `cctables.sql`
- `updtables.sql`


### Phase 2: Creating a MongoDB Database

For this phase, MongoDB is used to manage and analyze the data further. The same data files as in Phase 1 are utilized, with additional preprocessing for compatibility with MongoDB.

#### Key Files
- `preprocess.py`: Renames the headers of each .csv file to correspond with the MongoDB schema.
- `mongo.py`: Loads data into MongoDB and creates the Trips collection.
- `psql_queries.py`: Contains all five queries for this phase.
- `run_sql.py`: Connects to the Postgres database and executes each query, reporting timings in the terminal.

#### Steps for MongoDB Database Setup
1. **Preprocessing and File Path Configuration**

Ensure the file paths in `preprocess.py` and `mongo.py` are set correctly for each data file:

- `yellow_tripdata_2016-01.csv`
- `yellow_tripdata_2016-02.csv`
- `yellow_tripdata_2016-03.csv`

2. **Loading MongoDB**

To load the MongoDB database, run:
python mongo.py


**Before proceeding to Step 3:**

Install the `earthdistance` module for PostgreSQL, as it is used in the second query. This can be done by executing the following SQL commands on your PostgreSQL database:

CREATE EXTENSION cube;
CREATE EXTENSION earthdistance;


Note: These must be executed in the specified order, with `cube` being created first.

3. **Executing SQL Queries**

Run `run_sql.py` to execute all five SQL queries:

python run_sql.py


#### Libraries Used
- `time`
- `pymongo`
- `pandas`
