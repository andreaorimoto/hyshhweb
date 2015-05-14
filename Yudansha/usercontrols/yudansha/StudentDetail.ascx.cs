using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Yudansha.Models;

namespace Yudansha.usercontrols.yudansha
{
    public partial class StudentDetail : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["studentId"]))
            {
                RedirectToHome();
            }
        }

        protected string GetCities()
        {
            var citiesTable = DAL.GetCities();
            if (citiesTable.Rows.Count == 0) return string.Empty;
            var cities = citiesTable.Aggregate(string.Empty, (current, city) => current + ("'" + city.City + "',"));
            return cities.Substring(0, cities.Length - 1);
        }

        protected string GetCountries()
        {
            var countriesTable = DAL.GetCountries();
            if (countriesTable.Rows.Count == 0) return string.Empty;
            var countires = countriesTable.Aggregate(string.Empty, (current, country) => current + ("'" + country.Country + "',"));
            return countires.Substring(0, countires.Length - 1);
        }

        protected void ObjectDataSource2_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["RankId"] = e.InputParameters["original_Id"];
            e.InputParameters.Remove("original_Id");
        }

        protected void ObjectDataSource2_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["studentId"] = Request.QueryString["studentId"];
        }

        protected void ObjectDataSource2_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["RankId"] = e.InputParameters["original_Id"];
            e.InputParameters.Remove("original_Id");
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri, true);
        }

        protected void ObjectDataSource1_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["studentId"] = e.InputParameters["original_Id"];
            e.InputParameters.Remove("original_Id");
        }

        protected void ObjectDataSource1_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["studentId"] = e.InputParameters["original_Id"];
            e.InputParameters.Remove("original_Id");
        }

        protected void ObjectDataSource1_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            RedirectToHome();
        }

        private void RedirectToHome()
        {
            Response.Redirect(DAL.YudanshaBaseUrl(), true);
        }

        protected void DropDownList1_Load(object sender, EventArgs e)
        {
            AddRankNamesToDropDown(sender);
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            var dropDownlList = ((DetailsView)sender).FindControl("DropDownList1") as DropDownList;
            e.Values.Add("RankName", dropDownlList.SelectedValue);
        }

        protected void DropDownList2_Load(object sender, EventArgs e)
        {
            AddRankNamesToDropDown(sender);
        }

        private void AddRankNamesToDropDown(object sender)
        {
            var list = (DropDownList)sender;
            if (list.Items.Count == 0)
            {
                foreach (var item in DAL.ranks())
                {
                    list.Items.Add(item);
                }
            }

        }
    }
}