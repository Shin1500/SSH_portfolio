using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace National_Hotel_Facilities_Status
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string url = "https://api.odcloud.kr/api/15118900/v1/uddi:b8fa9309-7c1f-415e-b706-9e189e4a056a?page=1&perPage=600&serviceKey=DWo2Zr7G7czaxChIQ%2BJvcwO05TMVXFLQZmS5yEHf26L8QRx4aecoldhI9qxZb9fxDkuRQEKoVR8PDp05CSBy0w%3D%3D";
            WebClient wc = new WebClient();
            wc.Encoding = Encoding.UTF8;
            var json = wc.DownloadString(url);
            var jArray = JObject.Parse(json);
            var jData = jArray["data"];

            dataGridView1.Rows.Clear();
            foreach (var item in jData)
            {
                dataGridView1.Rows.Add(item["결정 등급"].ToString(), item["지역"], item["주소"], item["호텔명"], item["전화번호"], item["객실수"], item["홈페이지"]);
            }
        }
    }
}
