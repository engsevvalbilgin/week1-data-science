```markdown
# Week 1 - Data Science Projects

This repository contains my Week 1 Data Science projects focusing on **Python, NumPy, Pandas, SQL, and basic data visualization**. It includes Jupyter notebooks, SQL scripts, and Docker setup for PostgreSQL.

---

## 📁 Project Structure

```

week1-data-science/
│
├── notebooks/
│   ├── 01_numpy_broadcasting.ipynb       # NumPy basics & broadcasting exercises
│   ├── 02_pandas_advanced.ipynb          # Advanced Pandas: groupby, merge, pivot, resample
│   ├── 03_statistics_distributions.ipynb # Statistics & distributions
│   ├── 04_matplotlib_seaborn.ipynb       # Data visualization with Matplotlib & Seaborn
│
├── sql/
│   ├── basics.sql                         # PostgreSQL basic table creation & inserts
│   ├── cohort_query.sql                   # Cohort analysis queries
│   └── window_functions.sql               # Window function examples
│
├── docker-compose.yml                     # Docker setup for PostgreSQL
├── requirements.txt                       # Python dependencies
└── README.md                              # This file

````

---

## 📝 Notebooks

1. **NumPy Basics**
   - Arrays, indexing, slicing
   - Broadcasting
   - Vectorized operations
   - Universal functions (ufuncs)

2. **Pandas Advanced**
   - GroupBy operations
   - Merge & Join
   - Pivot tables
   - Time series resampling

3. **Statistics & Distributions**
   - Descriptive statistics
   - Probability distributions
   - Visualization with Seaborn/Matplotlib

4. **Data Visualization**
   - Matplotlib basics
   - Seaborn plots for exploratory data analysis (EDA)

---

## 🐘 SQL Scripts

- **`basics.sql`**: Create tables, insert sample data, basic SELECT queries  
- **`cohort_query.sql`**: Cohort analysis queries using PostgreSQL  
- **`window_functions.sql`**: Examples using window functions (`ROW_NUMBER`, `RANK`, `SUM OVER`, etc.)

---

## 🐳 Docker Setup

- PostgreSQL is configured via `docker-compose.yml`  
- Credentials are stored locally in a `.env` file (**do not commit this file**)

- Start the database:

```bash
docker-compose up -d
````

* Access PostgreSQL container:

```bash
docker exec -it postgres_db psql -U $POSTGRES_USER -d $POSTGRES_DB
```

---

## 💻 Usage

1. Clone the repository:

```bash
git clone https://github.com/engsevvalbilgin/week1-data-science.git
cd week1-data-science
```

2. Install Python dependencies:

```bash
pip install -r requirements.txt
```

3. Run Jupyter Notebook:

```bash
jupyter notebook
```

4. Run SQL scripts in the PostgreSQL container as needed.

---

## 📈 Goals

* Learn core **Python data manipulation** skills
* Practice **SQL for data analysis**
* Gain familiarity with **Docker for reproducible environments**
* Build a **portfolio-ready project** for data science learning

---

## 🔗 Author

**Şevval Bilgin**
GitHub: [https://github.com/engsevvalbilgin](https://github.com/engsevvalbilgin)

```


