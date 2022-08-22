<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="project.info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

          <style type="text/css">
              .tblinfo ,.table-condensed{
                  margin:auto;
                  
              }
               </style>
              <link type="text/css" href="css/Style.css" rel="stylesheet"  /> 

  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <div class="tblinfo1">
    <asp:GridView ID="information" runat="server"  CssClass="tblinfo "   Width="90%" >
    </asp:GridView>
    </div>
</asp:Content>
