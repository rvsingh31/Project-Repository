<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="show_package.aspx.cs" Inherits="WebApplication2.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Book Package </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
     <link href="Scripts/pageguide.min.css" rel="stylesheet" />

  <style>
      #status_div:hover{
          cursor:pointer;
      }
      .dont-break-out {

  overflow-wrap: break-word;
  word-wrap: break-word;

  -ms-word-break: break-all;
  word-break: break-all;
  word-break: break-word;

  -ms-hyphens: auto;
  -moz-hyphens: auto;
  -webkit-hyphens: auto;
  hyphens: auto;

}
  </style>
</head>
<body class="blue darken-1">
    <form id="form1" runat="server">
    
   
   <div class="navbar-fixed">
        <nav class="yellow">
            <div class="nav-wrapper">
            <ul> 
                <li class="left"><a class="blue-text " href="#!">Easy Travel</a></li>
                <li class="right"><a class="blue-text " href="home.aspx">Home</a></li>
            </ul>
                </div>
        </nav>
</div>
    <div class="row">
         <asp:ScriptManager EnablePartialRendering="true" EnablePageMethods="true" ID="ScriptManager1" runat="server" />
                
        <div class="col s12 m3">
            <div class="row">


                <div class="card white">
                                <div class="card-image">
                                         <asp:Image runat="server" id="im1"></asp:Image>
                                 </div>
                                 <div class="card-content">
                                     <div class="row">
                                     <div class="col s12  center">
                                   
                                          <h6 class="teal-text dont-break-out"><strong id="pn" runat="server"></strong></h6>
                                           <br />
                                      </div>
                
                                        <div class="col s12  center">
                                            <h6 class="teal-text"><strong>Duration:</strong></h6>
                                            <h6 class="blue-text" id="pdu" runat="server"></h6>
                                         </div>
                
                                         <div class="col s12 center">
                                             <h6 class="teal-text"><strong>Fees</strong></h6>
                                             <h6 class="blue-text"><span class="teal-text">ADULT:Rs </span><span id="ca" runat="server"></span></h6>
                                             <h6 class="blue-text"><span class="teal-text">CHILD:Rs </span><span id="cc1" runat="server"></span></h6>
                                          </div>
                                        
                                     </div>
                                 </div>

                                 <div class="card-action yellow lighten-4 one">
                                  
                                       <h6 class="center" id="status_div">
                                                    <%if (save == "")
                                                        { %>
                                                            <span class="purple-text save">SAVE</span>
                                                               <span  class="saved purple-text text-lighten-3" style="display:none">SAVED</span>
                                                    <%    }
                                                        else
                                                         {   %>
                                                       
                                                            <span class="purple-text save" style="display:none">SAVE</span>
                                                            <span class="purple-text text-lighten-3 saved">SAVED</span>
                                    
                                                    <% } %>
                                                      

                                                </h6> 
                                             
                                           
                                   </div>
                           </div>
    
            </div>
        </div>
        
        <div class="col s12 m7">
            <div class="row">
                <div class="col s12 m4 card-panel">
                     <div class="col s12 center">
                            <h6 class="teal-text "><strong>Description:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="pd" runat="server"></h6>
                     </div>

                      <br />
                    <br />

                     <div class="col s12 center">
                            <h6 class="teal-text "><strong>Total Packages available:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="pl" runat="server"></h6>
                     </div>
                    <br />
                    <br />

                     <div class="col s12 center two">
                            <h6 class="teal-text"><strong>Trip Date:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="pe" runat="server"></h6>
                     </div>
                    <br />
                    <br />
                     <div class="col s12 center three">
                         <br />
                            <h6 class="teal-text "><strong>This Package is provided by:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="an" runat="server"></h6>
                       <br />
                            <h6 class="teal-text "><strong>Agency Description:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="ad" runat="server"></h6>
                   <br />
                            <h6 class="teal-text "><strong>Agency's Address:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="aa" runat="server"></h6>
                 <br />

                            <h6 class="teal-text "><strong>Agency's Contact:</strong></h6>
                           <h6 class="blue-text dont-break-out" id="ac" runat="server"></h6>

                          <p id="ny" class="blue-text"></p>   
                     </div>
                    
                </div>
                <div class="col s12 m1">
                    <p></p>
                </div>
                <div class="col s12 m7 card-panel four" >
                    <h6 class="teal-text center"><strong>BOOK NOW</strong></h6>
                    <br />
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">              
                 <ContentTemplate>    
              
                    <div id="select_div" runat="server" class="col s12 m12 input-field">
                       <asp:Label id="l1" runat="server" class="blue-text" Text="Are you going to travel?(or are you booking for someone else!)"></asp:Label>
                       <select id="traveler" runat="server" class="blue-text">
                           <option runat="server" value="yes">YES</option>
                           <option runat="server" value="no">NO</option>
                       </select>
                       <asp:Button id="b1" OnClick="b1_click" runat="server" class="btn waves-effect waves-light yellow blue-text" Text="Proceed"></asp:Button>
                    </div>
                     <br />
                      
                             
                         <div runat="server" class="col s12 m12 input-field" id="up">
                         <asp:Label id="label1" runat="server" class="blue-text" Text="Are you (or him/her) travelling alone?"></asp:Label>
                         <br />
                    
                             <asp:RadioButton id="r1" runat="server" Groupname="sd2" Text="yes"></asp:RadioButton>
                             <asp:RadioButton id="r2" runat="server" GroupName="sd2" Text="no"></asp:RadioButton>
                         <br />
                             <br />
                       <asp:Button id="Button1" OnClick="b2_click" runat="server" class="btn waves-effect waves-light yellow blue-text" Text="Proceed"></asp:Button>
                     
                     </div>
                   
                          <div id="family" runat="server">
                            <div class="row">
                               <asp:Button id="goback4" OnCommand="back_btn_click" CommandArgument="back1"  runat="server" class=" left btn waves-effect waves-light yellow blue-text" Text="GO BACK"></asp:Button>
                       <br />
                                <br />
                                </div>
                                <div class="row">
                                  <div class="col s12 m6 input-field">
                                      <asp:Label ID="l3" class="blue-text" runat="server">How many adults are travelling?(excluding you)</asp:Label>
                                         <asp:TextBox runat="server" ID="ad_count" class="blue-text" placeholder="Adults"></asp:TextBox>               
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ad_count" ValidationGroup="vg3" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                         
                                  </div>
                                   <div class="col s12 m6 input-field">
                                      <asp:Label ID="Label3" class="blue-text" runat="server">How many children are travelling?</asp:Label>
                                          <asp:TextBox runat="server" ID="ch_count" class="blue-text" placeholder="Children"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ch_count" ValidationGroup="vg3" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                      
                                   </div>    
                              </div>
                            <br />
                             <asp:Button id="Button2" OnClick="b3_click" ValidationGroup="vg3" UseSubmitBehavior="true" runat="server" class="btn waves-effect waves-light yellow blue-text" Text="Proceed"></asp:Button>
                            
                        </div>
                     <br />
                     <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                          
                                  <h6 class="center yellow-text">Loading...</h6> 
                          
                        </ProgressTemplate>
                    </asp:UpdateProgress> 

                    <div class="col s12 m12" id="new_traveller" runat="server" style="height:30em;overflow-y:auto" >
                       <div class="row">   
                        <asp:Button id="goback2" OnCommand="back_btn_click" CommandArgument="back2"  runat="server" class=" left btn waves-effect waves-light yellow blue-text" Text="GO BACK"></asp:Button>
                     <br />
                        </div> 
                        <br />
                        <div class="row"> 
                         <h6 class="teal-text"><strong>TOTAL CHARGES: <span id="charges_new" class="blue-text" runat="server"></span></strong></h6>
                 <br /> 
                            </div>
                              <h6 class="teal-text center"><strong>Provide the following details</strong></h6>
                        <asp:Label runat="server" ID="l2" Text="Booking For:(Name) " class="blue-text"></asp:Label>
                        <asp:TextBox runat="server" ID="traveller_name" class="blue-text"></asp:TextBox>
                        <asp:Label runat="server" ID="Label2" Text="Contact number of respective person" class="blue-text"></asp:Label>
                        <asp:TextBox runat="server" ID="traveller_contact" class="blue-text"></asp:TextBox> 
                     
                          <!-- DYNAMIC ROWS  -->  
                         <asp:panel ID="ph1" runat="server"></asp:panel>
                       
                        <br />
                        <asp:Button id="new_tr_btn" OnCommand="book_package"  CommandArgument="new" runat="server" class="btn waves-effect waves-light yellow blue-text" Text="Book Package"></asp:Button>
                     
                       
                    </div>

                    <div  class="col s12 m12" id="old_traveller" runat="server" >
                      <div class="row">    
                        <asp:Button id="goback3" OnCommand="back_btn_click" CommandArgument="back2"  runat="server" class=" left btn waves-effect waves-light yellow blue-text" Text="GO BACK"></asp:Button> 
                        <br />
                    </div>
                        <br />
                        <div class="row">
                              <h6 class="teal-text"><strong>TOTAL CHARGES: <span id="charges_old" runat="server"></span></strong></h6>
                 <br /> 
                </div>
                      <!-- DYNAMIC ROWS-->
                        <br />
                        <asp:panel ID="ph" runat="server"></asp:panel>
                       
                         <asp:Button id="old_tr_btn" OnCommand="book_package" CommandArgument="old" runat="server" class="btn waves-effect waves-light yellow blue-text" Text="Book Package"></asp:Button>
                     
                    </div>
                    
                     <div class="col s12 m12" id="final" runat="server">
                         <h6 class="teal-text">Congratulations!Your package has been booked</h6>
                         <br />
                         <h6 class="teal-text">The above displayed link is your e-ticket which will be converted later into hard copy 
                             ticket once all the necessary steps has been completed.For now, this eticket will work as your original ticket.
                             So,download it safely or else it will be available in your account in the <strong>HISTORY</strong> section.Thank You for choosing EASY-TRAVEL.
                         </h6>
                     </div>

                    </ContentTemplate>
                 </asp:UpdatePanel>

                     
            </div>
        </div>

        <div class="col s12 m1">
            <p class="white-text" id="l" runat="server"></p>
        </div>

    </div>

        </div>
         
    </form>

      <ul id="tlyPageGuide" class="pg1" data-tourtitle="Page Elements Explained!">
      <li class="tlypageguide_right" data-tourtarget=".one">
        <div>
            Here ,you can see a SAVE Button .It's use is similar to that of STARRED PLACES in other websites.You can save this place and later on when you visit the website,You can directly come to 
            this package from your HISTORY/STARRED-PLACES section.
        </div>
      </li>
      <li class="tlypageguide_right" data-tourtarget=".two">
        <div>
            This is the date when this trip is scheduled.
        </div>
      </li>
      <li class="tlypageguide_right" data-tourtarget=".three">
        <div>
            This package is provided to you by the mentioned agency.We are giving you all the details for the agency ,you can contact them for further information .
        </div>
      </li>
      <li class="tlypageguide_right" data-tourtarget=".four">
        <div>
            This is the section where you can book the package by providing the asked details.
       </div>
      </li>
      
    </ul>



      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
   
    <script>
     
        function SendAjax(type) {

           var xmlHttp;
            xmlHttp = null;

            if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                var strName = "Msxml2.XMLHTTP"
                if (navigator.appVersion.indexOf("MSIE 5.5") >= 0) {
                    strName = "Microsoft.XMLHTTP"
                }
                try {
                    xmlHttp = new ActiveXObject(strName);
                }
                catch (e) {
                    return false;
                }
            }

            if (xmlHttp != null) {
           

                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        var x=xmlHttp.responseText;
                        if($.trim(x)=="donesaving")
                        {
                                
                                    Materialize.toast('Saved',2000,'rounded');
                        }
                        else if($.trim(x)=="doneremoving")
                        {
                                    Materialize.toast('Removed from Saved Packages',2000,'rounded');
                        }
                        else
                        {
                            Materialize.toast('Error Occured ! Try Again Later!',2000,'rounded');
                            
                        }
                    }
                }

                xmlHttp.open("GET", "getstatus.aspx?type=" +type+"&user="+<%=user%>+"&package="+<%=package%>, true);
                xmlHttp.send();
            }
        }


      
        $(document).ready(function () {

            $('select').material_select();
        });


        $(document).on('click', '#status_div', function () {

            if ($(".saved").is(":visible")) {
                SendAjax("delete");
                $(".saved").fadeOut();
                setTimeout(function () {
                    $(".save").fadeIn();
                }, 410);
               
            }
            else {
           
                SendAjax("save");
                $(".save").fadeOut();
                setTimeout(function () {
                    $(".saved").fadeIn();
                }, 400);
              
            }


        });



        function check(x,y)
        {
            var x,y;   
            <% 
        if(Session["count_adult"]!=null && Session["count_child"]!=null)
        {
            %>
            
             x=<%=Session["count_adult"].ToString()%>;
            y=<%=Session["count_child"].ToString()%>;
            <%
        }
        %>
         
            alert(x+" "+y);
            var ct1=0;
            var ct2=0;
            for(var i=0;i<x;i++)
            {
                alert("in");
                var ele="adult_input"+(i+1);
                var value=document.getElementById(ele).value;
                if(value=="")
                {
                    Materialize.toast('Fill all the details',2000,'rounded');
                    return false;
                }
                else
                {
                    ct1++;
                }
            }
            
            for(var i=0;i<y;i++)
            {
                alert("in2");
                var ele="child_input"+(i+1);
                var value=document.getElementById(ele).value;
                if(value!="")
                {
                    Materialize.toast('Fill all the details',2000,'rounded');
                    return false;
                }
                else{
                    ct2++;
                }
            }

            if((ct1==x) && (ct2==y))
            {
                return true;
            }
            else
            {
             return false;
            }
           
        }

        function get_Value(){
         
            <% 
        if(Session["count_adult"]!=null && Session["count_child"]!=null)
        {
            %>
            
             x=parseint(<%=Session["count_adult"]%>);
            y=parseint(<%=Session["count_child"]%>);
            <%
        }
        %>
            alert("calling check");
            return check(x,y);
        }
     
    </script>

    <script src="Scripts/pageguide.min.js"></script>
                
    <script>
        jQuery(document).ready(function () {
          var pageguide=  tl.pg.init();
        });
    </script>
</body>
</html>
