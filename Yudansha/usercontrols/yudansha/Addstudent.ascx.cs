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
    public partial class Addstudent : System.Web.UI.UserControl
    {
        protected string first;
        protected string last;
        protected string middle;
        protected string email;
        private bool skipExisting = false;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ObjectDataSource3_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            if (!skipExisting)
            {
                first = e.InputParameters["first"].ToString();
                last = e.InputParameters["last"].ToString();
                middle = string.Empty;
                email = string.Empty;

                try { middle = e.InputParameters["middle"].ToString(); }
                catch { }
                try { email = e.InputParameters["email"].ToString(); }
                catch { }
                var existingStudents = DAL.GetStudentByFirstLast(first, last);
                if (existingStudents.Rows.Count != 0)
                {
                    PanelExistingStudents.Visible = true;
                    GridViewExistingStudents.DataSource = existingStudents;
                    GridViewExistingStudents.DataBind();
                    /*
                    (DetailsView1.FindControl("TextBoxFirst") as TextBox).Text = first;
                    (DetailsView1.FindControl("TextBoxLast") as TextBox).Text = last;
                    (DetailsView1.FindControl("TextBoxMiddle") as TextBox).Text = middle;
                    (DetailsView1.FindControl("TextBoxEmail") as TextBox).Text = email;
                     */
                    e.Cancel = true;
                }

            }

        }

        protected void ObjectDataSource3_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            Response.Redirect(string.Format("{1}studentdetail?studentId={0}", e.ReturnValue.ToString(), DAL.YudanshaBaseUrl()));
        }

        protected void ObjectDataSource3_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected void ObjectDataSource3_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {

        }

        protected void ObjectDataSource3_DataBinding(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(first))
            {
                (DetailsView1.FindControl("TextBoxFirst") as TextBox).Text = first;
                (DetailsView1.FindControl("TextBoxLast") as TextBox).Text = last;
                (DetailsView1.FindControl("TextBoxMiddle") as TextBox).Text = middle;
                (DetailsView1.FindControl("TextBoxEmail") as TextBox).Text = email;

            }
        }

        protected void CreateNewButton_Click(object sender, EventArgs e)
        {
            skipExisting = true;
            DetailsView1.InsertItem(true);
        }

        protected void GridViewExistingStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {
                var studentDetailLink = (HyperLink)e.Row.FindControl("DetailLink");
                var rowView = (DataRowView)e.Row.DataItem;
                var item = (DataSet1.GetStudentByFirstLastRow)rowView.Row;
                studentDetailLink.NavigateUrl = string.Format("{0}studentdetail?studentId={1}", DAL.YudanshaBaseUrl(), item.Id.ToString());
                studentDetailLink.Text = string.Format("{2} {0} {1}", item.First, item.Middle, item.Last);

            }
        }

    }
}