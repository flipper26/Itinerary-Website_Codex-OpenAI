CREATE TABLE IF NOT EXISTS users(id TEXT PRIMARY KEY,email TEXT NOT NULL UNIQUE,password TEXT NOT NULL,created_at TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS sessions(token_hash TEXT PRIMARY KEY,user_id TEXT NOT NULL REFERENCES users(id),expires_at INTEGER NOT NULL);
CREATE TABLE IF NOT EXISTS trips(id TEXT PRIMARY KEY,owner_id TEXT NOT NULL REFERENCES users(id),title TEXT NOT NULL,home TEXT NOT NULL,destination TEXT NOT NULL,start_date TEXT,end_date TEXT,travellers INTEGER NOT NULL CHECK(travellers>0),version INTEGER NOT NULL DEFAULT 1,tier TEXT NOT NULL DEFAULT 'preview',created_at TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS memberships(trip_id TEXT REFERENCES trips(id),user_id TEXT REFERENCES users(id),role TEXT NOT NULL CHECK(role IN ('owner','editor','viewer')),PRIMARY KEY(trip_id,user_id));
CREATE TABLE IF NOT EXISTS activities(id TEXT PRIMARY KEY,trip_id TEXT NOT NULL REFERENCES trips(id),title TEXT NOT NULL,local_date TEXT,local_time TEXT,zone TEXT NOT NULL,duration INTEGER NOT NULL,location TEXT NOT NULL,locked INTEGER NOT NULL DEFAULT 0,source TEXT NOT NULL DEFAULT 'user supplied');
CREATE TABLE IF NOT EXISTS revisions(id TEXT PRIMARY KEY,trip_id TEXT NOT NULL REFERENCES trips(id),version INTEGER NOT NULL,actor_id TEXT NOT NULL REFERENCES users(id),reason TEXT NOT NULL,snapshot TEXT NOT NULL,created_at TEXT NOT NULL,UNIQUE(trip_id,version));
PRAGMA user_version=1;
