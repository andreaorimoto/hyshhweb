<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CultivContactForm.ascx.cs"
    Inherits="CultivContactForm.CultivContactForm" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<form id="_cultivContactForm" runat="server">
<div id="cultivContact">
    <fieldset>
        <div class="inputRow">
            <asp:Label ID="_nameLabel" class="formLabel" runat="server" Text="Label"></asp:Label>
            <asp:TextBox runat="server" ID="_contactName" class="inputString"></asp:TextBox>
        </div>
        <div class="inputRow">
            <asp:Label ID="_emailLabel" class="formLabel" runat="server" Text="Label"></asp:Label>
            <asp:TextBox runat="server" ID="_contactEmail" class="inputString"></asp:TextBox>
        </div>
        <div class="errorMessage">
            <asp:RequiredFieldValidator ID="_rfvContactEmail" runat="server" ControlToValidate="_contactEmail"
                Display="Dynamic" />
            <asp:RegularExpressionValidator ID="_revContactEmail" runat="server" ControlToValidate="_contactEmail"
                ValidationExpression="[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?"
                Display="Dynamic" />
        </div>
        <div class="inputRow">
            <asp:Label ID="_messageLabel" class="formLabel" runat="server" Text="Label"></asp:Label>
            <asp:TextBox runat="server" ID="_contactMessage" class="inputArea" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="errorMessage">
            <asp:RequiredFieldValidator ID="_rfvContactMessage" runat="server" ControlToValidate="_contactMessage"
                Display="Dynamic" />
        </div>
        <div id="_recaptchaArea" runat="server">
            <div class="inputRowWide">
                <span class="inputRow">
                    <asp:Label ID="_recaptchaLabel" runat="server" Text=""></asp:Label></span> <span
                        class="inputRow errorMessageWide">
                        <br />
                        <asp:Label ID="_recaptchaErrorLabel" runat="server" Text="" Visible="false"></asp:Label></span>
                <!-- Note: you HAVE to have dummy keys else the control fails miserably -->
                <recaptcha:RecaptchaControl ID="_recaptcha" runat="server" PublicKey="." PrivateKey="." />
            </div>
        </div>
        <div class="submit">
            <asp:Button ID="_contactSubmitButton" runat="server" Text="Submit" OnClick="contactSubmitButton_Click" />
        </div>
    </fieldset>
</div>
</form>
