Class Sample.Interop.mongo.Prod.MongoDBSampleProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Sample.Interop.mongo.Prod.MongoDBSampleProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="mongo Watcher" Category="" ClassName="Sample.Interop.mongo.BS.mongoWatcherService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="CollectionName">testCol</Setting>
    <Setting Target="Adapter" Name="DatabaseName">testDB</Setting>
    <Setting Target="Adapter" Name="Server">mongo1</Setting>
    <Setting Target="Adapter" Name="Credentials">mongo</Setting>
  </Item>
  <Item Name="EMR REST Operation" Category="" ClassName="Demo.Int.BO.EMRRESTOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">emr</Setting>
    <Setting Target="Adapter" Name="HTTPPort">52773</Setting>
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="URL">/api/emr/patient</Setting>
  </Item>
  <Item Name="mongo Change Router" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">Sample.Interop.mongodb.Rules.StubRouter</Setting>
  </Item>
</Production>
}

}
