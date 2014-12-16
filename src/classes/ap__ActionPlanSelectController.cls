/*
Copyright (c) 2011, salesforce.com, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, 
    this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, 
    this list of conditions and the following disclaimer in the documentation 
    and/or other materials provided with the distribution.
    * Neither the name of the salesforce.com, Inc. nor the names of its contributors 
    may be used to endorse or promote products derived from this software 
    without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
OF THE POSSIBILITY OF SUCH DAMAGE.

*/
public with sharing class ap__ActionPlanSelectController{
	
	public List<ActionPlanTemplate__c> ap__ActionPlanTemplates;
	
	/**
	* Constructor
	*/
	public ap__ActionPlanSelectController( ApexPages.StandardController stdController ){
	}
	
	/**
	* 
	* @return List<ActionPlanTemplate__c>
	*/
	public List<ActionPlanTemplate__c> getap__ActionPlanTemplates(){
	
		return [ select a.Id, a.Name, a.Description__c, a.SkipWeekends__c, a.LastModifiedDate, a.LastModifiedBy.Name, 
					a.LastModifiedById, a.CreatedDate, a.CreatedBy.Name, a.CreatedById 
					from ActionPlanTemplate__c a 
					order by a.Name ASC limit 1000 ]; 
	}
	
	public static testMethod void checkActionPlanTemplateListEmpty(){
	
		Test.StartTest();
		
		//Delete any previous templates you might have
		List<ActionPlanTemplate__c> templateList = [ select Id from ActionPlanTemplate__c ]; 
		delete templateList;
		
		ap__ActionPlanSelectController apSelectController = new ap__ActionPlanSelectController( new ApexPages.StandardController( new ActionPlan__c() ) ); 		
		List<ActionPlanTemplate__c> APTemplates = apSelectController.getap__ActionPlanTemplates();
		
		// verifies list is empty
		System.assert( APTemplates.isEmpty(), 'Action Plan Template List not Empty' );
		
		Test.StopTest();
	}
	
	public static testMethod void checkActionPlanTemplateListNotEmpty(){
	
		Test.StartTest();
		
		ap__ActionPlansTestUtilities testUtil = new ap__ActionPlansTestUtilities();
		
		ActionPlanTemplate__c auxTemplate;
		auxTemplate = testUtil.createNewActionPlanTemplate( 1 );
		auxTemplate = testUtil.createNewActionPlanTemplate( 1 );
		
		ap__ActionPlanSelectController apSelectController = new ap__ActionPlanSelectController( new ApexPages.StandardController( new ActionPlan__c() ) ); 		
		List<ActionPlanTemplate__c> APTemplates = apSelectController.getap__ActionPlanTemplates();
		
		// verifies list is not empty
		System.assert( !APTemplates.isEmpty(), 'Action Plan template is empty' );
		
		Test.StopTest();
	}
}