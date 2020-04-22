%{
**********************************************************************
*  Copr 1979 2001 An Unpublished Work By Harris Business Group, Inc. *
* All rights reserved. This work contains trade secrets.             *
*             	 	        	                                     *
*  Job: Customer Master Maintenance Stored Procedures                *
* ================================================================== *
* Modifications                                                      *
* ================================================================== *
* MTD  MichaelD 2018-05-11 - Add interface to new Gemini custom      *
*                            system flag table.                      *
*                                                                    *
**********************************************************************
%}

%DEFINE {

 %{ Table Routine Variables %}

 invoiceMethodTable      = %table
 printDetSumTable        = %table

%{ * MD01 Begin: Add interface to new Gemini custom system flag table. %}
 leadSourceTable         = %table
%{ * MD01 End: Add interface to new Gemini custom system flag table. %}

%}

 %{ Table Routine Function Calls %}

			
%FUNCTION(DTW_SQL) Invoice_Method_Query
				(IN  	CHAR(64) profileHandle,
			         char(2)  dataBaseID,
					   char(10) type,
				OUT  	invoiceMethodTable)
			  {call $(pgmLibrary)hsyfvp_w
%}				
%FUNCTION(DTW_SQL) Print_DetSum_Query
				(IN 	CHAR(64) profileHandle,
			         char(2)  dataBaseID,
			         char(10) type,
				OUT  	printDetSumTable)
			  {call $(pgmLibrary)hsyfvp_w
%}
%{ * MD01 Begin: Add interface to new Gemini custom system flag table. %}
%FUNCTION(DTW_SQL) Lead_Source_Query
				(IN 	CHAR(64) profileHandle,
			         char(2)  dataBaseID,
			         char(10) type,
				OUT  	leadSourceTable)
			  {call $(pgmLibrary)gsyfl01ra
%}
%{ * MD01 End: Add interface to new Gemini custom system flag table. %}
				