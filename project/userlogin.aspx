<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="project.userlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style>
      body {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: linear-gradient(45deg, greenyellow, dodgerblue);
  font-family: "Sansita Swashed", cursive;
}
.center {
  position: relative;
  padding: 50px 50px;
  background: #fff;
  border-radius: 10px;
  background-color:lightcyan;
}
.center .inputbox {
  position: relative;
  width: 300px;
  height: 50px;
  margin-bottom: 50px;
}
.center .inputbox input {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  border: 2px solid #000;
  outline: none;
  background: none;
  padding: 10px;
  border-radius: 10px;
  font-size: 1.2em;
}
.center .inputbox span {
  position: absolute;
  top: 14px;
  left: 20px;
  font-size: 1em;
  transition: 0.6s;
  font-family: sans-serif;
}
.center .inputbox input:focus ~ span,
.center .inputbox input:valid ~ span {
  transform: translateX(-13px) translateY(-35px);
  font-size: 1em;
}
.center .inputbox input:hover{
    background-color: lightgrey;
}
.center .inputbox .inputbox1 input:hover{
    background-color: darkgreen;
}
.center .inputbox .inputbox1 input{
    background-color: Highlight;
}
   </style>
    <script type="text/javascript">
        function validation() {
            var userid = document.getElementById("<%=userid.ClientID%>");
             var psw = document.getElementById("<%=password.ClientID%>");
            if (userid.value == null || userid.value == "") {
                alert("plese enter userid");
                return false;
            }
            else if (psw.value == null || psw.value == "") {
                alert("plese enter password");
                return false;
            }

        }
    </script>
</head>
<body  ><div class="center">
    <form id="form1" runat="server">
         <div class="inputbox">
        <asp:TextBox ID="userid" runat="server"></asp:TextBox><br />
             <span>Username</span>
             </div> 
        <div class="inputbox">
         <asp:TextBox  ID="password" runat="server" TextMode="Password"></asp:TextBox><br />
            <span>Password</span>
              <br />
        </div>
        <div class="inputbox">
            <div class="inputbox1">  
            <asp:Button  ID="login" runat="server" Text="Login" OnClick="login_Click"  OnClientClick="return validation()"/>
                </div>
           </div>
        <asp:Label ID="result" runat="server" Visible="false"></asp:Label>
    </form>
    </div>
</body>
</html>
