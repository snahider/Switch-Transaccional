﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Principal.Master" AutoEventWireup="true"
    CodeBehind="AgregarProtocolo.aspx.cs" Inherits="UserInterface.Comunicacion.MantenimientoProtocolo.AgregarProtocolo" %>

<%@ Import Namespace="BusinessLayer.Comunicacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Includes/Js/jquery-1.2.6.js" type="text/javascript"></script>
    <script type="text/javascript">

        function ValidarRutaComponente(sender, args) {
            args.IsValid = true;
            if (document.getElementById
            ('<%= this.frmProtocolo.FindControl("drlTipoComunicacion").ClientID %>').value == '<%= TipoComunicacionBL.obtenerCodigoComponente().ToString() %>') {

                if (document.getElementById
                    ('<%= this.frmProtocolo.FindControl("drlComponente").ClientID %>').value == "-1") {
                    args.IsValid = false;
                }
            }
        }

        function ValidarClase(sender, args) {
            args.IsValid = true;
            if (document.getElementById
            ('<%= this.frmProtocolo.FindControl("drlTipoComunicacion").ClientID %>').value == '<%= TipoComunicacionBL.obtenerCodigoComponente().ToString() %>') {

                if (document.getElementById
                    ('<%= this.frmProtocolo.FindControl("txtNombreClase").ClientID %>').value == "") {
                    args.IsValid = false;
                }
            }
        }

        function ValidarMetodo(sender, args) {
            args.IsValid = true;
            if (document.getElementById
            ('<%= this.frmProtocolo.FindControl("drlTipoComunicacion").ClientID %>').value == '<%= TipoComunicacionBL.obtenerCodigoComponente().ToString() %>') {

                if (document.getElementById
                    ('<%= this.frmProtocolo.FindControl("txtNombreMetodo").ClientID %>').value == "") {
                    args.IsValid = false;
                }
            }
        }

        function ValidarPuerto(sender, args) {
            args.IsValid = true;
            if (document.getElementById
            ('<%= this.frmProtocolo.FindControl("drlTipoComunicacion").ClientID %>').value != '<%= TipoComunicacionBL.obtenerCodigoComponente().ToString() %>') {

                if (document.getElementById
                    ('<%= this.frmProtocolo.FindControl("txtPuerto").ClientID %>').value == "") {
                    args.IsValid = false;
                }
            }
        }

        function ValidarFrame(sender, args) {
            args.IsValid = true;
            if (document.getElementById
            ('<%= this.frmProtocolo.FindControl("drlTipoComunicacion").ClientID %>').value != '<%= TipoComunicacionBL.obtenerCodigoComponente().ToString() %>') {

                if (document.getElementById
                    ('<%= this.frmProtocolo.FindControl("drlFrame").ClientID %>').value == "-1") {
                    args.IsValid = false;
                }
            }
        }

        function ValidarCaracterInicio(sender, args) {
            args.IsValid = true;
            if (document.getElementById
            ('<%= this.frmProtocolo.FindControl("drlTipoComunicacion").ClientID %>').value != '<%= TipoComunicacionBL.obtenerCodigoComponente().ToString() %>') {

                if (document.getElementById
                    ('<%= this.frmProtocolo.FindControl("txtCaracterInicio").ClientID %>').value == "") {
                    args.IsValid = false;
                }
            }
        }

        function ValidarCaracterFin(sender, args) {
            args.IsValid = true;
            if (document.getElementById
            ('<%= this.frmProtocolo.FindControl("drlTipoComunicacion").ClientID %>').value != '<%= TipoComunicacionBL.obtenerCodigoComponente().ToString() %>') {

                if (document.getElementById
                    ('<%= this.frmProtocolo.FindControl("txtCaracterFin").ClientID %>').value == "") {
                    args.IsValid = false;
                }
            }
        }

        function IniciaComunicacion() {
            seleccionado = document.getElementById('<%= this.frmProtocolo.FindControl("chkIniciaComm").ClientID %>').checked;
            if (seleccionado) {
                document.getElementById('<%= this.frmProtocolo.FindControl("chkAceptaComm").ClientID %>').checked = false;
            }
        }

        function AceptaComunicacion() {
            seleccionado = document.getElementById('<%= this.frmProtocolo.FindControl("chkAceptaComm").ClientID %>').checked;
            if (seleccionado) {
                document.getElementById('<%= this.frmProtocolo.FindControl("chkIniciaComm").ClientID %>').checked = false;
            }
        }
    </script>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .columnaTitulo
        {
            width: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td style="text-align: center">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <span class="titulo">Agregar Protocolo</span>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:FormView ID="frmProtocolo" runat="server" DataSourceID="dsProtocolo" DefaultMode="Insert"
                    OnItemInserting="frmProtocolo_ItemInserting" HorizontalAlign="Center">
                    <InsertItemTemplate>
                        <table class="tabla_mantenimiento">
                            <tr>
                                <td class="columnaTitulo">
                                    <span class="texto">Nombre</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>' MaxLength="50"
                                        Width="220px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre"
                                        ErrorMessage="Debe ingresar el Nombre" ValidationGroup="IngresarProtocolo">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnaTitulo">
                                    <span class="texto">TimeOut Request </span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTimeOutRequest" runat="server" Text='<%# Bind("TimeoutRequest") %>'
                                        MaxLength="5" Width="65px" /><span class="texto">(seg)</span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTimeOutRequest"
                                        ErrorMessage="Debe ingresar el TimeOut Request" ValidationGroup="IngresarProtocolo"
                                        Display="Dynamic">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTimeOutRequest"
                                        ErrorMessage="Debe ingresar un valor válido en el TimeOut Request" ValidationExpression="\d*"
                                        ValidationGroup="IngresarProtocolo">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnaTitulo">
                                    <span class="texto">TimeOut Response </span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTimeOutResponse" runat="server" Text='<%# Bind("TimeoutResponse") %>'
                                        MaxLength="5" Width="65px" /><span class="texto">(seg)</span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTimeOutResponse"
                                        ErrorMessage="Debe ingresar el TimeOut Response" ValidationGroup="IngresarProtocolo"
                                        Display="Dynamic">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTimeOutResponse"
                                        ErrorMessage="Debe ingresar un valor válido para el TiimeOut Response" ValidationExpression="\d*"
                                        ValidationGroup="IngresarProtocolo">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnaTitulo">
                                    <span class="texto">Inicia Comunicaci&oacute;n</span>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkIniciaComm" runat="server" Checked='<%# Bind("IniciaComunicacio") %>'
                                        onClick="IniciaComunicacion()" />
                                </td>
                            </tr>
                            <tr>
                                <td class="columnaTitulo">
                                    <span class="texto">Acepta Comunicaci&oacute;n</span>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkAceptaComm" runat="server" Checked='<%# Bind("AceptaComunicacion") %>'
                                        onClick="AceptaComunicacion()" />
                                </td>
                            </tr>
                            <tr>
                                <td class="columnaTitulo">
                                    <span class="texto">Tipo Comunicaci&oacute;n</span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drlTipoComunicacion" runat="server" DataSourceID="dsTipoComunicacion"
                                        DataTextField="Nombre" DataValueField="Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                        AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTipoComunicacion" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="obtenerTipoComunicacion" TypeName="BusinessLayer.Comunicacion.TipoComunicacionBL">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </table>
                        <%if (((DropDownList)this.frmProtocolo.FindControl("drlTipoComunicacion")).SelectedValue == TipoComunicacionBL.obtenerCodigoComponente().ToString())
                          {%>
                        <div runat="server" id="divComponente">
                            <table class="tabla_mantenimiento">
                                <tr>
                                    <td class="columnaTitulo">
                                        <span class="texto">Componente</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drlComponente" runat="server" AppendDataBoundItems="True" DataSourceID="dsComponente"
                                            DataTextField="Nombre" DataValueField="Nombre" SelectedValue='<%# Bind("Componente") %>'>
                                            <asp:ListItem Value="-1">Seleccionar Componente</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsComponente" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="ObtenerTodos" TypeName="BusinessLayer.Parametros.ComponenteBL">
                                        </asp:ObjectDataSource>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="ValidarRutaComponente"
                                            ErrorMessage="Debe ingresar el Componente" ValidationGroup="IngresarProtocolo">*</asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnaTitulo">
                                        <span class="texto">Nombre Clase</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNombreClase" runat="server" Text='<%# Bind("Clase") %>' MaxLength="50"
                                            Width="220px" />
                                        <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="ValidarClase"
                                            ErrorMessage="Debe ingresar el Nombre Clase" ValidationGroup="IngresarProtocolo">*</asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnaTitulo">
                                        <span class="texto">Nombre M&eacute;todo</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNombreMetodo" runat="server" Text='<%# Bind("Metodo") %>' MaxLength="50"
                                            Width="220px" />
                                        <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="ValidarMetodo"
                                            ErrorMessage="Debe ingresar el Nombre Método" ValidationGroup="IngresarProtocolo">*</asp:CustomValidator>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%}%>
                        <%if (((DropDownList)this.frmProtocolo.FindControl("drlTipoComunicacion")).SelectedValue == TipoComunicacionBL.obtenerCodigoTCP().ToString())
                          {%>
                        <div runat="server" id="divTcp">
                            <table class="tabla_mantenimiento">
                                <tr>
                                    <td class="columnaTitulo">
                                        <span class="texto">Puerto</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPuerto" runat="server" Text='<%# Bind("Puerto") %>' MaxLength="6"
                                            Width="65px" />
                                        <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="ValidarPuerto"
                                            ErrorMessage="Debe ingresar el Puerto" ValidationGroup="IngresarProtocolo">*</asp:CustomValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPuerto"
                                            ErrorMessage="Debe ingresar un valor válido para el Puerto" ValidationExpression="\d*"
                                            ValidationGroup="IngresarProtocolo">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnaTitulo">
                                        <span class="texto">Frame</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drlFrame" runat="server" DataSourceID="dsFrame" DataTextField="Value"
                                            DataValueField="Key" SelectedValue='<%# Bind("Frame") %>' AppendDataBoundItems="True"
                                            AutoPostBack="True">
                                            <asp:ListItem Value="-1">Seleccionar Frame</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:CustomValidator ID="cvlFrame" runat="server" ClientValidationFunction="ValidarFrame"
                                            ErrorMessage="Debe ingresar el Frame" ValidationGroup="IngresarProtocolo">*</asp:CustomValidator>
                                        <asp:ObjectDataSource ID="dsFrame" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="obtenerFrame" TypeName="BusinessLayer.Comunicacion.FrameBL"></asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <%if (((DropDownList)this.frmProtocolo.FindControl("drlFrame")).SelectedValue == FrameBL.obtenerCodigoDelimitadores().ToString())
                                  {%>
                                <tr>
                                    <td class="columnaTitulo">
                                        <span class="texto">Caracter Inicio</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCaracterInicio" runat="server" Text='<%# Bind("CaracterInicio") %>'
                                            MaxLength="1" Width="30px"></asp:TextBox>
                                        <asp:CustomValidator ID="cvlCaracterInicio" runat="server" ClientValidationFunction="ValidarCaracterInicio"
                                            ErrorMessage="Debe ingresar el Caracter Inicio" ValidationGroup="IngresarProtocolo">*</asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnaTitulo">
                                        <span class="texto">Caracter Fin</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCaracterFin" runat="server" Text='<%# Bind("CaracterFin") %>'
                                            MaxLength="1" Width="30px"></asp:TextBox>
                                        <asp:CustomValidator ID="cvlCaracterFin" runat="server" ClientValidationFunction="ValidarCaracterFin"
                                            ErrorMessage="Debe ingresar el Caracter Fin" ValidationGroup="IngresarProtocolo">*</asp:CustomValidator>
                                    </td>
                                </tr>
                                <%}%>
                            </table>
                        </div>
                        <%}%>
                        <table class="tabla_mantenimiento" width="100%">
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <asp:Button ID="btnAgregar" runat="server" CommandName="Insert" Text="Agregar" ValidationGroup="IngresarProtocolo" />
                                    <asp:Button ID="btnCancelar" runat="server" PostBackUrl="~/Comunicacion/MantenimientoProtocolo/ConsultarProtocolo.aspx"
                                        Text="Cancelar" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="dsProtocolo" runat="server" DataObjectTypeName="BusinessEntity.Protocolo"
                    InsertMethod="Insertar" OldValuesParameterFormatString="original_{0}" SelectMethod="Obtener"
                    TypeName="BusinessLayer.Comunicacion.ProtocoloBL" OnInserted="dsProtocolo_Inserted">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:ValidationSummary ID="vlsProtocolo" runat="server" HeaderText="Se han producido los siguientes errores"
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="IngresarProtocolo" />
            </td>
        </tr>
    </table>
</asp:Content>
