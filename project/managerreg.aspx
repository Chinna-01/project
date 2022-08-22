<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="managerreg.aspx.cs" Inherits="project.mangerreg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link type="text/css" href="css/Style.css" rel="stylesheet"  /> 
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="reg">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<label class="fo">  REGISTRATION FORM </label><br />
          <label class="fo">   Enter Employee id*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox CssClass="textbox" ID="loginid" runat="server" ></asp:TextBox>
            <br />
           <label class="fo"> Enter Frist Name*</label>&nbsp;&nbsp;&nbsp;
            <asp:TextBox CssClass="textbox" ID="fristname" runat="server"></asp:TextBox>
            <br />
           <label class="fo"> Enter Last Name *</label>&nbsp;&nbsp;
            <asp:TextBox CssClass="textbox" ID="lastname" runat="server"  TextMode="phone" ></asp:TextBox>
            <br />
           <label class="fo"> Select Gender*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="male" runat="server"  GroupName="a" Text="Male" style="color:white"/>
&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="female"  runat="server" GroupName="a" Text="Female"  style="color:white" />
            <br />
            <label class="fo">Enter age*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox CssClass="textbox" ID="age" runat="server"  MaxLength="2"  onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32)"></asp:TextBox>
            <br />
            <label class="fo"> Enter password*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox CssClass="textbox" ID="password" runat="server" TextMode="Password" ></asp:TextBox>
            <br />
           <label class="fo"> Confirm password *</label>
            <asp:TextBox CssClass="textbox" ID="cpassword" runat="server"  TextMode="Password" ></asp:TextBox>
            <br />
            <Label class="fo" >Department</Label> <asp:DropDownList runat="server" ID="dept">
               <asp:ListItem>--select--</asp:ListItem>
                <asp:ListItem>.Net Developer</asp:ListItem>
                <asp:ListItem>Q/A team</asp:ListItem>
                <asp:ListItem>Android Developer</asp:ListItem>
            </asp:DropDownList><br />
          <label class="fo">Select Qulification</label>   
            <asp:CheckBox style="color:white" ID="ug" runat="server" Text="Under Graduation" /><br />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:CheckBox style="color:white" ID="pg" runat="server" Text="Post Graduation" /><br />
            <asp:Button  ID="reg" runat="server" Text="Registration" OnClientClick="return validate()" OnClick="reg_Click" /><br />
            <asp:Label style="color:white" ID="Label1" runat="server" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <br />
        </div>
  <script>
      function validate() {
          var uid = document.getElementById("<%=loginid.ClientID%>").value;
          var fn = document.getElementById("<%=fristname.ClientID%>").value;
          var ln = document.getElementById("<%=lastname.ClientID%>").value;
          var ag = document.getElementById("<%=age.ClientID%>").value;
          var pw = document.getElementById("<%=password.ClientID%>").value;
          var cpw = document.getElementById("<%=cpassword.ClientID%>").value;
          var rol = document.getElementById("<%=dept.ClientID%>").value;
          var pg1 = document.getElementById("<%=pg.ClientID%>").checked;
          var ug1 = document.getElementById("<%=ug.ClientID%>").checked;
         <%-- var m = document.getElementById("<%=male.ClientID%>").checked;
          var f = document.getElementById("<%=female.ClientID%>").checked;--%>
          if (uid == null || uid == "") {
              alert("id should not be empty");
              return false;
          }
          else if (fn == null || fn == "") {
              alert("frist name should not be empty");
              return false;
          }
          else if (ln == null || ln == "") {
              alert("last name should not be empty");
              return false;
          }
          else if (document.getElementById("<%=male.ClientID%>").checked == false && document.getElementById("<%=female.ClientID%>").checked == false) {
              alert("please select gender");
              return false;
          }
          else if (ag == null || ag == "") {
              alert(" age should not be empty");
              return false;
          }
          else if (pw == null || pw == "") {
              alert(" password should not be empty");
              return false;
          }
          else if (cpw == null || cpw == "") {
              alert("conform password should not be empty");
              return false;
          }
          else if (pw != cpw) {
              alert("password and conform password should be same");
              return false;
          }
          else if (rol == "--select--") {
              alert("please select department");
              return false;
          }
          else if (pg1 == false && ug1 == false) {
              alert("please select qulification");
              return false;
          }
        
      }
  </script>
</asp:Content>
