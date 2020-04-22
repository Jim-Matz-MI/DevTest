%{
**********************************************************************
*  Copr 1979 2001 An Unpublished Work By Harris Business Group, Inc. *
* All rights reserved. This work contains trade secrets.             *
*             	 	        	                                         *
*  Job: Order Entry Header Include                                   *
*                                                                    *
* MLH  MonaH 12/11/12 Added H1SHTO field (ship to customer number)   *
*                     H1BLTO field (bill to customer number)         *
*                     H1DSHP field (Drop ship number)                *
*                     got field names from OrderEntryRetInfo.icl     *
*                                                                    *
* MD01 MichaelD 06-10-13 Created new drop ship extension file        *
*                        (GDSHP01F) to store "attention to" name for *
*                        each drop ship master record. Modify script *
*                        to support new "attention to" field.        *
*                                                                    *
* MD02 MichaelD 02-27-15 Add links from drop ship, ship to, and bill *  
*                        to numbers to their respective customer     *
*                        pages.                                      *
*                                                                    *
**********************************************************************
MLH 12/11/2012 Added H1SHTO field (ship to customer number)
		     H1BLTO field (bill to customer number)
		     H1DSHP field (Drop ship number)
		 got field names from OrderEntryRetInfo.icl	

%}

  %if (shipToName   == billToName &&
       shipToAdrOne == billToAdrOne)
       @dtw_assign(dspBillTo, "N")
       @dtw_assign(shipToHdr, "Ship-To/Bill-To")
  %else
       @dtw_assign(dspBillTo, "Y")
       @dtw_assign(shipToHdr, "Ship-To")
  %endif

  <table $(contentTable)>
	     <colgroup>
	         <col width="25%">
	         <col width="10%">
	         <col width="25%">
	         <col width="10%">
	         <col width="25%">
	   		
      <tr>
          %if (dropShip == "Y")
              <td class="colhdr">Drop Ship</td><td>&nbsp;</td>
          %endif
          <td class="colhdr">$(shipToHdr)</td><td>&nbsp;</td>
          %if (dspBillTo == "Y")
              <td class="colhdr">Bill-To</td>
          %endif
      </tr>

      <tr valign=top>
          %if (dropShip == "Y")
%{
* MD02 Begin: Link customer numbers to customer pages.
%}
%{ *****      <td rowspan="5" class="dspalph"> $(H1DSHP) <br> %}
              <td rowspan="5" class="dspalph">
                <a href="$(homeURL)$(cGIPath)DropShipInquiry.d2w/DISPLAY?baseVar=BaseConfigurationGI.icl&portal=CUSTOMER&dropShipVCF=C&dropShipVendCust=$(H1SHTO)&dropShipNumber=$(H1DSHP)">
                  $(H1DSHP)
                </a>
                <br />
%{
* MD02 End: Link customer numbers to customer pages.
%}
		      $(dropShipName) <br>
%{
* MD01 Begin: Add field(s): Attention to name*
%}
                  %if (attentionToName != "")
                      $(attentionToName) <br>
                  %endif
%{
* MD01 End: Add field(s): Attention to name*
%}
                  %if (dropShipAdrOne != "")
                      $(dropShipAdrOne) <br>
                  %endif
                  %if (dropShipAdrTwo != "")
                      $(dropShipAdrTwo) <br>
                  %endif
                  %if (dropShipAdrThree != "")
                      $(dropShipAdrThree) <br>
                  %endif
                  $(dropShipCity), $(dropShipState) $(dropShipZip)
              </td>
              <td>&nbsp;</td>
          %endif
%{
* MD02 Begin: Link customer numbers to customer pages.
%}
%{ *****  <td rowspan="5" class="dspalph"> $(H1SHTO) <br> %}
          <td rowspan="5" class="dspalph">
            <a href="$(homeURL)$(cGIPath)CustomerSelect.d2w/REPORT?baseVar=BaseConfigurationGI.icl&portal=CUSTOMER&customerNumber=$(H1SHTO)">
              $(H1SHTO)
            </a>
            <br />
%{
* MD02 End: Link customer numbers to customer pages.
%}
                  $(shipToName) <br>
              %if (shipToAdrOne != "")
                  $(shipToAdrOne) <br>
              %endif
              %if (shipToAdrTwo != "")
                  $(shipToAdrTwo) <br>
              %endif
              %if (shipToAdrThree != "")
                  $(shipToAdrThree) <br>
              %endif

              $(shipToCity), $(shipToState) $(shipToZip)
          </td>
          <td>&nbsp;</td>
          %if (dspBillTo == "Y")
%{
* MD02 Begin: Link customer numbers to customer pages.
%}
%{ *****      <td rowspan="5" class="dspalph"> $(H1BLTO) <br> %}
              <td rowspan="5" class="dspalph">
                <a href="$(homeURL)$(cGIPath)CustomerSelect.d2w/REPORT?baseVar=BaseConfigurationGI.icl&portal=CUSTOMER&customerNumber=$(H1BLTO)">
                  $(H1BLTO)
                </a>
                <br />
%{
* MD02 End: Link customer numbers to customer pages.
%}
		      $(billToName) <br>
                  %if (billToAdrOne != "")
                      $(billToAdrOne) <br>
                  %endif
                  %if (billToAdrTwo != "")
                      $(billToAdrTwo) <br>
                  %endif
                  %if (billToAdrThree != "")
                      $(billToAdrThree) <br>
                  %endif

                  $(billToCity), $(billToState) $(billToZip)
              </td>
          %else
          <td>&nbsp;</td>
          %endif
      </tr>
  </table>
  <br>