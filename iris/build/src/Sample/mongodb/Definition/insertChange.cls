Class Sample.mongodb.Definition.insertChange Extends (%Persistent, Ens.Request, %JSON.Adaptor)
{

Property id As id(%JSONFIELDNAME = "_id");

Property clusterTime As %VarString;

Property wallTime As %VarString;

Property documentKey As documentKey;

Property fullDocument As fullDocument;

Property ns As ns;

Property operationType As %VarString;

Storage Default
{
<Data name="insertChangeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>_id</Value>
</Value>
<Value name="3">
<Value>clusterTime</Value>
</Value>
<Value name="4">
<Value>documentKey</Value>
</Value>
<Value name="5">
<Value>fullDocument</Value>
</Value>
<Value name="6">
<Value>ns</Value>
</Value>
<Value name="7">
<Value>operationType</Value>
</Value>
<Value name="8">
<Value>id</Value>
</Value>
<Value name="9">
<Value>wallTime</Value>
</Value>
</Data>
<DataLocation>^Sample.mongod65CF.insertChangeD</DataLocation>
<DefaultData>insertChangeDefaultData</DefaultData>
<IdLocation>^Sample.mongod65CF.insertChangeD</IdLocation>
<IndexLocation>^Sample.mongod65CF.insertChangeI</IndexLocation>
<StreamLocation>^Sample.mongod65CF.insertChangeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
