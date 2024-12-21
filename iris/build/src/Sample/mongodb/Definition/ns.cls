Class Sample.mongodb.Definition.ns Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

Property coll As %VarString;

Property db As %VarString;

Storage Default
{
<Data name="nsState">
<Value name="1">
<Value>coll</Value>
</Value>
<Value name="2">
<Value>db</Value>
</Value>
</Data>
<State>nsState</State>
<StreamLocation>^Sample.mongodb.Definition.nsS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
