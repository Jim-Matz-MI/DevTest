%{*******************************************************************
* Copr 1979 2001 An Unpublished Work By Harrris Business Group, Inc.*
* All rights reserved. This work contains trade secrets.            *
*                  					                                  *
*  Job: Welcome Page                                                *
*********************************************************************
%}

  @SessionDate(profileHandle, dataBaseID, sessionDateFormat)

  <h1>Welcome, $(profileName), to $(title)</h1>

  $(hrTagAttr) 	

  
  <div style="padding: 1ex 1ex 1ex 1ex;">
    Today is <span style="font-weight: bold;">$(sessionDateFormat)</span>
  </div>

  <div style="padding: 1ex 1ex 1ex 1ex;">
    Welcome to the Gemini Harris Data Information Portal.
    
  </div>

  <div style="padding: 1ex 1ex 1ex 1ex;">
    
  </div>
  

  
  $(hrTagAttr)

  %INCLUDE "Copyright.icl"
