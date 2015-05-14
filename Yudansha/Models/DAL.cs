using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;

namespace Yudansha.Models
{
    public static class DAL
    {
        private static readonly DataSet1TableAdapters.QueriesTableAdapter queries = new DataSet1TableAdapters.QueriesTableAdapter();

        public static string[] ranks()
        {
            var allRanks = GetRanks();
            var theRanks = new List<string>();
            foreach (var item in allRanks)
            {
                theRanks.Add(item.RankName);
            }

            return theRanks.ToArray();
        }

        public static DataSet1.GetAllStudentsDataTable GetAllStudents(string dojo, string city, string country, string sensei)
        {
            var adapter = new DataSet1TableAdapters.GetAllStudentsTableAdapter();
            var table = new DataSet1.GetAllStudentsDataTable();

            if (!string.IsNullOrEmpty(dojo))
            {
                adapter.FillByDojo(table, dojo);
            }
            else if (!string.IsNullOrEmpty(city))
            {
                adapter.FillByCity(table, city);
            }
            else if (!string.IsNullOrEmpty(country))
            {
                adapter.FillByCountry(table, country);
            }
            else if (!string.IsNullOrEmpty(sensei))
            {
                adapter.FillBySensei(table, sensei);
            }
            else
            {
                adapter.Fill(table);
            }
            return table;
        }

        public static DataSet1.GetRanksDataTable GetRanks()
        {
            var table = (DataSet1.GetRanksDataTable)System.Web.HttpContext.Current.Cache["RanksCache"];
            if (table == null)
            {
                table = new DataSet1.GetRanksDataTable();
                var adapter = new DataSet1TableAdapters.GetRanksTableAdapter();
                adapter.Fill(table);
                System.Web.HttpContext.Current.Cache.Insert("RanksCache", table, null, DateTime.Now.AddHours(1), System.Web.Caching.Cache.NoSlidingExpiration);

            }
            return table;
        }

        public static DataSet1.GetAllStudentsDataTable GetAllStudentsEligibleForPromotion(int months, string rankName)
        {
            var adapter = new DataSet1TableAdapters.GetAllStudentsTableAdapter();
            var table = new DataSet1.GetAllStudentsDataTable();
            adapter.FillByEligibility(table, months, rankName);
            return table;
        }

        public static DataSet1.GetStudentsWithMissingRanksDataTable GetStudentsWithMissingRanks()
        {
            var adapter = new DataSet1TableAdapters.GetStudentsWithMissingRanksTableAdapter();
            var table = new DataSet1.GetStudentsWithMissingRanksDataTable();
            adapter.Fill(table);
            return table;
        }

        public static DataSet1.GetStudentDataTable GetStudent(int studentId)
        {
            var adapter = new DataSet1TableAdapters.GetStudentTableAdapter();
            var table = new DataSet1.GetStudentDataTable();
            adapter.Fill(table, studentId);
            return table;
        }

        public static DataSet1.GetStudentByFirstLastDataTable GetStudentByFirstLast(string first, string last)
        {
            var adapter = new DataSet1TableAdapters.GetStudentByFirstLastTableAdapter();
            var table = new DataSet1.GetStudentByFirstLastDataTable();
            adapter.Fill(table, first, last);
            return table;
        }

        public static DataSet1.GetRanksForStudentDataTable GetRanksForStudent(int studentId)
        {
            var adapter = new DataSet1TableAdapters.GetRanksForStudentTableAdapter();
            var table = new DataSet1.GetRanksForStudentDataTable();
            adapter.Fill(table, studentId);
            return table;
        }

        public static DataSet1.GetCitiesDataTable GetCities()
        {
            var adapter = new DataSet1TableAdapters.GetCitiesTableAdapter();
            var table = new DataSet1.GetCitiesDataTable();
            adapter.Fill(table);
            return table;
        }

        public static DataSet1.GetCountriesDataTable GetCountries()
        {
            var adapter = new DataSet1TableAdapters.GetCountriesTableAdapter();
            var table = new DataSet1.GetCountriesDataTable();
            adapter.Fill(table);
            return table;
        }

        public static DataSet1.StatsYudanshaByCountryDataTable GetStatsYudanshaByCountry()
        {
            var adapter = new DataSet1TableAdapters.StatsYudanshaByCountryTableAdapter();
            var table = new DataSet1.StatsYudanshaByCountryDataTable();
            adapter.Fill(table);
            return table;
        }

        public static DataSet1.StatsYudanshaByRankDataTable GetStatsYudanshaByRank()
        {
            var adapter = new DataSet1TableAdapters.StatsYudanshaByRankTableAdapter();
            var table = new DataSet1.StatsYudanshaByRankDataTable();
            adapter.Fill(table);
            return table;
        }

        public static DataSet1.StatsYudanshaRankByCountryDataTable GetStatsYudanshaRankByCountry()
        {
            var adapter = new DataSet1TableAdapters.StatsYudanshaRankByCountryTableAdapter();
            var table = new DataSet1.StatsYudanshaRankByCountryDataTable();
            adapter.Fill(table);
            return table;
        }

        public static DataSet1.StatsYudanshaRankByCountryByCityDataTable GetStatsYudanshaRankByCountryByCity()
        {
            var adapter = new DataSet1TableAdapters.StatsYudanshaRankByCountryByCityTableAdapter();
            var table = new DataSet1.StatsYudanshaRankByCountryByCityDataTable();
            //adapter.Fill(table);
            foreach (DataSet1.StatsYudanshaRankByCountryByCityRow row in table.Rows)
            {
                if (string.IsNullOrEmpty(row.Lat))
                {
                    row.Lat = row.Long = "0";
                }
            }
            return table;

        }

        public static void InsertRankForStudent(int studentId, string rankName, string rankSensei, string rankDojo, DateTime rankDate, string country, string city, string rankNumber)
        {
            queries.InsertRankForStudent(studentId, rankName, rankDate, rankDojo, rankSensei, country, city, rankNumber);
        }

        public static int? InsertStudent(string first, string last, string middle, string pictureUrl, string email)
        {
            int? studentId = null;
            queries.InsertStudent(first, last, middle, pictureUrl, email, ref studentId);
            return studentId;
        }

        public static void UpdateRankForStudent(int rankId, string rankName, string rankSensei, string rankDojo, DateTime rankDate, string country, string city, string rankNumber)
        {
            queries.UpdateRankForStudent(rankId, rankName, rankDate, rankDojo, rankSensei, country, city, rankNumber);
        }

        public static void UpdateStudent(int studentId, string first, string last, string middle, string pictureUrl, string email)
        {
            queries.UpdateStudent(studentId, first, last, middle, pictureUrl, email);
        }

        public static void UpdateStudentForgetMissingRanks(int Id, bool forgetMissingRanks)
        {
            queries.UpdateStudentForgetMissingRanks(forgetMissingRanks, Id);
        }

        public static void DeleteStudent(int studentId)
        {
            queries.DeleteStudent(studentId);
        }

        public static void DeleteRank(int rankId)
        {
            queries.DeleteRank(rankId);
        }

        public static string YudanshaBaseUrl()
        {
            return "/yudansha/";
        }
    }
}