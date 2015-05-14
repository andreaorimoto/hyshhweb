using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Yudansha.Models;

namespace Yudansha.usercontrols.yudansha
{
    public partial class AllStudents : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch (Exception)
            {

            }
        }

        protected void ObjectDataSource1_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["studentId"] = e.InputParameters["Id"];
            e.InputParameters.Remove("Id");
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {
                var studentDetailLink = (HyperLink)e.Row.FindControl("DetailLink");
                var rowView = (DataRowView)e.Row.DataItem;
                var item = (Yudansha.Models.DataSet1.GetAllStudentsRow)rowView.Row;
                studentDetailLink.NavigateUrl = string.Format("{0}studentdetail?studentId={1}", DAL.YudanshaBaseUrl(), item.Id.ToString());
                studentDetailLink.Text = string.Format("{2} {0} {1}", item.First, item.Middle, item.Last);

            }
        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["dojo"] = Request.QueryString["dojo"];
            e.InputParameters["city"] = Request.QueryString["city"];
            e.InputParameters["country"] = Request.QueryString["country"];
            e.InputParameters["sensei"] = Request.QueryString["sensei"];
        }

        protected void ObjectDataSource1_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
        }

        protected void ButtonDownload_Click(object sender, EventArgs e)
        {
            var data = DAL.GetAllStudents(Request.QueryString["dojo"], Request.QueryString["city"], Request.QueryString["country"], Request.QueryString["sensei"]);

            var now = DateTime.Now;
            var attachment = string.Format("attachment; filename=yudansha-{0}{1}{2}-{3}.xls", now.Year, now.Month, now.Day, now.Minute);
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            //Response.ContentType = "application/vnd.ms-excel"; 
            Response.ContentType = "application/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            // output header
            var tab = "\t";
            Response.Write("Full Name");
            Response.Write(tab + "Current Rank");
            Response.Write(tab + "Cert #");
            Response.Write(tab + "Rank Date");
            Response.Write(tab + "Dojo");
            Response.Write(tab + "Sensei");
            Response.Write(tab + "Country");
            Response.Write(tab + "City");
            Response.Write(tab + "Email");
            Response.Write("\n");

            foreach (DataSet1.GetAllStudentsRow dr in data.Rows)
            {
                Response.Write(dr.Last + " " + dr.First);
                Response.Write(tab + dr.RankName);
                Response.Write(tab + dr.RankNumber);
                Response.Write(tab + dr.RankDate.ToShortDateString());
                Response.Write(tab + dr.RankDojo);
                Response.Write(tab + dr.RankSensei);
                Response.Write(tab + dr.Country);
                Response.Write(tab + dr.City);
                Response.Write(tab + dr.Email);
                Response.Write("\n");
            }
            Response.End();
        }
    }
}