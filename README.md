# A sample of utilizing the power of Embedded Python with InterSystems IRIS Interoperability

See the [related InterSystems Developer Community article](https://community.intersystems.com/post/power-embedded-python-interoperability-mongodb-cdc-use-case) for more information and background (to be publicly published soon)  
You will find there information about the usage of the [PyMongo](https://pymongo.readthedocs.io/en/stable/) package, in creating an Inbound Adapter and related Business Service to capture changes in a Mongo DB Collection.

## To get:
```
git clone https://github.com/tanifgit/mongoCDC.git
```
## To run:
```
cd mongoCDC
docker-compose up -d --build
```

## To test (after containers are running):
### To setup mongo
We need to initiate the mongo replicaSet 
(note it mongo/build/init-replica.js, 
I tried to get this to happen as part of the container initialization but it didn't work, 
you are welcome to suggest a working solution for this, in the meantime we'll do this manually).  
**1. Enter into the mongo container (one of them out of the replicaSet):**
```
docker exec -it mongo1 bash
```
> $ docker exec -it mongo1 bash
> root@e3b93abb5596:/# mongosh  
> Current Mongosh Log ID: 676708e5955c5e4448fe6910  
> Connecting to:          mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.3.2  
> Using MongoDB:          6.0.19  
> Using Mongosh:          2.3.2  
>   
> For mongosh info see: https://www.mongodb.com/docs/mongodb-shell/  

**2. Change into the admin DB and authenticate**
```
use admin
```
> test> use admin  
> switched to db admin  
> { ok: 1 }
```
db.auth("admin","admin123")  
```
> admin> db.auth("admin","admin123")  
> { ok: 1 } 

**3. Inititate the replicaSet**
```
rs.initiate()
```
> admin> rs.initiate()  
> {  
>   info2: 'no configuration specified. Using a default configuration for the set',  
>   me: '960427582b78:27017',  
>   ok: 1  
> }

### To get the InterSystems IRIS Interoperability started
**1. Login into the IRIS Management Portal**  
[Management Portal](http://localhost:52773/csp/sys/UtilHome.csp)  
Username: SuperUser  
Password: SYS  
**2. Go to the Production Configuration page**
Interoperability -> Choose the USER namespace  
List -> Productions  
Choose the Sample.Interop.mongo.Prod.MongoDBSampleProduction production and click open 
Here's a [shortcut this page](http://localhost:52773/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=Sample.Interop.mongo.Prod.MongoDBSampleProduction)  
You can examine the components and settings if you wish, and then press the Start button  
Make sure all components are green, if not examine their Log tab

### Back in the mongo shell insert a document
**1. Change into the testDB database**
In the same mongo shell as before, run:
```
use testDB  
```
> rs0 \[direct: other\] admin> use testDB  
> switched to db testDB
**2. Insert a new Document**
```
db.testCol.insertOne({"mrn":"123456789","first_name":"john","last_name":"smith","dob":"2001-01-01","gender":"male"})
```
> rs0 \[direct: primary\] testDB> db.testCol.insertOne({"mrn":"123456789","first_name":"john","last_name":"smith","dob":"2001-01-01","gender":"male"})  
> {  
>   acknowledged: true,  
>   insertedId: ObjectId('6767370c9ccd1dbd92fe6911')  
> }

### Examine the End Result
Take a look at the table data in the IRIS Management Portal  
System Explorer -> SQL -> Choose the Table Demo_EMR_Data.Patient and click on Open Table  
Here's [a shortcut to the table data](http://localhost:52773/csp/sys/exp/UtilSqlOpen.csp?$NAMESPACE=USER&$ID1=Demo_EMR_Data&$ID2=Patient)  
You should be able to see the data inserted, per the document we added to Mongo, for example:  
![image](https://github.com/user-attachments/assets/5280256d-2554-4be4-99d6-9ebf571b6486)  

### Examine the behind the scense inside IRIS
In the Production Configuration page click on one of the components and choose the Messages tab then click on the Header number to open the Visual Trace.  
You can also get there from the Message Viewer.  
Here's an example:  
![image](https://github.com/user-attachments/assets/f3f2c260-c494-474a-ad05-70e85fdf5eee)  
You can examine the various parts of the trace  

## To stop the demo
In same place you ran docker-compose up, run:
```
docker-compose down
```






