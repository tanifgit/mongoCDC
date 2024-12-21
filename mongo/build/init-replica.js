// init-replica.js
//rs.initiate();

// The code below doesn't do what I need it to do...
// Simply run rs.initiate() manually when mongo is up instead...
// Leaving this here for future reference..


// Wait for the database to be ready

const checkPrimaryReady = () => {
    const result = db.adminCommand({ ping: 1 });
    return result.ok === 1;
};

let retries = 10;
while (retries > 0) {
    try {
        if (checkPrimaryReady()) {
            break;
        }
    } catch (e) {
        print("Waiting for MongoDB to be ready...");
    }
    sleep(5000); // Wait 5 seconds
    retries--;
}

if (retries === 0) {
    throw new Error("MongoDB not ready for replica set initialization");
}

// Initialize the replica set
rs.initiate({
    _id: "rs0",
    members: [
        { _id: 0, host: "mongo1:27017" },
        { _id: 1, host: "mongo2:27017" },
        { _id: 2, host: "mongo3:27017" }
    ]
});

