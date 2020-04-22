%{
*********************************************************************
* Copr 1979 2001 An Unpublished Work By Harris Business Group, Inc. *
* All rights reserved. This work contains trade secrets.            *
*                  					                                  *
*  Job: Set Library List                                            *
*********************************************************************
%}

   

  @dtw_GetCookie("handle_cookie", profileHandle)

  %{ Look to see if the user profile or REMOT_USER has a @ - if so remove it %}  
    @DTW_LASTPOS("@", userProfile, lat)
  %if (lat > "1"   )
    %if (lat <= "10"   )
       @DTW_ADD(lat, "-1", "1", result)
       @DTW_SUBSTR(REMOTE_USER, "1",result, sF) 
      @dtw_assign(userProfile, @dtw_ruppercase(sF))
    %endif
     %endif
  @DTW_LASTPOS("@", REMOTE_USER, lat)
  %if (lat > "1"   )
    %if (lat <= "10"   )
       @DTW_ADD(lat, "-1", "1", result)
       @DTW_SUBSTR(REMOTE_USER, "1",result, sF)      
      @dtw_assign(REMOTE_USER, @dtw_ruppercase(sF))
    %endif
     %endif


  
 
  %if (profileHandle == "")
 
 
 @dtw_assign(userProfile, @dtw_ruppercase(REMOTE_USER))
   
  
      @Validate_User_Profile(userProfile, password, dataBaseID, profileHandle, HTTP_AS_AUTH_PROFILETKN)
      @dtw_SetCookie("handle_cookie", "$(profileHandle)", "path=/")
  %endif

  @dtw_GetCookie("role_cookie", activeRole)
  %if (activeRole == "")

     @RtvFldDesc("HNXHND='$(profileHandle)'", "SYHAND", "HNROLE", activeRole)   
      @dtw_SetCookie("role_cookie", "$(activeRole)", "path=/")
  %endif

  @setLibl(profileHandle, dataBaseID, tokenError, userProfile)
 