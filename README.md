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
   
**Specify the file paths on your local system to the following SQL files in `loader.py`:**
- `cctables.sql`
- `updtables.sql`
