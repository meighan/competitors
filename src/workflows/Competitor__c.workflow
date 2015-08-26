<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
        <fullName>Competitor_Information_Out_of_Date</fullName>
    <alerts>
        <description>Competitor Information Out of Date</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Competitors/Email_Alert_Competitor_Record_Update_Past_Due</template>
    </alerts>
    <alerts>
        <fullName>Competitor_Out_of_Date_x2</fullName>
        <description>Competitor Out of Date x2</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Competitors/Email_Alert_Competitor_Record_Update_Past_Due</template>
    </alerts>
    <alerts>
        <fullName>Competitor_Update_Required_in_7</fullName>
        <description>Competitor Update Required in 7</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Competitors/Email_Alert_Competitor_Record_Out_of_Date</template>
    </alerts>
    <fieldUpdates>
        <fullName>Last_Update_Today</fullName>
        <field>Last_Update__c</field>
        <formula>TODAY()</formula>
        <name>Last Update = Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Recent_Update_Status</fullName>
        <description>Updates the Status to Recently Updated</description>
        <field>Information_Status__c</field>
        <literalValue>Recently Updated</literalValue>
        <name>Recent Update Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Current</fullName>
        <description>Updates the Status of the Competitor Information to be Current</description>
        <field>Information_Status__c</field>
        <literalValue>Current</literalValue>
        <name>Status = Current</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Out_of_Date</fullName>
        <field>Information_Status__c</field>
        <literalValue>Out of Date</literalValue>
        <name>Status = Out of Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Competitor - Updated</fullName>
        <actions>
            <name>Last_Update_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Quarterly_Competitor_Update</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Competitor__c.Information_Status__c</field>
            <operation>equals</operation>
            <value>Recently Updated</value>
        </criteriaItems>
        <description>Updates the &quot;Last Updated&quot; Date when the actual data related to the competitor is changed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Competitor_Information_Out_of_Date</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Status_Out_of_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Competitor__c.Last_Update__c</offsetFromField>
            <timeLength>90</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Competitor_Update_Required_in_7</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Competitor__c.Last_Update__c</offsetFromField>
            <timeLength>83</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Competitor_Out_of_Date_x2</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Competitor__c.Last_Update__c</offsetFromField>
            <timeLength>97</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Status_Current</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Competitor__c.Last_Update__c</offsetFromField>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Quarterly_Competitor_Update</fullName>
        <assignedToType>owner</assignedToType>
        <description>Review the Competitive Intelligence for this company and determine what information should be updated to better enable the sales team&apos;s</description>
        <dueDateOffset>90</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Competitor__c.Last_Update__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Quarterly Competitor Update</subject>
    </tasks>
</Workflow>
