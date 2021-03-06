﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Principal.Master" AutoEventWireup="true"
    CodeBehind="ConsultarPuntoServicio.aspx.cs" Inherits="UserInterface.Terminales.MantenimientoPuntoServicio.ConsultarPuntoServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 91px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%">
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <span class="titulo">Consultar Punto de Servicio</span>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
    </table>
    <table style="margin-left: auto; margin-right: auto;">
        <tr>
            <td class="style2">
                <span class="texto">Nombre</span>
            </td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <span class="texto">Estado</span>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="">Todos</asp:ListItem>
                    <asp:ListItem Value="true">Habilitado</asp:ListItem>
                    <asp:ListItem Value="false">Deshabilitado</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
   
    <table class="style1">
        <tr>
            <td>
                <asp:GridView ID="grvPuntoServicio" runat="server" DataSourceID="dsPuntoServicio"
                    AutoGenerateColumns="False" DataKeyNames="Id" OnDataBound="grvPuntoServicio_DataBound"
                    HorizontalAlign="Center">
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre"
                            ItemStyle-Width="150px">
                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="" HeaderText=""
                            ItemStyle-Width="400px">
                            <ItemStyle Width="400px"></ItemStyle>
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="Estado" HeaderText="Habilitado"/>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgModificar" runat="server" PostBackUrl='<%# "~/Terminales/MantenimientoPuntoServicio/ModificarPuntoServicio.aspx?Id="+ Eval("Id") %>'
                                    AlternateText="Modificar" Height="16px" ImageUrl="~/Includes/Imagenes/iconEdit.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgEliminar" runat="server" CommandName="Delete" AlternateText="Eliminar"
                                    ImageUrl="~/Includes/Imagenes/iconErase.png" OnClientClick="return confirm('Esta seguro que quiere eliminar el Punto de Servicio?')"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    
                </asp:GridView>
                <asp:ObjectDataSource ID="dsPuntoServicio" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="Buscar" 
                    DeleteMethod="Eliminar"
                    TypeName="BusinessLayer.Terminales.PuntoServicioBL"
                    DataObjectTypeName="BusinessEntity.PuntoServicio">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="estado" PropertyName="SelectedValue"
                            Type="String"/>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Button ID="btnAgregar" runat="server" PostBackUrl="~/Terminales/MantenimientoPuntoServicio/AgregarPuntoServicio.aspx"
                    Text="Agregar" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
