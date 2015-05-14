using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Yudansha.Models;
using Newtonsoft.Json;
using System.Text.RegularExpressions;
using System.IO;
using System.Data;

namespace Yudansha.usercontrols.yudansha
{
    public partial class YudanshaStats : System.Web.UI.UserControl
    {
        DataSet1.StatsYudanshaByCountryDataTable yudanshaByCountry;
        protected void Page_Load(object sender, EventArgs e)
        {
            yudanshaByCountry = DAL.GetStatsYudanshaByCountry(); ;
        }

        protected string GetYudanshaByCountry()
        {
            var returnString = string.Empty;
            foreach (var item in yudanshaByCountry)
            {
                returnString += string.Format("{{ y: {0}, legendText: \"{1}\", label: \"{1}\" }},", item.CountCountry,
                    item.Country);
            }
            return returnString.Substring(0, returnString.Length - 1);
        }

        protected string GetYudanshaByRank()
        {
            var yudanshaByRank = DAL.GetStatsYudanshaByRank();
            var returnString = string.Empty;
            foreach (var item in yudanshaByRank)
            {
                returnString += string.Format("{{ y: {0}, legendText: \"{1}\", label: \"{1}\" }},", item.CountRank,
                    item.RankName);
            }
            return returnString.Substring(0, returnString.Length - 1);
        }

        protected string GetYudanshaBycountryRank()
        {
            var yudanshaByCountryRank = DAL.GetStatsYudanshaRankByCountry();
            var rankArray = RankArray();

            // for each rank
            // create a stackedChart object
            // set name and color
            // for each country
            // create a dataPoints object
            // set y and label
            var returnString = string.Empty;

            foreach (var rank in rankArray)
            {
                var stackChart = new Models.StackedChart();
                stackChart.type = "stackedBar";
                stackChart.showInLegend = true;
                stackChart.name = rank.Key.ToString();
                stackChart.axisYType = "secondary";
                stackChart.color = rank.Value.ToString();
                stackChart.dataPoints = new List<DataPoints>();

                DataView dv = yudanshaByCountry.DefaultView;
                dv.Sort = "CountCountry asc";
                var sortedDT = dv.ToTable();

                foreach (DataRow item in sortedDT.Rows)
                {
                    var dataPoints = new Models.DataPoints();
                    dataPoints.label = item["Country"].ToString();
                    dataPoints.y = 0;

                    foreach (DataSet1.StatsYudanshaRankByCountryRow stats in yudanshaByCountryRank.Rows)
                    {
                        if (stats.Country.ToLower() == item["Country"].ToString().ToLower() && stats.RankName.ToLower() == rank.Key.ToString().ToLower())
                        {
                            dataPoints.y = stats.CountRank;
                            break;
                        }
                    }
                    stackChart.dataPoints.Add(dataPoints);
                }

                // deserializing removing quotes from properties, since CanvasJS charts require this format
                var serializer = new JsonSerializer();
                var stringWriter = new StringWriter();
                using (var writer = new JsonTextWriter(stringWriter))
                {
                    writer.QuoteName = false;
                    serializer.Serialize(writer, stackChart);
                }
                returnString += stringWriter.ToString();
                returnString += ",";
            }

            return returnString.Substring(0, returnString.Length - 1);
        }

        protected string GetCitiesLatLong()
        {
            // citymap['chicago'] = { center: new google.maps.LatLng(41.878113, -87.629798), population: 2714856 };

            var citiesLatLong = DAL.GetStatsYudanshaRankByCountryByCity();
            var returnString = string.Empty;
            foreach (DataSet1.StatsYudanshaRankByCountryByCityRow item in citiesLatLong)
            {
                returnString += string.Format("citymap['{0}'] = {{ center: new google.maps.LatLng({1}, {2}), population: {3} }};", item.City, item.Lat, item.Long, item.CountCity);
            }
            return returnString;
        }
        private Dictionary<string,string> RankArray()
        {
            var rankList = new Dictionary<string,string>();
            foreach (var item in DAL.GetRanks())
            {
                rankList.Add(item.RankName, item.RankColor);
            }

            return rankList;

        }
    }

}