Class Sample.TestWatch Extends %RegisteredObject
{

Property mongoClient As %SYS.Python;

Property changeStream As %SYS.Python;

/// Test Watching mongodb change stream
ClassMethod WatchAndPrint() As %Status [ Language = python ]
{
        import pymongo
        client = pymongo.MongoClient()
        change_stream = client.test.myCollection.watch()
        for change in change_stream:
            print(change)
}

ClassMethod WatchAndPrintWithNext() As %Status [ Language = python ]
{
        import pymongo
        import time

        client = pymongo.MongoClient()
        change_stream = client.test.myCollection.watch()
        while change_stream.alive:
            change = change_stream.try_next()
            # Note that the ChangeStream's resume token may be updated
            # even when no changes are returned.
            print("Current resume token: %r" % (change_stream.resume_token,))
            if change is not None:
                print("Change document: %r" % (change,))
                continue
            # We end up here when there are no recent changes.
            # Sleep for a while before trying again to avoid flooding
            # the server with getMore requests when no changes are
            # available.
            #time.sleep(10)
            break
}

Method Init() [ Language = python ]
{
        import pymongo
        self.mongoClient = pymongo.MongoClient()
}

Method InsWatchAndPrint() [ Language = python ]
{
        import pymongo
        change_stream = self.mongoClient.test.myCollection.watch()
        for change in change_stream:
            print(change)
}

Method InitNext() [ Language = python ]
{
        import pymongo
        import time

        client = pymongo.MongoClient()
        self.changeStream = client.test.myCollection.watch()
}

Method InsWatchAndPrintWithNext() [ Language = python ]
{
        while self.changeStream.alive:
            change = self.changeStream.try_next()
            # Note that the ChangeStream's resume token may be updated
            # even when no changes are returned.
            print("Current resume token: %r" % (self.changeStream.resume_token,))
            if change is not None:
                print("Change document: %r" % (change,))
                continue
            # We end up here when there are no recent changes.
            # Sleep for a while before trying again to avoid flooding
            # the server with getMore requests when no changes are
            # available.
            #time.sleep(10)
            break
}

}
