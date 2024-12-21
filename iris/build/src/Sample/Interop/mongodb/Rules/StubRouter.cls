/// 
Class Sample.Interop.mongodb.Rules.StubRouter Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="Sample.Interop.mongo.Prod.MongoDBSampleProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Inserts">
<constraint name="msgClass" value="Sample.mongodb.Definition.insertChange"></constraint>
<when condition="1" comment="">
<send transform="Sample.Interop.mongo.DTL.mongoPatientToEMRPatient" target="EMR REST Operation"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
