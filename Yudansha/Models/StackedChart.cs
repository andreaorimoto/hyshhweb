using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;


namespace Yudansha.Models
{
    [JsonObject(MemberSerialization.OptIn)]
    public class StackedChart
    {
        [JsonProperty]
        public string type { get; set; }
        [JsonProperty]
        public bool showInLegend { get; set; }
        [JsonProperty]
        public string name { get; set; }
        [JsonProperty]
        public string axisYType { get; set; }
        [JsonProperty]
        public string color { get; set; }
        [JsonProperty]
        public List<DataPoints> dataPoints { get; set; }
    }

    [JsonObject(MemberSerialization.OptIn)]
    public class DataPoints
    {
        [JsonProperty]
        public double y { get; set; }
        [JsonProperty]
        public string label { get; set; }

    }

}