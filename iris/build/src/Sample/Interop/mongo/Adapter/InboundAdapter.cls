Class Sample.Interop.mongo.Adapter.InboundAdapter Extends Ens.InboundAdapter
{

Property changeStream As %SYS.Python;

Parameter SETTINGS = "Credentials:Basic:credentialsSelector,Server:mongo,Port:mongo,DatabaseName:mongo,CollectionName:mongo";

Property %CredentialsObj As Ens.Config.Credentials [ Internal ];

/// The name of the mongo database to watch
Property DatabaseName As %String [ InitialExpression = "test" ];

/// The mongodb Server name to connect to
Property Server As %String [ InitialExpression = "localhost" ];

/// The mongodb port to connect to
Property Port As %Integer [ InitialExpression = "27017" ];

/// The name of the mongo database Collection to watch
Property CollectionName As %String [ InitialExpression = "myCollection" ];

/// This user callback method is called just after %OnNew()
Method OnInit() As %Status [ Language = python ]
{
        import pymongo
        
        cred_username = self._CredentialsObj.Username
        cred_password = self._CredentialsObj.Password
        client = pymongo.MongoClient(host=self.Server,port=self.Port,username=cred_username,password=cred_password)
       
        self.changeStream = client.get_database(self.DatabaseName).get_collection(self.CollectionName).watch()
    
        return True
}

/// default InboundAdapter behavior: always call ProcessInput on CallInterval
Method OnTask() As %Status [ Language = python ]
{
        import pymongo
        import iris

        while self.changeStream.alive:
            change = self.changeStream.try_next()
            # Note that the ChangeStream's resume token may be updated
            # even when no changes are returned.
            #print("Current resume token: %r" % (self.changeStream.resume_token,))
            if change is not None:
                #print("Change document: %r" % (change,))
               
                self.Trace('got JSON:' + change.__str__())
                changeData = iris.cls("%Stream.GlobalCharacter")._New()
                changeData.Write(change.__str__())
                processStatus = self.BusinessHost.ProcessInput(changeData)
                if not processStatus:
                    return False
                continue
            # We end up here when there are no recent changes.
            # Sleep for a while before trying again to avoid flooding
            # the server with getMore requests when no changes are
            # available.
            #time.sleep(10)
            break
        return True
}

Method Trace(value)
{
    $$$TRACE(value)
}

}
