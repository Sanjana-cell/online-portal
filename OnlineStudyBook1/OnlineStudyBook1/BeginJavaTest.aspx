<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BeginJavaTest.aspx.cs" Inherits="BeginJavaTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js" type="text/javascript"></script>

</head>
<body oncontextmenu="return false" style=" background: #cccca0;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManger" runat="server"></asp:ScriptManager>

        <div style="background: #ddffca;margin:0 auto; width:1000px;">
            <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="float: left;"><b><span id="timerText"></span><span id="spnthankyou"></span></b></td>
                                        <td style="float: right; background-color: yellow; color: black;"><b><span id="lbresult"></span></b></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grdquestions" runat="server" AutoGenerateColumns="False" 
                                    OnRowDataBound="grdquestions_RowDataBound" DataKeyNames="QuestionId" 
                                    Width="100%" BackColor="White" BorderColor="White" BorderStyle="Ridge" 
                                    BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Online Test">
                                            <ItemTemplate>
                                                <table class="tableclass" id='<%#Eval("QuestionId") %>'>
                                                    <tr>
                                                        <td><b>Question <%#Eval("QuestionId") %> -: <%#Eval("Question") %></b>
                                                            <asp:HiddenField ID="hdnquestionId" runat="server"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <table class="tblOptions">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdOption1" runat="server" Text='<%#Eval("Option1") %>' GroupName='<%#Eval("QuestionId") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdOption2" runat="server" Text='<%#Eval("Option2") %>' GroupName='<%#Eval("QuestionId") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdOption3" runat="server" Text='<%#Eval("Option3") %>' GroupName='<%#Eval("QuestionId") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdOption4" runat="server" Text='<%#Eval("Option4") %>' GroupName='<%#Eval("QuestionId") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="lbquestionstatus" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="correctAnswer">Correct Answer Is -:
                                                                                    <asp:Label ID="lbAnswer" runat="server" Text='<%#Eval("QuestionAnswer") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                                </asp:GridView>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" OnClientClick="return CheckIfAllQuestionAnswerHasBeenSubmitted()" />
                              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                <asp:Button ID="BackToHome" runat="server" Text="Back To Home" 
                                    BackColor="Black" BorderColor="Black" Font-Bold="True" ForeColor="White" 
                                    Height="38px" Width="120px" BorderStyle="Solid" 
                                    onclick="BackToHome_Click"/>
                            </td>
                            </td>
                             
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <script>
                //Set the number of minutes you need
                var mins = 5;
                var secs = mins * 60;
                var currentSeconds = 0;
                var currentMinutes = 0;

                var ourtimer;
                function StartCountDown() {
                    ourtimer = setTimeout(Decrement, 1000);
                }

                function EndCountDown() {
                    clearTimeout(ourtimer);
                }

                $(document).ready(function () { StartCountDown(); }); //start the countdown

                function Decrement() {
                    currentMinutes = Math.floor(secs / 60);
                    currentSeconds = secs % 60;
                    if (currentSeconds <= 9) currentSeconds = "0" + currentSeconds;
                    secs--;
                    document.getElementById("timerText").innerHTML = "Time Remaining " + currentMinutes + ":" + currentSeconds;
                    if (secs !== -1) {
                        setTimeout('Decrement()', 1000);
                    }
                    else {
                        window.location.href = "OnlineTestForStudent.aspx?timeout=1"
                    }
                }

                function CheckIfAllQuestionAnswerHasBeenSubmitted() {
                    var numItems = $('.tblOptions').length;
                    var flagtocheckcount = 0;
                    $(".tblOptions").each(function () {
                        var groupname = $('input[type=radio]:first', this).attr('name');
                        if (!$("input[name='" + groupname + "']:checked").val()) {
                            $(this).parents(".tableclass").addClass("border");
                            var tableid = $(this).closest('table [class^="tableclass"]').attr("id");
                        }
                        else {
                            flagtocheckcount = flagtocheckcount + 1;
                        }
                    })

                    if (parseInt(flagtocheckcount) == parseInt(numItems)) {
                        var CountFinalResult = 0;
                        $(".tblOptions").each(function () {
                            var groupname = $('input[type=radio]:first', this).attr('name');
                            var radioId = $("input[name='" + groupname + "']:checked").attr("id")
                            var UserSelectedAnswer = $("label[for='" + radioId + "']").text();
                            var CorrectAnswer = $('span:last-child', this).text();
                            var CorrectAnswerSpanId = $('span:last-child', this).attr("id");
                            var QuestionStatus = $("span:nth-last-child(1)", this).attr("id");

                            if (CorrectAnswer == UserSelectedAnswer) {
                                $("#" + QuestionStatus).text("Correct Answer").css("color", "green");
                                $('td.correctAnswer').find("td.correctAnswer", this).css("display", "none");
                                CountFinalResult = CountFinalResult + 1;
                            }
                            else {
                                //$('table.tblOptions tbody tr td:last-child').addClass("incorrect");
                                $('span:last-child', this).css({ 'display': 'inline-flex' });
                                $("#" + QuestionStatus).text("InCorrect Answer").css({ 'color': 'Red' });
                                $('td.correctAnswer', this).css({ "display": "block", "background-color": "yellow", "color": "red" });

                            }
                        });
                        $("#lbresult").text("Final Result-:" + CountFinalResult + "/7");
                        $("#btnSubmit").attr("disabled", "disabled"); //disable button if all questions answer has been given
                        $("#btnSubmit").removeClass("btn");
                        $("#btnSubmit").addClass("btndiabled");
                        EndCountDown();
                        $("#timerText").css("display", "none");
                        $("#spnthankyou").append("Thank You for submitting your test.")
                        $("input[type=radio]").attr('disabled', true); //disable all radio button after test submitted by user
                        return false;
                    }
                    else {
                        return false;
                    }
                }

                var CountCheckCheckQuestion = 0; //following function will work on every radio button click
                var TotalQuestions = 0;
                $("input[type=radio]").click(function () {
                    var groupname = $(this).attr("name");
                    $(this).parents(".tableclass").removeClass("border");
                    CheckTheCountOfQuestionHasBeenAnswered();          //this function to check if all the answer given while selecting radio button you don't need.. 
                    // to click on submit button
                    if (parseInt(CountCheckCheckQuestion) == parseInt(TotalQuestions)) {
                        CheckIfAllQuestionAnswerHasBeenSubmitted();
                    }
                });


                function CheckTheCountOfQuestionHasBeenAnswered() {
                    TotalQuestions = $('.tblOptions').length;
                    var TotalGivenAnswerCount = 0;
                    var flagtocheckcount = 0;
                    $(".tblOptions").each(function () {
                        var groupname = $('input[type=radio]:first', this).attr('name');
                        if (!$("input[name='" + groupname + "']:checked").val()) {
                        }
                        else {
                            TotalGivenAnswerCount = TotalGivenAnswerCount + 1;
                        }
                    })
                    CountCheckCheckQuestion = TotalGivenAnswerCount;
                }

            </script>

            <style>
                .border {
                    border-color: red;
                    border-width: 2px;
                    border-style: solid;
                    width: 100%;
                }

                .correctAnswer {
                    display: none;
                    width: 950px!important;
                }

                .tblOptions {
                    width: 100%;
                }

                .btn {
                    background: #000000;
                    background-image: -webkit-linear-gradient(top, #000000, #2980b9);
                    background-image: -moz-linear-gradient(top, #000000, #2980b9);
                    background-image: -o-linear-gradient(top, #000000, #2980b9);
                    background-image: linear-gradient(to bottom, #000000, #2980b9);
                    -webkit-border-radius: 0;
                    -moz-border-radius: 0;
                    border-radius: 6px;
                    font-family: Arial;
                    color: #ffffff;
                    font-size: 19px;
                    padding: 3px 20px;
                    text-decoration: none;
                }

                .btn:hover {
                    background: #261c61;
                    background-image: -webkit-linear-gradient(top, #261c61, #3498db);
                    background-image: -moz-linear-gradient(top, #261c61, #3498db);
                    background-image: -o-linear-gradient(top, #261c61, #3498db);
                    background-image: linear-gradient(to bottom, #261c61, #3498db);
                    text-decoration: none;
                    cursor: pointer;
                }

                .btndiabled {
                    background: #bdb3bd;
                    background-image: -webkit-linear-gradient(top, #bdb3bd, #757575);
                    background-image: -moz-linear-gradient(top, #bdb3bd, #757575);
                    background-image: -o-linear-gradient(top, #bdb3bd, #757575);
                    background-image: linear-gradient(to bottom, #bdb3bd, #757575);
                    -webkit-border-radius: 0;
                    -moz-border-radius: 0;
                    border-radius: 6px;
                    font-family: Arial;
                    color: #ffffff;
                    font-size: 19px;
                    padding: 3px 20px;
                    text-decoration: none;
                    cursor: none;
                }
            </style>
        </div>
    </form>
</body>
</html>
