using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Yudansha.Models;

namespace Yudansha.usercontrols.yudansha
{
    public partial class StudentsWithMissingRanks : System.Web.UI.UserControl
    {
        private DataSet1.GetRanksForStudentDataTable allRanks;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (allRanks == null)
            {
                allRanks = DAL.GetRanksForStudent(0);
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {
                var studentDetailLink = (HyperLink)e.Row.FindControl("DetailLink");
                var labelDate = (Label)e.Row.FindControl("LabelDate");
                var rowView = (DataRowView)e.Row.DataItem;
                var item = (DataSet1.GetStudentsWithMissingRanksRow)rowView.Row;
                var studentUrl = string.Format("{0}studentdetail?studentId={1}", DAL.YudanshaBaseUrl(), item.Id);
                studentDetailLink.NavigateUrl = studentUrl;
                studentDetailLink.Text = string.Format("{2} {0} {1}", item.First, item.Middle, item.Last);
                try
                {
                    var now = DateTime.Now;
                    labelDate.Text = string.Format("{0}",
                        (now.Month - item.RankDate.Month) + 12 * (now.Year - item.RankDate.Year));
                }
                catch
                {
                }

                var LabelMissingRank = (Label)e.Row.FindControl("LabelMissingRanks");
                try
                {
                    LabelMissingRank.Text = (item.RankInt + 1 - item.RankCount).ToString();
                }
                catch
                {
                    LabelMissingRank.Text = "No Ranks";
                }
                try
                {
                    var gridViewRanks = (GridView)e.Row.FindControl("GridView2");
                    var studentRanks = allRanks.Select(string.Format("StudentsId={0}", item.Id));
                    gridViewRanks.DataSource = studentRanks;
                    gridViewRanks.DataBind();
                }
                catch (Exception exc)
                {

                }

                var buttonUpdateForget = (Button)e.Row.FindControl("Button1");
                var buttonGoToStudent = (Button)e.Row.FindControl("Button2");

                buttonUpdateForget.ToolTip = item.Id.ToString();
                buttonGoToStudent.ToolTip = studentUrl;
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            try
            {
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch
            {

            }

        }

        /// <summary>
        /// forget
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            DAL.UpdateStudentForgetMissingRanks(int.Parse(button.ToolTip), true);
            GridView1.DataBind();
        }

        /// <summary>
        /// go and edit
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            Response.Redirect(button.ToolTip, true);
        }
    }
}