%{
**********************************************************************
*  Copr 1979 2001 An Unpublished Work By Harris Business Group, Inc. *
* All rights reserved. This work contains trade secrets.             *
*             	 	        	                                         *
*  Job: Order Entry Header Include                                   *
*                                                                    *
* MD01 MichaelD 20130610 Created new drop ship extension file        *
*                        (GDSHP01F) to store "attention to" name for *
*                        each drop ship master record. Modify script *
*                        to support new "attention to" field.        *
*                                                                    *
* MD02 MichaelD 20150408 Add field(s): Drop ship, ship to, and bill  *
*                        to numbers.                                 *
*                                                                    *
**********************************************************************
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
* MD02 Begin: Add field(s): Drop ship, ship to, and bill to numbers *
%}
%{            <td rowspan="5" class="dspalph"> $(dropShipName) <br>   %}
              <td rowspan="5" class="dspalph">
              $(V_OEDSHP) <br />
              $(dropShipName) <br />
%{
* MD02 End: Add field(s): Drop ship, ship to, and bill to numbers *
%}
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
* MD02 Begin: Add field(s): Drop ship, ship to, and bill to numbers *
%}
%{         <td rowspan="5" class="dspalph"> $(shipToName) <br>    %}
          <td rowspan="5" class="dspalph">
              $(V_OESHTO) <br />
              $(shipToName) <br />
%{
* MD02 End: Add field(s): Drop ship, ship to, and bill to numbers *
%}
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
* MD02 Begin: Add field(s): Drop ship, ship to, and bill to numbers *
%}
%{              <td rowspan="5" class="dspalph"> $(billToName) <br>   %}
              <td rowspan="5" class="dspalph">
                  $(V_OEBLTO) <br />
                  $(billToName) <br />
%{
* MD02 End: Add field(s): Drop ship, ship to, and bill to numbers *
%}
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